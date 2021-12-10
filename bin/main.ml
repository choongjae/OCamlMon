open Yojson.Basic.Util
open Graphics
open Game
open State
open Room
open Tile
open Parser

let mainWorldlist = []

let tsprite =
  "data/player.json" |> Yojson.Basic.from_file |> member "sprite2"

let spritelist = tsprite |> to_list

let player = spritelist |> parse_list parse_color |> Array.of_list

(** [moveto (x,y)] is the same as graphic's [moveto], except this takes an
    explicit pair. Makes code cleaner. *)
let moveto (x, y) = moveto x y

(** [draw_image sp (x,y)] is the same as graphic's [draw_image], except this
    takes an explicit pair. Makes code cleaner. *)
let draw_image sp (x, y) = draw_image sp x y

(** [draw_square (x, y) f b] draws a 25x25 pixel square with the bottom-left
    corner at [(x, y)], with a fill color [f] and border color [b]. *)
let draw_square (x, y) fill border =
  set_color fill;
  fill_rect x y 25 25;
  set_color border;
  draw_rect x y 25 25

(** [is_exit x y r] is whether or not the given coordinates [(x, y)]
    correspond to a valid exit in the given room [r]. *)
let rec is_exit (x, y) = function
  | [] -> false
  | h :: t ->
      if x == fst h.coordinates && y == snd h.coordinates then true
      else is_exit (x, y) t

(** [helper r x y] is a helper function for [stay_or_exit] TODO: More
    descriptive name. *)
let rec take_exit room (x, y) = function
  | [] -> room
  | h :: t ->
      if (x, y) = h.coordinates then h.name else take_exit room (x, y) t

(** [enter_room r x y] is the string for the room that the player should be
    in after moving, depending on their current room [r] and their current
    position [(x, y)] *)
let enter_room room (x, y) =
  let room' = room_of_string room in
  let pos_exits = room'.exits in
  take_exit room (x, y) pos_exits

(** [new_room_coords x y] is the position of the player of the next room
    after taking an exit. For instance, if the player exits to the right of
    a room, their start position of the next room will be on the left. *)
let exit_coord (x, y) =
  if x = -25 then (475, y)
  else if x = 500 then (0, y)
  else if y = -25 then (x, 475)
  else (x, 0)

(** [draw_room arr] draws the tiles of the room array [arr] to the current
    graphics screen *)
let draw_room room_array =
  for row = 0 to 20 do
    for col = 0 to 20 do
      let fill = get_color room_array.(row).(col) in
      draw_square (col * 25, 500 - (25 * row)) fill black
    done
  done

(** [move st (x, y) (u, v) sp f] moves the character from its initial
    position of [(x, v)] to [(u, v)], according to the current state [st].
    Note that these coordinates correspond to the bottom-left corner of the
    grid square that the character is on. We use auto_synchronize to batch
    the operations of filling in the old tile with [f] and drawing the
    sprite [sp] on the new tile. *)
let move st (x0, y0) (x1, y1) sp fill =
  let room = current_room st in
  if
    is_exit (x1, y1) (room_of_string room).exits
    || (x1 >= 0 && y1 >= 0 && x1 < 500 && y1 < 500)
  then (
    let room' = enter_room room (x1, y1) in
    let x1, y1 = if room' = room then (x1, y1) else exit_coord (x1, y1) in
    let st' = update_state room' (x1, y1) Walk in
    let is_new_room = room' <> room in
    (* Need to do save this bool because I cant figure out to only have
       conditional and make the drawing order correct. If someone figures
       out a better way feel free to change -CJ *)
    moveto (x1, y1);
    auto_synchronize false;
    if is_new_room then draw_room (room_layout (current_room st'));
    draw_image sp (x1, y1);
    if not is_new_room then draw_square (x0, y0) fill black;
    auto_synchronize true;
    st')
  else st

(** [test_print_poke n] prints a random Pokemon encounter depending on state
    [n] if it occurs. Using for testing purposes before implementing battle
    engine *)
let test_print_poke next_state =
  (* TODO: This needs to be called in [move], rather than calling it in
     [play] *)
  let curr_room = current_room next_state in
  let curr_tile = get_tile (current_coord next_state) curr_room in
  let gen_poke_test =
    if generate_encounter () then
      match generate_pokemon curr_tile with
      | Some poke -> print_endline poke.name
      | None -> ()
  in
  match curr_tile with
  | Path _ -> ()
  | _ -> gen_poke_test

(** [play st sp] is the main game loop for running OCamlMon, where [st]
    represents the current state that the player is in and [sp] is the
    player's sprite. *)
let rec play st sp =
  try
    let status = wait_next_event [ Key_pressed ] in
    if status.keypressed then
      if status.key = 'q' then raise Exit
      else
        let x, y = current_coord st in
        let tile_color = get_color (get_tile (x, y) (current_room st)) in
        match status.key with
        | 'w' ->
            let next = move st (x, y) (x, y + 25) sp tile_color in
            test_print_poke next;
            play next sp
        | 'a' ->
            let next = move st (x, y) (x - 25, y) sp tile_color in
            test_print_poke next;
            play next sp
        | 's' ->
            let next = move st (x, y) (x, y - 25) sp tile_color in
            test_print_poke next;
            play next sp
        | 'd' ->
            let next = move st (x, y) (x + 25, y) sp tile_color in
            test_print_poke next;
            play next sp
        | _ -> play st sp
  with
  | Exit -> clear_graph ()
(* idk why clear_graph works the best *)

(** [init_game n] begins running the main game loop with the [n]
    customization details that the user provided. *)
let init_game name =
  open_graph " 500x500";
  set_window_title "OCamlMon";
  let curr_state = init_state in
  draw_room (room_layout (current_room curr_state));
  let sp = make_image player in
  let x, y = current_coord curr_state in
  moveto (x, y);
  draw_image sp (x, y);
  play curr_state sp

(** [main ()] prompts for the game to play, then starts it. *)
let main () =
  ANSITerminal.print_string [ ANSITerminal.red ]
    "\nWelcome to the world of OCámlMon! \n";
  print_endline "Please enter your name: ";
  print_string "> ";
  match read_line () with
  | exception End_of_file -> ()
  | name -> init_game name

(* Execute the game engine. *)
let () = main ()
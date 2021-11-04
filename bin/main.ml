open Yojson.Basic.Util
open Graphics
open Game
open State
open Room
open Tile

let mainWorldlist = []

(** [parse_color c] is the Graphics library color type corresponding to an
identically-named string [c]. Defaults to white if there is no match. *)
let parse_color c =
  let c = to_string c in
  match c with
  | "transp" -> transp
  | "black" -> black
  | "white" -> white
  | "red" -> red
  | "green" -> red
  | "blue" -> blue
  | "yellow" -> yellow
  | "cyan" -> cyan
  | "magenta" -> magenta
  | _ -> white

(** [parse_inner_list j] is the color list of [j], where [j] is a Yojson.Basic.t
list of colors represented as strings, essentially for an inner-list of the 2D
list from the JSON file. *)
let rec parse_inner_list j =
  match j with
  | [] -> []
  | h :: t -> parse_color h :: parse_inner_list t

(** [parse_list j] is the color array list of the Yojson.Basic.t list [j],
where [j] is a 2D list containing more Yojson.Basic.t lists of the color values
for the sprite *)
let rec parse_list j = 
  match j with
  | [] -> []
  | h :: t -> (h |> to_list |> parse_inner_list |> Array.of_list) :: parse_list t

let tsprite = "data/player.json" |> Yojson.Basic.from_file |> member "sprite"
let spritelist = tsprite |> to_list
let player = spritelist |> parse_list |> Array.of_list

(** [draw_square (x, y) f b] draws a 25x25 pixel square with the bottom-left
corner at [(x, y)], with a fill color [f] and border color [b]. *)
let draw_square (x, y) fill border = begin
  set_color fill;
  fill_rect x y 25 25;
  set_color border;
  draw_rect x y 25 25;
end

(** [is_exit x y r] is whether or not the given coordinates [(x, y)] correspond
to a valid exit in the given room [r]. *)
let rec is_exit (x,y) = function
| [] -> false
| h :: t -> 
  if x == fst(h.coordinates) && y == snd(h.coordinates) then true
  else is_exit (x,y) t

(** [helper r x y] is a helper function for [stay_or_exit]
TODO: More descriptive name. *)
let rec helper room (x,y) = function
| [] -> room
| h :: t -> 
  if (x == fst(h.coordinates) && y == snd(h.coordinates)) then h.name
  else helper room (x,y) t

(** [stay_or_exit r x y] is the string for the room that the player should
be in after moving, depending on their current room [r] and their current
position [(x, y)] *)
let stay_or_exit room (x, y) = begin
  let the_room = string_to_room room in
  let pos_exits = the_room.exits in
  helper room (x,y) pos_exits
end

(** [get_exit_start_pos x y] is the position of the player of the next room
after taking an exit. For instance, if the player exits to the right of a room,
their start position of the next room will be on the left. *)
let get_exit_start_pos (x, y) = begin
  if x = -25 then (475, y)
  else if x = 500 then (0, y)
  else if y = -25 then (x, 475)
  else (x, 0)
end

(** [draw_room arr] draws the tiles of the room array [arr] to the current
graphics screen *)
let draw_room room_array = begin
  for row = 0 to 20 do
    for col = 0 to 20 do
      let fill = (get_color room_array.(row).(col)) in
      draw_square ((col*25),((500-25*row))) fill black
    done;
  done;
end

(** [move (x, y) (u, v)] moves the character from its initial position of 
[(x, v)] to [(u, v)]. Note that these coordinates correspond to the bottom-left
corner of the grid square that the character is on. We also use auto_synchronize
to batch the operations of filling in the old/new squares. *)
let move room (xinit, yinit) (xlast, ylast) sprite fill = begin
  (* print_endline (string_of_int xlast);
    print_endline (string_of_int ylast);
  if is_exit (xlast, ylast) (string_to_room room).exits then
    print_endline "is exit";
  if (xlast >= 0 && ylast >= 0 && xlast <=500 && ylast <= 500) then
    print_endline "in bounds"; *)
  if is_exit (xlast, ylast) (string_to_room room).exits ||
    (xlast >= 0 && ylast >= 0 && xlast < 500 && ylast < 500) then
    (moveto xlast ylast;
    auto_synchronize false;
    draw_image sprite xlast ylast;
    draw_square (xinit, yinit) fill black;
    auto_synchronize true;
    let new_room = stay_or_exit room (xlast, ylast) in
    let new_coord = 
      (if new_room = room then (xlast, ylast) 
      else get_exit_start_pos (xlast, ylast))
      in 
    let n_state = update_state new_room new_coord Walk in
    if new_room <> room then draw_room (room_layout (get_current_room n_state));
    n_state)
  else
    update_state room (xinit, yinit) Walk
end

(** [test_print_poke n] prints a random Pokemon encounter depending on state [n]
if it occurs. Using for testing purposes before implementing battle engine *)
let test_print_poke next_state = begin
  let curr_room = get_current_room next_state in
  let curr_tile = get_tile (get_current_coord next_state) curr_room in
  let gen_poke_test = if generate_encounter () then
    match generate_pokemon curr_tile with
    | Some poke -> print_endline poke.name 
    | None -> () in
    match curr_tile with 
    | Path _ -> ()
    | _ -> gen_poke_test
end

(** [play s] is the main game loop for running OCamlMon, where [s] represents
the current state that the player is in. *)
let rec play curr_state = 
  let player_sprite = make_image player in
    let fst_coord = (fst (get_current_coord curr_state)) in
    let snd_coord = (snd (get_current_coord curr_state)) in
    moveto fst_coord snd_coord;
    draw_image player_sprite fst_coord snd_coord;
    (* print_endline(string_of_int (fst (get_current_coord curr_state))); *)
    (* draw_square (250, 250) black black; *)
    (* draw_string "P"; *)
    try
      let st = wait_next_event [Key_pressed;] in
        if st.keypressed then
          if st.key = 'q' then raise Exit else
          if st.key = 'c' then clear_graph () else
            let (a,b) = get_current_coord curr_state in
              (* print_endline(string_of_int b); *)
              let pad_color = get_color (get_tile (a,b) (get_current_room curr_state)) in
              match st.key with
              | 'w' -> let next = move (get_current_room curr_state) (a, b) (a, b+25) player_sprite pad_color in test_print_poke next; play next;
              (* in let curr_room = get_current_room next in let curr_tile = get_tile (get_current_coord next) curr_room in 
              (match curr_tile with Path _ -> () | _ -> (match generate_pokemon curr_tile with Some poke -> (print_endline poke.name)));
              print_endline (get_color_string curr_tile) ;play next; *)
              | 'a' -> let next = move (get_current_room curr_state) (a, b) (a-25, b) player_sprite pad_color in test_print_poke next; play next;
              | 's' -> let next = move (get_current_room curr_state) (a, b) (a, b-25) player_sprite pad_color in test_print_poke next; play next;
              | 'd' -> let next = move (get_current_room curr_state) (a, b) (a+25, b) player_sprite pad_color in test_print_poke next; play next;
              | _ -> ();
    with 
    | Exit | Graphic_failure("fatal I/O error") -> close_graph ()

(** [play_game n] begins running the main game loop with the [n] customization
details that the user provided. *)
let play_game name =
  open_graph " 500x500";
  set_window_title "OCamlMon";
  (* set_color green; *)
  let curr_state = init_state in
  draw_room (room_layout (get_current_room curr_state));
  play curr_state
  

(** [main ()] prompts for the game to play, then starts it. *)
let main () =
  ANSITerminal.print_string [ ANSITerminal.red ]
    "\nWelcome to the world of OCámlMon! \n";
  print_endline
    "Please enter your name: ";
  print_string "> ";
  match read_line () with
  | exception End_of_file -> ()
  | name -> play_game (name)

(* Execute the game engine. *)
let () = main ()
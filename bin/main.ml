open Yojson.Basic.Util
open Graphics
open Game
open State
open Room
open Tile
open Parser
open Trainer
open Pokemon
open Drawing
open Battle
open Menu

let mainWorldlist = []

(* let tsprite = "data/player.json" |> Yojson.Basic.from_file |> member
   "sprite"

   let spritelist = tsprite |> to_list

   let player = spritelist |> parse_list parse_color |> Array.of_list *)

(** [is_exit x y r] is whether or not the given coordinates [(x, y)]
    correspond to a valid exit in the given room [r]. *)
let rec is_exit (x, y) = function
  | [] -> false
  | h :: t ->
      if x == fst h.coordinates && y == snd h.coordinates then true
      else is_exit (x, y) t

(** [take_exit r (x, y)] is the room cooresponding with the exit as (x, y) *)
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

let draw_pokecenter coord =
  let pokecenter =
    make_image
      ("data/rooms.json" |> Yojson.Basic.from_file |> member "pokecenter_building"
     |> to_list |> parse_list parse_color |> Array.of_list)
  in
  draw_image pokecenter coord

(** [draw_room arr] draws the tiles of the room array [arr] to the current
    graphics screen *)
let draw_room st =
  let room_array = room_layout (current_room st) in
  for row = 0 to 20 do
    for col = 0 to 20 do
      let fill = get_color room_array.(row).(col) in
      draw_square (col * 25, 500 - (25 * row)) fill black
    done
  done;
  for row = 0 to 20 do
    for col = 0 to 20 do
      if string_of_tile room_array.(row).(col) = "Build" then
        draw_pokecenter (col * 25, 500 - (25 * row))
    done
  done

let encounter st =
  let room = current_room st in
  let tile = get_tile (current_coord st) room in
  if generate_encounter () then
    match generate_pokemon tile with
    | Some poke ->
        let action =
          init_battle (current_trainer st) [ poke ] (get_color tile)
        in
        update_action st (Battle action)
    | None -> st
  else st

(** [test_print_poke n] prints a random Pokemon encounter depending on state
    [n] if it occurs. Using for testing purposes before implementing battle
    engine *)
(* let encounter st = let room = current_room st in let tile = get_tile
   (current_coord st) room in let gen_poke_test = if generate_encounter ()
   then match generate_pokemon tile with | Some poke -> print_endline
   poke.name | None -> () in match tile with | Path _ -> () | _ ->
   gen_poke_test *)

(** [move st (x, y) (u, v) sp f] moves the character from its initial
    position of [(x, v)] to [(u, v)], according to the current state [st].
    Note that these coordinates correspond to the bottom-left corner of the
    grid square that the character is on. We use auto_synchronize to batch
    the operations of filling in the old tile with [f] and drawing the
    sprite [sp] on the new tile. *)
let move st (x0, y0) (x1, y1) sp fill =
  let room = current_room st in
  let next_tile =
    try string_of_tile (get_tile (x1, y1) room) with
    | Invalid_argument _ -> "Useless"
  in
  if
    is_exit (x1, y1) (room_of_string room).exits
    || ((x1 >= 0 && y1 >= 0 && x1 < 500 && y1 < 500)
    && next_tile <> "Unwal" && next_tile <> "Build")
  then (
    let trainer = current_trainer st in
    let room' = enter_room room (x1, y1) in
    let x1, y1 = if room' = room then (x1, y1) else exit_coord (x1, y1) in
    let st' = update_state room' (x1, y1) Walk trainer in
    let is_new_room = room' <> room in
    (* Need to do save this bool because I cant figure out to only have
       conditional and make the drawing order correct. If someone figures
       out a better way feel free to change -CJ *)
    moveto (x1, y1);
    auto_synchronize false;
    if is_new_room then draw_room st';
    draw_image sp (x1, y1);
    if not is_new_room then draw_square (x0, y0) fill black;
    auto_synchronize true;
    (* match encounter st' with | Some p -> print_endline p.name; st' | None
       -> st' *)
    encounter st')
  else st

let switch_to_room st sp =
  draw_room st;
  draw_image sp (current_coord st)

let battle st sp key =
  let b = current_battle st in
  let data = update_battle_menu (current_trainer st) b key in
  match data.menu with
  | Flee ->
      switch_to_room st sp;
      update_action st Walk
  | menu -> update_action st (Battle data)

(*[menu st] opens up the menu options including bag and team *)

(** [play st sp] is the main game loop for running OCamlMon, where [st]
    represents the current state that the player is in and [sp] is the
    player's sprite. *)
let rec play st sp =
  try
    let status = wait_next_event [ Key_pressed ] in
    if status.keypressed then
      (* if status.key = 'q' then raise Exit else *)
      match current_action st with
      | Walk -> begin
          let x, y = current_coord st in
          let tile_color = get_color (get_tile (x, y) (current_room st)) in
          match status.key with
          | 'w' ->
              let next = move st (x, y) (x, y + 25) sp tile_color in
              play next sp
          | 'a' ->
              let next = move st (x, y) (x - 25, y) sp tile_color in
              play next sp
          | 's' ->
              let next = move st (x, y) (x, y - 25) sp tile_color in
              play next sp
          | 'd' ->
              let next = move st (x, y) (x + 25, y) sp tile_color in
              play next sp
          | 'm' ->
              print_endline "Opening Menu";
              play st sp
          | _ -> play st sp
        end
      | Battle p -> play (battle st sp status.key) sp
      | Menu _ -> failwith "Unimplemented"
      | Talk -> failwith "Unimplemented"
  with
  | Exit -> clear_graph ()
  | Graphic_failure f -> clear_graph ()
(* | _ -> clear_graph () *)
(* | _ -> clear_graph () *)
(* idk why clear_graph works the best *)

(** [init_game n] begins running the main game loop with the [n]
    customization details that the user provided. *)
let init_game name starter =
  open_graph " 500x500";
  set_window_title "OCamlMon";
  let trainer = init_trainer name starter in
  let st = init_state trainer in
  draw_room st;
  let sp =
    make_image
      ("data/player.json" |> Yojson.Basic.from_file |> member "sprite"
     |> to_list |> parse_list parse_color |> Array.of_list)
  in
  let x, y = current_coord st in
  moveto (x, y);
  draw_image sp (x, y);
  play st sp

(** [main ()] prompts for the game to play, then starts it. *)
let rec main () =
  let name = name () in
  let starter = starter name false in
  confirm name starter;
  init_game name starter

and name () =
  ANSITerminal.print_string [ Bold ]
    " \n\n\n\n\n\
    \     ██████╗  ██████╗ █████╗ ███╗   ███╗██╗     ███╗   ███╗ ██████╗ \
     ███╗   ██╗\n\
    \    ██╔═══██╗██╔════╝██╔══██╗████╗ ████║██║     ████╗ \
     ████║██╔═══██╗████╗  ██║\n\
    \    ██║   ██║██║     ███████║██╔████╔██║██║     ██╔████╔██║██║   \
     ██║██╔██╗ ██║\n\
    \    ██║   ██║██║     ██╔══██║██║╚██╔╝██║██║     ██║╚██╔╝██║██║   \
     ██║██║╚██╗██║\n\
    \    ╚██████╔╝╚██████╗██║  ██║██║ ╚═╝ ██║███████╗██║ ╚═╝ \
     ██║╚██████╔╝██║ ╚████║\n\
    \     ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ \
     ╚═╝  ╚═══╝\n\
    \    ";
  print_bold "\nWelcome to the world of ";
  print_emph ANSITerminal.Red "OCamlMon! \n \n";
  print_string "What's your ";
  print_emph ANSITerminal.Yellow "name? \n";
  print_string "> ";
  match read_line () with
  | name -> name
  | exception End_of_file -> name ()

and starter name repeated =
  if not repeated then (
    print_newline ();
    print_emph ANSITerminal.Green name;
    print_endline "! Nice to meet you!";
    print_endline
      "Now, you have a choice. Which starter Pokemon would you like?\n")
  else (
    print_newline ();
    print_string "Sorry, ";
    print_emph ANSITerminal.Green name;
    print_string ". I didn't understand that. \n";
    print_endline "Do you mind saying which Pokemon you would like again?\n");
  print_emph ANSITerminal.Blue "Squirtle     ";
  print_emph ANSITerminal.Green "Bulbasaur    ";
  print_emph ANSITerminal.Red "Charmander    ";

  print_emph ANSITerminal.Yellow "Pikachu     \n";
  print_string "> ";
  match read_line () with
  | s -> begin
      try make_starter_pokemon (String.lowercase_ascii s) with
      | Failure f -> starter name true
    end
  | exception End_of_file -> starter name true

and confirm name starter =
  print_newline ();
  print_emph ANSITerminal.Blue (string_of_poke starter.t_poke);
  print_endline " – that's a great choice. \n";
  print_string "Well, ";
  print_emph ANSITerminal.Green name;
  print_endline ", I hope you're ready to go an adventure!\n";
  print_endline "Enter any character to enter the world of OCamlMon!";
  print_string "> ";
  match read_line () with
  | _ -> ()

(* Execute the game engine. *)
let () = main ()
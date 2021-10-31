open Graphics
open Game
open State
open Room
open Tile

let mainWorldlist = []

(*hi im sab*)
let player = 
  (*  1       2       3       4       5       6       7       8       9       10       11      12    13(m)    14      15      16      17      18      19      20      21      22      23      24     25 *)
  [|
    [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
    [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; red   ; transp; transp; transp; transp; transp; red   ; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; yellow; black ; black ; black ; black ; black ; black ; black ; yellow; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; black ; yellow; yellow; yellow; yellow; yellow; yellow; yellow; yellow; yellow; black ; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; yellow; yellow; yellow; black ; yellow; yellow; yellow; black ; yellow; yellow; yellow; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; yellow; transp; black ; yellow; yellow; yellow; black ; yellow; yellow; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; yellow; yellow; red   ; red   ; red   ; yellow; yellow; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; yellow; black ; black ; black ; black ; black ; black ; black ; black ; yellow; yellow; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; yellow; black ; black ; black ; black ; black ; black ; black ; black ; yellow; yellow; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; red   ; red   ; black ; black ; black ; red   ; red   ; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; black ; black ; red   ; red   ; red   ; black ; black ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; black ; black ; red   ; red   ; red   ; black ; black ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; black ; black ; black ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; transp; transp; transp; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; transp; transp; transp; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|]
  |]

(** [draw_square (x, y) f b] draws a 25x25 pixel square with the bottom-left
corner at [(x, y)], with a fill color [f] and border color [b]. *)
let draw_square (x, y) fill border = begin
  set_color fill;
  fill_rect x y 25 25;
  set_color border;
  draw_rect x y 25 25;
end

let rec is_exit (x,y) = function
| [] -> false
| h :: t -> 
  if (x == fst(h.coordinates) && y == snd(h.coordinates)) then true
  else is_exit (x,y) t

let rec helper room (x,y) = function
| [] -> room
| h :: t -> 
  if (x == fst(h.coordinates) && y == snd(h.coordinates)) then h.name
  else helper room (x,y) t

let stay_or_exit room (x, y) = begin
  let the_room = string_to_room room in
  let pos_exits = the_room.exits in
  helper room (x,y) pos_exits
end

let get_exit_start_pos (x, y) = begin
  if x = -25 then (500, y)
  else if x = 525 then (0, y)
  else if y = -25 then (x, 500)
  else (x, 0)
end

(** [move (x, y) (u, v)] moves the character from its initial position of 
[(x, v)] to [(u, v)]. Note that these coordinates correspond to the bottom-left
corner of the grid square that the character is on. We also use auto_synchronize
to batch the operations of filling in the old/new squares. *)
let move room (xinit, yinit) (xlast, ylast) sprite fill = begin
  if is_exit (xlast, ylast) (string_to_room room).exits || (xlast >= 0 && ylast >= 0 && xlast <=500 && ylast <= 500) then
    (moveto xlast ylast;
    auto_synchronize false;
    draw_image sprite xlast ylast;
    draw_square (xinit, yinit) fill black;
    auto_synchronize true;
    let new_room = stay_or_exit room (xlast, ylast) in
    let new_coord = 
      (if new_room = room then (xlast, ylast) else get_exit_start_pos (xlast, ylast))
      in 
    update_state new_room new_coord Walk (*this needs to be updated based on actions*))
  else
    update_state room (xinit, yinit) Walk
end

let draw_room room_array = begin
  for row = 0 to 20 do
    for col = 0 to 20 do
      let fill = (get_color room_array.(row).(col)) in
      draw_square ((col*25),((500-25*row))) fill black
    done;
  done;
end

let rec play curr_state = 
  draw_room (room_layout (get_current_room curr_state));

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
              | 'w' -> let next = move (get_current_room curr_state) (a, b) (a, b+25) player_sprite pad_color 
              in let curr_room = get_current_room next in let curr_tile = get_tile (get_current_coord next) curr_room in 
              (* (match curr_tile with Path _ -> () | _ -> (match generate_pokemon curr_tile with Some poke -> (print_endline poke.name))); *)
              print_endline (get_color_string curr_tile) ;play next;
              | 'a' -> let next = move (get_current_room curr_state) (a, b) (a-25, b) player_sprite pad_color in play next;
              | 's' -> let next = move (get_current_room curr_state) (a, b) (a, b-25) player_sprite pad_color in play next;
              | 'd' -> let next = move (get_current_room curr_state) (a, b) (a+25, b) player_sprite pad_color in play next;
              | _ -> ();
    with 
    | Exit | Graphic_failure("fatal I/O error") -> close_graph ()

(** [play_game n] begins running the main game loop with the [n] customization
details that the user provided. *)
let play_game name =
  open_graph " 600x600";
  set_window_title "OCamlMon";
  (* set_color green; *)
  let curr_state = init_state in
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
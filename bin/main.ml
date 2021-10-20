(* Use [ocaml bin/main.ml] to run as script (while in root directory) *)
#use "topfind";;
#require "Graphics";;
#require "ANSITerminal";;
open Graphics
let mainWorldlist = []

(*NEED STATE TO KEEP TRACK OF ROOMS*)
(** Primitive prototype of making the player sprite *)
let player = 
  (*   1     2       3       4     5       6     7       8      9      10    11    12    13(m)   14      15     16     17     18    19    20      21     22     23     24     25 *)
  [|
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;black;transp;transp;transp;black;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;black;transp;transp;transp;black;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;black;transp;transp;transp;black;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;black;transp;transp;transp;transp;transp;transp;transp;black;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;black;transp;transp;transp;transp;transp;black;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;black;black;black;black;black;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|];
  [|transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp;transp|]
  |]

(** [draw_square (x, y) f b] draws a 25x25 pixel square with the bottom-left
corner at [(x, y)], with a fill color [f] and border color [b]. *)
let draw_square (x, y) fill border = begin
  set_color fill;
  fill_rect x y 25 25;
  set_color border;
  draw_rect x y 25 25;
end

let draw_main_exits _ = begin
  set_color red;
  fill_rect 250 0 25 15;
  fill_rect 0 400 15 25;
  fill_rect 510 100 15 25;
end

(*draws the exits for bottom room*)
let draw_bot_exits _ = begin
  set_color red;
  fill_rect 250 510 25 15;
end

(*draws the exits for left room*)
let draw_left_exits _ = begin
  set_color red;
  fill_rect 0 100 15 25;
end

(*draws the exits for right room*)
let draw_right_exits _ = begin
  set_color red;
  fill_rect 510 100 15 25;
end

let touch_bot_exit (xpos, ypos) = begin
  if xpos = 250 && ypos < 0 then true else false
end

let touch_left_exit(xpos, ypos) = begin
  if xpos < 0 && ypos = 400 then true else false
end

let touch_right_exit(xpos, ypos) = begin
  if xpos > 510 && ypos = 100 then true else false
end

let draw_home _ = begin
  for x = 0 to 21 do
    for y = 0 to 21 do
      draw_square ((x*25), (y*25)) green black
    done;
  done;
  draw_main_exits ();
end

let draw_bot _ = begin
  for x = 0 to 21 do
    for y = 0 to 21 do
      draw_square ((x*25), (y*25)) blue black
    done;
  done;
  draw_bot_exits ();
end

let draw_left _ = begin
  for x = 0 to 21 do
    for y = 0 to 21 do
      draw_square ((x*25), (y*25)) blue black
    done;
  done;
  draw_left_exits ();
end

let draw_right _ = begin
  for x = 0 to 21 do
    for y = 0 to 21 do
      draw_square ((x*25), (y*25)) blue black
    done;
  done;
  draw_right_exits ();
end

let react_touch_bot sprite = begin
  draw_bot ();
  moveto 250 500;
  draw_image sprite 250 500;
end

let react_touch_left sprite = begin
  draw_left ();
  moveto 500 400;
  draw_image sprite 500 400;
end

let react_touch_right sprite = begin
  draw_right ();
  moveto 0 100;
  draw_image sprite 0 100;
end


(** [move (x, y) (u, v)] moves the character from its initial position of 
[(x, v)] to [(u, v)]. Note that these coordinates correspond to the bottom-left
corner of the grid square that the character is on. We also use auto_synchronize
to batch the operations of filling in the old/new squares. *)
let move (xinit, yinit) (xlast, ylast) sprite fill = begin
  (* if xlast > 0 && ylast > 0 && xlast < 500 && ylast < 500 then *)
  if touch_bot_exit (xlast, ylast) then
    react_touch_bot sprite
  else if touch_left_exit (xlast, ylast) then
    react_touch_left sprite
  else if touch_right_exit (xlast, ylast) then
    react_touch_right sprite
  else
    moveto xlast ylast;
    auto_synchronize false;
    (* draw_square (xlast, ylast) black black; *)
    draw_image sprite xlast ylast;
    draw_square (xinit, yinit) green black;
    auto_synchronize true;
  (* synchronize(); *)
end

(** [play_game n] begins running the main game loop with the [n] customization
details that the user provided. *)
let play_game name =
  open_graph " 525x525";
  set_window_title "OCamlMon";
  set_color green;

  draw_home ();

  let player_sprite = make_image player in
    moveto 250 250;
    draw_image player_sprite 250 250;
    (* draw_square (250, 250) black black; *)
    (* draw_string "P"; *)
    try
      while true do
        let st = wait_next_event [Key_pressed;] in
        if st.keypressed then
          if st.key = 'q' then raise Exit else
          if st.key = 'c' then clear_graph () else
            let (a,b) = current_point() in
              match st.key with
              | 'w' -> move (a, b) (a, b+25) player_sprite green;
              | 'a' -> move (a, b) (a-25, b) player_sprite green;
              | 's' -> move (a, b) (a, b-25) player_sprite green;
              | 'd' -> move (a, b) (a+25, b) player_sprite green; (*have to find way to modularize to get correct fill based on room*)
              | _ -> ();
      done
    with Exit -> close_graph ()

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
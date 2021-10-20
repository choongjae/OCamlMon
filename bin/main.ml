(* Use [utop -init bin/main.ml] to run (while in main directory) *)
#require "Graphics";;
#require "ANSITerminal";;
open Graphics
let mainWorldlist = []

(** [draw_square (x, y) f b] draws a 25x25 pixel square with the bottom-left
corner at [(x, y)], with a fill color [f] and border color [b]. *)
let draw_square (x, y) fill border = begin
  set_color fill;
  fill_rect x y 25 25;
  set_color border;
  draw_rect x y 25 25;
end

(** [move (x, y) (u, v)] moves the character from its initial position of 
[(x, v)] to [(u, v)]. Note that these coordinates correspond to the bottom-left
corner of the grid square that the character is on. We also use auto_synchronize
to batch the operations of filling in the old/new squares. *)
let move (xinit, yinit) (xlast, ylast) = begin
  moveto xlast ylast;
  auto_synchronize false;
  draw_square xlast ylast black black;
  draw_square xinit yinit green black;
  auto_synchronize true;
  (* synchronize(); *)
end

(** [play_game n] begins running the main game loop with the [n] customization
details that the user provided. *)
let play_game name =
  open_graph " 525x525";
  set_window_title "OCamlMon";
  set_color green;

  for x = 0 to 21 do
    for y = 0 to 21 do
      draw_square (x*25) (y*25) green black
    done;
  done;

  moveto 250 250;
  try
    while true do
      let st = wait_next_event [Key_pressed;] in
      if st.keypressed then
        if st.key = 'q' then raise Exit else
        if st.key = 'c' then clear_graph () else
          let (a,b) = current_point() in
            match st.key with
            | 'w' -> move (a, b) (a, b+25);
            | 'a' -> move (a, b) (a-25, b);
            | 's' -> move (a, b) (a, b-25);
            | 'd' -> move (a, b) (a+25, b);
            | _ -> ();
    done
  with Exit -> close_graph; ()

(** [main ()] prompts for the game to play, then starts it. *)
let main () =
  ANSITerminal.print_string [ ANSITerminal.red ]
    "\n\nWelcome to the world of OCámlMon! \n";
  print_endline
    "Please enter your name: ";
  print_string "> ";
  match read_line () with
  | exception End_of_file -> ()
  | name -> play_game (name)

(* Execute the game engine. *)
let () = main ()
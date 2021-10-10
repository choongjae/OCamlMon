#require "Graphics";;
#require "ANSITerminal";;
open Graphics

let play_game name =
  open_graph " 500x500";
  set_window_title "OCamlMon";
  set_color black;
  let pointx = 0 in
  let pointy = 0 in
  plot 250 250;
  (* plot 0 0; *)
  foreground = red;
  rmoveto 250 250;
  draw_rect 0 0 25 25;
  fill_rect 0 0 25 25;
  try
    while true do
      let st = wait_next_event [Key_pressed;] in
      synchronize();
      if st.keypressed then
        if st.key = 'q' then raise Exit else
          let (a,b) = current_point() in
            if st.key = 'w' then 
              moveto a (b+25);
            if st.key = 'a' then
              moveto (a-25) b;
            if st.key = 's' then
              moveto (a) (b-25);
            if st.key = 'd' then
              moveto (a+25) (b);
            let (a,b) = current_point() in
              draw_rect (a) (b) 25 25;
    done
  with Exit -> close_graph ()

(** [main ()] prompts for the game to play, then starts it. *)
let main () =
  ANSITerminal.print_string [ ANSITerminal.red ]
    "\n\nWelcome to the world of OCámlMon!";
  print_endline
    "Please enter your name: ";
  print_string "> ";
  match read_line () with
  | exception End_of_file -> ()
  | name -> play_game (name)
(* Execute the game engine. *)
let () = main ()

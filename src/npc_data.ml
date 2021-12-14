open Pokemon
open Graphics
open Drawing
open State
open Battle

type gym_leader = string * pokemon list

(** GYM LEADER KIMMY'S POKEMON STATS*)
let kimmy_squirtle =
  {
    name = "Squirtle";
    t_poke = Squirtle;
    moves = squirtle_moves;
    stats = { health = 150; level = 8; xp = 0 };
  }

let kimmy_sandshrew =
  {
    name = "Sandshrew";
    t_poke = Sandshrew;
    moves = squirtle_moves;
    stats = { health = 200; level = 10; xp = 0 };
  }

let kimmy = ("KIMMY", [ kimmy_squirtle; kimmy_sandshrew ])

let sabrina_eevee =
  {
    name = "Eevee";
    t_poke = Eevee;
    moves = eevee_moves;
    stats = { health = 100; level = 6; xp = 0 };
  }

let sabrina_bulbasaur =
  {
    name = "Bulbasaur";
    t_poke = Bulbasaur;
    moves = bulb_moves;
    stats = { health = 200; level = 7; xp = 0 };
  }

let sabrina = ("SABRINA", [ sabrina_eevee; sabrina_bulbasaur ])

let cj_geodude =
  {
    name = "Geodude";
    t_poke = Geodude;
    moves = geodude_moves;
    stats = { health = 150; level = 7; xp = 0 };
  }

let cj = ("CJ", [ cj_geodude ])

let rec wait_keypress cont =
  if cont = true then ()
  else
    let status = wait_next_event [ Key_pressed ] in
    match status.key with
    | 'e' -> wait_keypress true
    | _ -> wait_keypress false

let clear_dialogue () =
  fill_draw_rect (66, 16) 368 84 blue black;
  fill_draw_rect (70, 20) 360 75 white black

let kimmy_battle st room trainer_name =
  clear_dialogue ();
  set_text_size 40;
  draw_text (80, 70) "KIMMY: tiktok tiktok";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) (trainer_name ^ ": . . .");
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70)
    "KIMMY: A hourglass that doesn't have any sand just causes";
  draw_text (80, 50) " everyone to waste their time.";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) "KIMMY: So don't waste my time.";
  wait_keypress false;
  let battle_data = init_battle (current_trainer st) (snd kimmy) 0xf1c40f in
  update_state room (current_coord st) (Battle battle_data)
    (current_trainer st)

let sabrina_battle st room trainer_name =
  clear_dialogue ();
  set_text_size 40;
  draw_text (80, 70) "SABRINA: hehe";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) (trainer_name ^ ": ?!");
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) "SABRINA: All my homies are wary of me...";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70)
    "SABRINA: But isn't life a game of russian roulette anyways";
  draw_text (80, 50) "hehehehe";
  wait_keypress false;
  let battle_data =
    init_battle (current_trainer st) (snd sabrina) 0x6f83a3
  in
  update_state room (current_coord st) (Battle battle_data)
    (current_trainer st)

let cj_battle st room trainer_name =
  clear_dialogue ();
  set_text_size 40;
  draw_text (80, 70) "CJ: Zzzzz";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) (trainer_name ^ ": Uh... hello there?");
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) "CJ: *sniff*";
  wait_keypress false;
  draw_text (80, 50) "ZzZZzzzz";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) (trainer_name ^ ": Helloooooo ??!!");
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) "CJ: ZzzzzZzzzZzzzzzzz";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) (trainer_name ^ ": HELLLLLOOOOOO!!!!!!!");
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) "CJ: AAAAAAA";
  wait_keypress false;
  draw_text (80, 50) "AAAAAAA";
  wait_keypress false;
  draw_text (80, 30) "AAAAAAACHHOOOOOOO";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) "CJ: Ok fine, let's do this.";
  wait_keypress false;
  let battle_data = init_battle (current_trainer st) (snd cj) 0x808080 in
  update_state room (current_coord st) (Battle battle_data)
    (current_trainer st)

(** [draw_wait ()] draws the ". . . " while pokemon are healing *)
let draw_wait () =
  clear_dialogue ();
  draw_text (80, 70) ".";
  Unix.sleep 1;
  draw_text (90, 70) ".";
  Unix.sleep 1;
  draw_text (100, 70) ".";
  Unix.sleep 1

let flush_kp () =
  while key_pressed () do
    let _ = read_key () in
    ()
  done

let nurse_joy_interaction st =
  let trainer_name = String.uppercase_ascii (current_trainer st).name in
  clear_dialogue ();
  set_text_size 40;
  draw_text (80, 70)
    ("JOY: Hi " ^ trainer_name ^ "! I really hope you are taking care of");
  draw_text (80, 50) "your OCamlMon!";
  wait_keypress false;
  clear_dialogue ();
  draw_text (80, 70) "Give me one second as your pokemon are resting up!";
  wait_keypress false;
  draw_wait ();
  flush_kp ();
  clear_dialogue ();
  draw_text (80, 70) "OK! All done. Best of luck with your adventure!!";
  wait_keypress false;
  update_state (current_room st) (current_coord st) Walk
    (current_trainer st)

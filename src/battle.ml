(* Battle text -> Text in main rectangle *)
(* Friendly status -> Player's pokemon status bar *)
(* Enemy status -> Enemy pokemon status bar *)
(* Menu -> Menu navigation in bottom right - Fight, Bag, OCamlMon, Run *)
open Graphics
open Drawing
open Pokemon

(* CONSTANTS *)

type main_text_positions = {
  fight : int * int;
  bag : int * int;
  ocamlmon : int * int;
  run : int * int;
  friendly : int * int;
  enemy : int * int;
}

let main_text =
  {
    fight = (260, 70);
    bag = (385, 70);
    ocamlmon = (260, 20);
    run = (385, 20);
    friendly = (250, 250);
    enemy = (250, 250);
  }

let main_underline_pos =
  {
    fight = (260, 68);
    bag = (385, 68);
    ocamlmon = (260, 18);
    run = (385, 18);
    friendly = (250, 250);
    enemy = (250, 250);
  }

type move_text_positions = {
  first : int * int;
  second : int * int;
  third : int * int;
  fourth : int * int;
}

let move_text =
  {
    first = (80, 65);
    second = (250, 65);
    third = (80, 25);
    fourth = (250, 25);
  }

let move_circle =
  {
    first = (70, 71);
    second = (240, 71);
    third = (70, 31);
    fourth = (240, 31);
  }

type bag_text_positions = {
  potions : int * int;
  pokeballs : int * int;
}

let bag_text = { potions = (150, 45); pokeballs = (300, 45) }

let bag_circle = { potions = (140, 51); pokeballs = (290, 51) }

type team_text_positions = {
  one : int * int;
  two : int * int;
  three : int * int;
  four : int * int;
  five : int * int;
  six : int * int;
}

let team_text =
  {
    one = (80, 65);
    two = (200, 65);
    three = (320, 65);
    four = (80, 25);
    five = (200, 25);
    six = (320, 25);
  }

let team_circle =
  {
    one = (70, 71);
    two = (190, 71);
    three = (310, 71);
    four = (70, 31);
    five = (190, 31);
    six = (310, 31);
  }

type battle_menu =
  | Main of int
  | Fight of int
  | Bag of int
  | OCamlMon of int
  | Flee

type battle_data = {
  enemy : pokemon;
  enemy_team : pokemon list;
  menu : battle_menu;
}

(* END CONSTANTS *)

let reset_battle_text () = fill_draw_rect (0, 0) 250 100 white black

let draw_battle_text top bottom =
  reset_battle_text ();
  match bottom with
  | "" -> draw_text (25, 45) top
  | bot ->
      draw_text (25, 55) top;
      draw_text (25, 35) bot

let draw_menu_main selector =
  auto_synchronize false;
  fill_draw_rect (250, 0) 125 50 white black;
  fill_draw_rect (375, 0) 125 50 white black;
  fill_draw_rect (250, 50) 125 50 white black;
  fill_draw_rect (375, 50) 125 50 white black;
  draw_text main_text.fight "Fight";
  draw_text main_text.bag "Bag";
  draw_text main_text.ocamlmon "OCamlMon";
  draw_text main_text.run "Run";
  (match selector with
  | 1 -> draw_rect main_underline_pos.fight 26 0
  | 2 -> draw_rect main_underline_pos.bag 15 0
  | 3 -> draw_rect main_underline_pos.ocamlmon 50 0
  | 4 -> draw_rect main_underline_pos.run 15 0
  | _ -> ());
  auto_synchronize true

let draw_menu_fight selector =
  auto_synchronize false;
  fill_draw_rect (0, 0) 400 100 white black;
  fill_draw_rect (400, 0) 100 100 white black;
  draw_text move_text.first "First move";
  draw_text move_text.second "Second move";
  draw_text move_text.third "Third move";
  draw_text move_text.fourth "Fourth move";
  (match selector with
  | 1 -> draw_circle move_circle.first 5
  | 2 -> draw_circle move_circle.second 5
  | 3 -> draw_circle move_circle.third 5
  | 4 -> draw_circle move_circle.fourth 5
  | _ -> ());
  auto_synchronize true

let draw_menu_bag selector =
  auto_synchronize false;
  fill_draw_rect (0, 0) 500 100 white black;
  draw_text bag_text.potions "_ Potions";
  draw_text bag_text.pokeballs "_ Pokeballs";
  (match selector with
  | 1 -> draw_circle bag_circle.potions 5
  | 2 -> draw_circle bag_circle.pokeballs 5
  | _ -> ());
  auto_synchronize true

let draw_menu_team selector =
  auto_synchronize false;
  fill_draw_rect (0, 0) 500 100 white black;
  draw_text team_text.one "Pokemon 1";
  draw_text team_text.two "Pokemon 2";
  draw_text team_text.three "Pokemon 3";
  draw_text team_text.four "Pokemon 4";
  draw_text team_text.five "Pokemon 5";
  draw_text team_text.six "Pokemon 6";
  (match selector with
  | 1 -> draw_circle team_circle.one 5
  | 2 -> draw_circle team_circle.two 5
  | 3 -> draw_circle team_circle.three 5
  | 4 -> draw_circle team_circle.four 5
  | 5 -> draw_circle team_circle.five 5
  | 6 -> draw_circle team_circle.six 5
  | _ -> ());
  auto_synchronize true

let init_battle enemy_team bg_color =
  auto_synchronize false;
  clear_graph ();
  set_color bg_color;
  fill_rect (0, 0) 500 500;
  set_color black;
  (* DRAWING BOTTOM MENU *)
  draw_menu_main 3;
  (* DRAWING POKEMON RECTANGLES*)
  fill_draw_rect (50, 125) 150 150 white black;
  fill_draw_rect (300, 325) 150 150 white black;
  (* DRAWING POKEMON STATUS BARS *)
  fill_draw_rect (250, 150) 250 75 white black;
  fill_draw_rect (0, 375) 250 75 white black;
  draw_battle_text "You run into a wild Pokemon!" "What will you do?";
  auto_synchronize true;
  match enemy_team with
  | h :: t -> { enemy = h; enemy_team = t; menu = Main 3 }
  | _ -> failwith "init_battle battle.ml: No team"

(* let move_main_pointer *)
let interact_menu battle menu =
  match menu with
  | Main pos -> begin
      match pos with
      | 1 ->
          draw_menu_fight 1;
          { battle with menu = Fight 1 }
      | 2 ->
          draw_menu_bag 1;
          { battle with menu = Bag 1 }
      | 3 ->
          draw_menu_team 1;
          { battle with menu = OCamlMon 1 }
      | 4 -> { battle with menu = Flee }
      | _ ->
          print "1 [interact_menu]; impossible position";
          battle
    end
  | Fight pos -> failwith "unimp"
  | Bag pos -> failwith "unimp"
  | OCamlMon pos -> failwith "unimp"
  | _ -> failwith "Impossible?"

let update_main_menu battle pos (cond1, cond2) delta =
  if pos = cond1 || pos = cond2 then (
    draw_menu_main (pos + delta);
    { battle with menu = Main (pos + delta) })
  else battle

let update_fight_menu battle pos (cond1, cond2) delta =
  if pos = cond1 || pos = cond2 then (
    draw_menu_fight (pos + delta);
    { battle with menu = Fight (pos + delta) })
  else battle

let update_bag_menu battle pos =
  let pos = if pos = 1 then 2 else 1 in
  draw_menu_bag pos;
  { battle with menu = Bag pos }

let update_team_menu battle pos (cond1, cond2, cond3, cond4) delta =
  if pos = cond1 || pos = cond2 || pos = cond3 || pos = cond4 then (
    draw_menu_team (pos + delta);
    { battle with menu = OCamlMon (pos + delta) })
  else battle

let update_battle_menu battle key =
  let b_menu = battle.menu in
  match key with
  | 'w' -> begin
      match b_menu with
      | Main pos -> update_main_menu battle pos (3, 4) ~-2
      | Fight pos -> update_fight_menu battle pos (3, 4) ~-2
      | Bag pos -> battle
      | OCamlMon pos -> update_team_menu battle pos (4, 5, 6, 6) ~-3
      | _ -> failwith "Impossible?"
    end
  | 'a' -> begin
      match b_menu with
      | Main pos -> update_main_menu battle pos (2, 4) ~-1
      | Fight pos -> update_fight_menu battle pos (2, 4) ~-1
      | Bag pos -> update_bag_menu battle pos
      | OCamlMon pos -> update_team_menu battle pos (2, 3, 5, 6) ~-1
      | _ -> failwith "Impossible?"
    end
  | 's' -> begin
      match b_menu with
      | Main pos -> update_main_menu battle pos (1, 2) 2
      | Fight pos -> update_fight_menu battle pos (1, 2) 2
      | Bag pos -> battle
      | OCamlMon pos -> update_team_menu battle pos (1, 2, 3, 3) 3
      | _ -> failwith "Impossible?"
    end
  | 'd' -> begin
      match b_menu with
      | Main pos -> update_main_menu battle pos (1, 3) 1
      | Fight pos -> update_fight_menu battle pos (1, 3) 1
      | Bag pos -> update_bag_menu battle pos
      | OCamlMon pos -> update_team_menu battle pos (1, 2, 4, 5) 1
      | _ -> failwith "Impossible?"
    end
  | 'e' -> interact_menu battle b_menu
  | _ -> battle

(* let run_battle st = function | "w" -> failwith "Unimp" | "a" -> failwith
   "Unimp" | "s" -> failwith "Unimp" | "d" -> failwith "Unimp" | _ -> st *)

(* 1 2 3 4 *)

open Graphics
open Drawing
open Pokemon
open Trainer
type team_menu_data = {
  trainer : trainer;
  poke_box : int
}
type menu =
  | MenuTeam
  | MenuBag
  | Team
  | Bag

type menu_data = {
  trainer : trainer;
  menu : menu;
  poke_box : int;
}
let start_menu trainer = { trainer; menu = MenuTeam; poke_box = 0 }

let list_arr =
  [|
    (20, 200);
    (140, 200);
    (260, 200);
    (380, 200);
    (20, 20);
    (140, 20);
    (260, 20);
    (380, 20);
  |]

let poke_name_arr =
  [|
    (60, 205);
    (180, 205);
    (300, 205);
    (420, 205);
    (60, 25);
    (180, 25);
    (300, 25);
    (420, 25);
  |]

let draw_poke_boxes () =
  for x = 0 to Array.length list_arr - 1 do
    fill_draw_rect list_arr.(x) 100 140 white black
  done
let rec help_poke_names (ls : pokemon list) count = match ls with 
 |[] -> ()
 |h :: t -> if count = 8 then () else draw_text (poke_name_arr.(count)) (h.name);help_poke_names t (count+1)
let write_poke_names trainer = help_poke_names (trainer.team) 0


let redraw_and_fill_boxes box trainer= 
  draw_poke_boxes ();
  fill_draw_rect (list_arr.(box)) 100 140 0x2ecc71 black;
  write_poke_names trainer
let init_menu trainer : menu_data =
  clear_graph ();
  fill_draw_rect (50, 100) 400 300 0x2ecc71 black;
  draw_text (250, 410) "Menu";
  set_color white;
  fill_draw_rect (80, 130) 160 240 white black;
  fill_draw_rect (110, 160) 100 170 0xf1c40f black;
  draw_text (150, 250) "Team";
  fill_draw_rect (260, 130) 160 240 0x2ecc71 black;
  fill_draw_rect (290, 160) 100 170 0x2ecc71 black;
  draw_text (330, 250) "Bag";
  { trainer; menu = MenuTeam ; poke_box = 0}

let draw_team_pokeball trainer =
  fill_draw_rect (200, 390) 100 100 white white;
  set_color red;
  fill_circle 250 450 33;
  fill_draw_rect (200, 385) 100 60 white white;
  set_color black;
  draw_circle (250, 450) 33;
  draw_circle (250, 447) 10;
  set_color white;
  fill_circle 250 447 9

let draw_item_pokeball () =
  set_color red;
  fill_circle 160 250 33;
  set_color white;
  fill_rect (120,217) 80 30;
  set_color black;
  draw_circle (160, 250) 33;
  draw_circle (160, 250) 10;
  set_color white;
  fill_circle 160 250 10

let draw_team_menu trainer =
  clear_graph ();
  fill_draw_rect (0, 0) 500 500 0x2ecc71 black;
  draw_team_pokeball trainer;
  set_color black;
  draw_text (240, 400) "Team";
  redraw_and_fill_boxes 0 trainer;
  write_poke_names trainer

let draw_item_bag () =
  fill_draw_rect (200, 390) 100 100 white white;
  fill_draw_rect (233, 450) 35 35 0x844C39 black;
  fill_draw_rect (238, 450) 25 25 white black;
  fill_draw_rect (215, 410) 70 60 0x844C39 black;
  fill_draw_rect (215, 430) 70 40 0xD69B66 black;
  fill_draw_rect (240, 425) 20 20 yellow black

let draw_potion_bag () = 
  draw_circle (342,230) 30;
  fill_circle 342 230 30;
  fill_rect (342,230) 30 white
let draw_item_menu trainer =
  clear_graph ();
  fill_draw_rect (0, 0) 500 500 0x2ecc71 black;
  draw_item_bag ();
  draw_text (238, 396) "Items";
  fill_draw_rect (260, 130) 160 240 0x2ecc71 black;
  fill_draw_rect (290, 160) 100 170 white black;
  fill_draw_rect (80, 130) 160 240 0xf1c40f black;
  fill_draw_rect (110, 160) 100 170 white black;
  draw_text (133, 300) "Pokeballs";
  draw_text (319, 300) "Potions";
  draw_text (160, 180) (string_of_int (fst trainer.bag));
  draw_text (340, 180) (string_of_int (snd trainer.bag));
  draw_item_pokeball ();
  draw_potion_bag ()
let update_bag key_pressed trainer= 
  match key_pressed with 
  |'d' -> fill_draw_rect (260, 130) 160 240 0xf1c40f black;
  fill_draw_rect (290, 160) 100 170 white black;
  fill_draw_rect (80, 130) 160 240 0x2ecc71 black;
  fill_draw_rect (110, 160) 100 170 white black;
    draw_text (133, 300) "Pokeballs";
    draw_text (319, 300) "Potions";
    draw_text (160, 180) (string_of_int (fst trainer.bag));
    draw_text (340, 180) (string_of_int (snd trainer.bag));
    draw_item_pokeball ();
     draw_potion_bag ();
  |'a' -> fill_draw_rect (260, 130) 160 240 0x2ecc71 black;
  fill_draw_rect (290, 160) 100 170 white black;
  fill_draw_rect (80, 130) 160 240 0xf1c40f black;
  fill_draw_rect (110, 160) 100 170 white black;
    draw_text (133, 300) "Pokeballs";
    draw_text (319, 300) "Potions";
    draw_text (160, 180) (string_of_int (fst trainer.bag));
    draw_text (340, 180) (string_of_int (snd trainer.bag));
    draw_item_pokeball ();
     draw_potion_bag ();
  |_ -> ()
let update_menu trainer key_pressed (menu : menu_data) : menu_data =
  match key_pressed with
  | 'd' -> (
      match menu.menu with
      | MenuTeam
      | MenuBag ->
          fill_draw_rect (260, 130) 160 240 white black;
          fill_draw_rect (290, 160) 100 170 0xf1c40f black;
          fill_draw_rect (80, 130) 160 240 0x2ecc71 black;
          fill_draw_rect (110, 160) 100 170 0x2ecc71 black;
          draw_text (330, 250) "Bag";
          draw_text (150, 250) "Team";
          { trainer; menu = MenuBag; poke_box = 0}
      | Team -> if ((menu.poke_box >= 0 && menu.poke_box <3) || (menu.poke_box >=4 && menu.poke_box < 7)) then 
        (redraw_and_fill_boxes (menu.poke_box + 1) trainer ;
        {menu with poke_box = (menu.poke_box + 1)}) 
      else menu
      | Bag -> update_bag 'd' trainer;
          menu)
  | 'a' -> (
      match menu.menu with
      | MenuTeam
      | MenuBag ->
          fill_draw_rect (260, 130) 160 240 0x2ecc71 black;
          fill_draw_rect (290, 160) 100 170 0x2ecc71 black;
          fill_draw_rect (80, 130) 160 240 white black;
          fill_draw_rect (110, 160) 100 170 0xf1c40f black;
          draw_text (330, 250) "Bag";
          draw_text (150, 250) "Team";
          { trainer; menu = MenuTeam; poke_box = 0}
      | Team-> if ((menu.poke_box > 0 && menu.poke_box <=3) || (menu.poke_box >4 && menu.poke_box <= 7)) then 
        (redraw_and_fill_boxes (menu.poke_box - 1) trainer ;
        {menu with poke_box = (menu.poke_box - 1)}) else menu
      | Bag -> update_bag 'a' trainer;
          menu)
  | 's' -> (match menu.menu with 
              |Team ->(if menu.poke_box < 4 then (redraw_and_fill_boxes (menu.poke_box + 4) trainer; 
            {menu with poke_box = (menu.poke_box + 4)}) else menu)
            |_ -> menu)
  | 'w' -> (match menu.menu with 
              |Team -> (if menu.poke_box > 3 then (redraw_and_fill_boxes (menu.poke_box - 4) trainer; 
  {menu with poke_box = (menu.poke_box - 4)}) else menu)
              |_ -> menu)
  | 'e' ->
      (match menu.menu with 
      | MenuBag ->
        draw_item_menu trainer;
        { menu with menu = Bag }
      | MenuTeam ->
         ( draw_team_menu trainer;
          { menu with menu = Team})
      |Team -> menu
      |Bag -> menu)
  | _ -> menu
(* match key_pressed with |'a'-> |'d'-> |'e'-> *)

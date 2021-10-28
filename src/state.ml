open Room
type action = Battle | Walk | Menu | Talk
type t = {
  current_room : string;
  current_coord : int * int;
  current_action : action
  }
let get_current_room state = ""
let get_current_coord state = (0,0)
let get_action state = Talk

let init_state = {
  current_room = "home";
  current_coord = (250,250);
  current_action = Walk;
}
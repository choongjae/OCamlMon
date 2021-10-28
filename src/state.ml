open Room
type action = Battle | Walk | Menu | Talk
type t = {
  current_room : string;
  current_coord : int * int;
  current_action : action
  }
let get_current_room state = state.current_room
let get_current_coord state = state.current_coord
let get_action state = state.current_action

let init_state = {
  current_room = "home";
  current_coord = (250,250);
  current_action = Walk;
}

let update_state room coord action = {
  current_room = room;
  current_coord = coord;
  current_action = action;
}
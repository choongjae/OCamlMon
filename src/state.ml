open Room

type action =
  | Battle
  | Walk
  | Menu
  | Talk

type t = {
  room : string;
  coords : int * int;
  action : action;
}

let current_room state = state.room

let current_coord state = state.coords

let current_action state = state.action

let init_state = { room = "home"; coords = (250, 250); action = Walk }

let update_state room coord action = { room; coords = coord; action }

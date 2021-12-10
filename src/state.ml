open Room
open Trainer

type action =
  | Battle
  | Walk
  | Menu
  | Talk

type t = {
  room : string;
  coords : int * int;
  action : action;
  trainer : trainer;
}

let current_room state = state.room

let current_coord state = state.coords

let current_action state = state.action

let current_trainer state = state.trainer

let init_state trainer =
  { room = "home"; coords = (250, 250); action = Walk; trainer }

let update_state room coord action trainer =
  { room; coords = coord; action; trainer }

open Room
open Trainer
open Pokemon
open Battle

type action =
  | Battle of battle_data
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

let current_battle state =
  match state.action with
  | Battle data -> data
  | _ -> failwith "Not a battle"

let init_state trainer =
  { room = "home"; coords = (250, 250); action = Walk; trainer }

let update_state room coord action trainer =
  { room; coords = coord; action; trainer }

let update_action st a = { st with action = a }

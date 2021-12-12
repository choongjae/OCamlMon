open Room
open Trainer
open Pokemon
open Battle

type action =
  | Battle of battle_data
  | Walk
  | Menu
  | Talk

type t

val current_room : t -> string

val current_coord : t -> int * int

val current_action : t -> action

val current_trainer : t -> trainer

val current_battle : t -> battle_data

val init_state : trainer -> t

val update_state : string -> int * int -> action -> trainer -> t

val update_action : t -> action -> t

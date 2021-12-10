open Room
open Trainer

type action =
  | Battle
  | Walk
  | Menu
  | Talk

type t

val current_room : t -> string

val current_coord : t -> int * int

val current_action : t -> action

val current_trainer : t -> trainer

val init_state : trainer -> t

val update_state : string -> int * int -> action -> trainer -> t

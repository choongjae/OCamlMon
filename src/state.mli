open Room

type action =
  | Battle
  | Walk
  | Menu
  | Talk

type t

val current_room : t -> string

val current_coord : t -> int * int

val current_action : t -> action

val init_state : t

val update_state : string -> int * int -> action -> t

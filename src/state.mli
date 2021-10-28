open Room
type action = Battle | Walk | Menu | Talk
type t
val get_current_room : t -> string
val get_current_coord : t -> (int * int)
val get_action : t -> action
val init_state : t
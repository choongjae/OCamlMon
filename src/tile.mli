open Pokemon

type color = int

type t = {color: color; encounters: p list}

type tile = | Grass of t
            | Sand of t
            | Water of t
            | Bushes of t
            | Rocks of t
            | Path of t

val generate_encounter : int -> bool
(** [generate_encounter n] is whether or not stepping on a tile will create a
random encounter based on the random number [n] *)

val generate_pokemon : int -> pokemon
(** [generate_pokemon n] is the pokemon that is generated based on the random
number [n], taking into account the tile's encounters list and the rarity of
the pokemon within the list
  NOTE: Planning to use conditionals and define ranges for rarity within
  this method. *)

val get_color : tile -> color



open Pokemon

type trainer = {
  name : string;
  team : pokemon list
}

val add_pokemon : trainer -> pokemon -> trainer
(** [add_pokemon t p] is a trainer with pokemon [p] added to the team
of [t] *)
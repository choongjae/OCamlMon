type p = Bulbasaur | Squirtle | Caterpie | Camelo | Sandshrew | Geodude | O

type pmove = Tackle | KarateChop

type pokemon_stats = {
  level : int;
  xp : int
}

type pokemon = {
  name : string;
  t_poke : p;
  moves : pmove list;
  stats : pokemon_stats;
}

val poke_to_string : p -> string

val pmove_to_string : pmove -> string
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

let poke_to_string = function
| Bulbasaur -> "Bulbasaur"
| Squirtle -> "Squirtle"
| Caterpie -> "Caterpie"
| Camelo -> "Camelo"
| Sandshrew -> "Sandshrew"
| Geodude -> "Geodude"
| O -> "O"

let pmove_to_string = function
| Tackle -> "Tackle"
| KarateChop -> "KarateChop"

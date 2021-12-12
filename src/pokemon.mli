type p =
  | Pikachu
  | Bulbasaur
  | Squirtle
  | Charmander
  | Caterpie
  | Sandshrew
  | Geodude
  | O

type pmove =
  | TailWhip
  | ThunderShock
  | QuickAttack
  | ElectroBall
  | Tackle
  | VineWhip
  | RazorLeaf
  | SolarBeam
  | WaterGun
  | WaterPulse
  | HydroPump
  | Scratch
  | Ember
  | Flamethrower
  | Inferno
  | Bugbite
  | StringShot
  | SandAttack
  | GyroBall
  | SandStorm
  | RockThrow
  | Earthquake
  | Explosion
  | Encapsulate
  | Abstract
  | RaiseFail

val bulb_moves : pmove list

val squirtle_moves : pmove list

val caterpie_moves : pmove list

val sand_moves : pmove list

val geodude_moves : pmove list

val o_moves : pmove list

type pokemon_stats = {
  health : int;
  level : int;
  xp : int;
}

type pokemon = {
  name : string;
  t_poke : p;
  moves : pmove list;
  stats : pokemon_stats;
}

val make_starter_pokemon : string -> pokemon

val string_of_poke : p -> string

val pmove_to_string : pmove -> string
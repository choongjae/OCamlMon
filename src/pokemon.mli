type p = Bulbasaur | Squirtle | Caterpie | Sandshrew | Geodude | O

type pmove = Tackle | VineWhip | RazorLeaf | SolarBeam | WaterGun | WaterPulse
| HydroPump | Bugbite | StringShot | SandAttack | GyroBall | SandStorm | RockThrow 
|Earthquake | Explosion |Encapsulate | Abstract | RaiseFail
val bulb_moves : pmove list
val squirtle_moves : pmove list
val caterpie_moves : pmove list
val sand_moves : pmove list
val geodude_moves : pmove list
val o_moves : pmove list

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
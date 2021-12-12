type species =
  | Pikachu
  | Bulbasaur
  | Squirtle
  | Charmander
  | Caterpie
  | Sandshrew
  | Geodude
  | O

type element =
  | Fire
  | Water
  | Grass
  | Electric
  | Normal
  | Bug
  | Rock
  | Camel

type move =
  | Slam
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
  | BugBite
  | Twineedle
  | PinMissile
  | LeechLife
  | RockThrow
  | Earthquake
  | Explosion
  | Encapsulate
  | Abstract
  | RaiseFail
  | TypeCheck

val bulb_moves : move list

val squirtle_moves : move list

val caterpie_moves : move list

val sand_moves : move list

val geodude_moves : move list

val o_moves : move list

type stats = {
  health : int;
  maxhealth : int;
  level : int;
  xp : int;
}

type pokemon = {
  name : string;
  species : species;
  element : element;
  moves : move list;
  stats : stats;
}

val make_starter_pokemon : string -> pokemon

val string_of_species : species -> string

val string_of_pokemon : pokemon -> string

val string_of_element : element -> string

val string_of_move : move -> string
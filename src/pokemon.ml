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

let pikachu_moves = [ Slam; ThunderShock; QuickAttack; ElectroBall ]

let bulb_moves = [ Tackle; VineWhip; RazorLeaf; SolarBeam ]

let squirtle_moves = [ Tackle; WaterGun; WaterPulse; HydroPump ]

let charmander_moves = [ Scratch; Ember; Flamethrower; Inferno ]

let caterpie_moves = [ Tackle; BugBite ]

let sand_moves = [ Tackle ]

let geodude_moves = [ Tackle; RockThrow; Earthquake; Explosion ]

let o_moves = [ Encapsulate; Abstract; RaiseFail ]

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

let make_starter_pokemon = function
  | "pikachu" ->
      {
        name = "Pikachu";
        species = Pikachu;
        element = Electric;
        moves = pikachu_moves;
        stats = { health = 30; maxhealth = 30; level = 5; xp = 0 };
      }
  | "squirtle" ->
      {
        name = "Squirtle";
        species = Squirtle;
        element = Electric;
        moves = squirtle_moves;
        stats = { health = 30; maxhealth = 30; level = 5; xp = 0 };
      }
  | "bulbasaur" ->
      {
        name = "Bulbasaur";
        species = Bulbasaur;
        element = Electric;
        moves = bulb_moves;
        stats = { health = 30; maxhealth = 30; level = 5; xp = 0 };
      }
  | "charmander" ->
      {
        name = "Charmander";
        species = Charmander;
        element = Electric;
        moves = charmander_moves;
        stats = { health = 30; maxhealth = 30; level = 5; xp = 0 };
      }
  | _ -> failwith "Not a starter Pokemon"

let string_of_species = function
  | Pikachu -> "Pikachu"
  | Bulbasaur -> "Bulbasaur"
  | Squirtle -> "Squirtle"
  | Charmander -> "Charmander"
  | Caterpie -> "Caterpie"
  | Sandshrew -> "Sandshrew"
  | Geodude -> "Geodude"
  | O -> "O"

let string_of_element = function
  | Fire -> "Fire"
  | Water -> "Water"
  | Grass -> "Grass"
  | Electric -> "Electric"
  | Normal -> "Normal"
  | Bug -> "Bug"
  | Rock -> "Rock"
  | Camel -> "Camel"

let string_of_pokemon pokemon = pokemon.name

let string_of_move = function
  | Slam -> "Slam"
  | ThunderShock -> "Thunder Shock"
  | QuickAttack -> "Quick Attack"
  | ElectroBall -> "Electro Ball"
  | Tackle -> "Tackle"
  | VineWhip -> "Vine Whip"
  | RazorLeaf -> "Razor Leaf"
  | SolarBeam -> "Solar Beam"
  | WaterGun -> "Water Gun"
  | WaterPulse -> "Water Pulse"
  | HydroPump -> "Hydro Pump"
  | Scratch -> "Scratch"
  | Ember -> "Ember"
  | Flamethrower -> "Flamethrower"
  | Inferno -> "Inferno"
  | BugBite -> "Bug Bite"
  | Twineedle -> "Twineedle"
  | PinMissile -> "Pin Missile"
  | LeechLife -> "Leech Life"
  | RockThrow -> "Rock Throw"
  | Earthquake -> "Earthquake"
  | Explosion -> "Explosion"
  | Encapsulate -> "Encapsulate"
  | Abstract -> "Abstract"
  | RaiseFail -> "Raise Fail"
  | TypeCheck -> "Type Check"

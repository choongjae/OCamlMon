type p =
  | Pikachu
  | Bulbasaur
  | Squirtle
  | Charmander
  | Caterpie
  | Sandshrew
  | Geodude
  | O
  | Eevee

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

let pikachu_moves = [ TailWhip; ThunderShock; QuickAttack; ElectroBall ]

let bulb_moves = [ Tackle; VineWhip; RazorLeaf; SolarBeam ]

let squirtle_moves = [ Tackle; WaterGun; WaterPulse; HydroPump ]

let charmander_moves = [ Scratch; Ember; Flamethrower; Inferno ]

let caterpie_moves = [ Tackle; Bugbite; StringShot ]

let sand_moves = [ Tackle; SandAttack; GyroBall; SandStorm ]

let geodude_moves = [ Tackle; RockThrow; Earthquake; Explosion ]

let o_moves = [ Encapsulate; Abstract; RaiseFail ]

let eevee_moves = [TailWhip; Scratch; QuickAttack]

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

let pokemonEx =
  {
    name = "blah";
    t_poke = Squirtle;
    moves = [ Tackle ];
    stats = { health = 30; level = 5; xp = 50 };
  }

let make_starter_pokemon = function
  | "pikachu" ->
      {
        name = "Pikachu";
        t_poke = Pikachu;
        moves = pikachu_moves;
        stats = { health = 30; level = 1; xp = 0 };
      }
  | "squirtle" ->
      {
        name = "Squirtle";
        t_poke = Squirtle;
        moves = squirtle_moves;
        stats = { health = 30; level = 1; xp = 0 };
      }
  | "bulbasaur" ->
      {
        name = "Bulbasaur";
        t_poke = Bulbasaur;
        moves = bulb_moves;
        stats = { health = 30; level = 1; xp = 0 };
      }
  | "charmander" ->
      {
        name = "Charmander";
        t_poke = Charmander;
        moves = charmander_moves;
        stats = { health = 30; level = 1; xp = 0 };
      }
  | _ -> failwith "Not a starter Pokemon"

let string_of_poke = function
  | Pikachu -> "Pikachu"
  | Bulbasaur -> "Bulbasaur"
  | Squirtle -> "Squirtle"
  | Charmander -> "Charmander"
  | Caterpie -> "Caterpie"
  | Sandshrew -> "Sandshrew"
  | Geodude -> "Geodude"
  | O -> "O"
  | Eevee -> "Eevee"

let pmove_to_string = function
  | Tackle -> "Tackle"
  | VineWhip -> "Vine Whip"
  | RazorLeaf -> "Razor Leaf"
  | SolarBeam -> "Solar Beam"
  | WaterGun -> "Water Gun"
  | WaterPulse -> "Water Pulse"
  | HydroPump -> "Hydro Pump"
  | Bugbite -> "Bugbite"
  | StringShot -> "String Shot"
  | SandAttack -> "Sand Attack"
  | GyroBall -> "Gyro Ball"
  | SandStorm -> "Sand Storm"
  | RockThrow -> "Rock Throw"
  | Earthquake -> "Earthquake"
  | Explosion -> "Explosion"
  | Encapsulate -> "Encapsulate"
  | Abstract -> "Abstract"
  | RaiseFail -> "Raise Fail"

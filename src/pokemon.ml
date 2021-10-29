type p = Bulbasaur | Squirtle | Caterpie | Sandshrew | Geodude | O

type pmove = Tackle | VineWhip | RazorLeaf | SolarBeam | WaterGun | WaterPulse
| HydroPump | Bugbite | StringShot | SandAttack | GyroBall | SandStorm | RockThrow 
|Earthquake | Explosion |Encapsulate | Abstract | RaiseFail
let bulb_moves = [Tackle; VineWhip; RazorLeaf; SolarBeam]
let squirtle_moves = [Tackle; WaterGun ; WaterPulse ; HydroPump]
let caterpie_moves = [Tackle ; Bugbite ; StringShot]
let sand_moves = [Tackle ; SandAttack ; GyroBall ; SandStorm]
let geodude_moves = [Tackle ; RockThrow ; Earthquake ; Explosion]
let o_moves = [Encapsulate ; Abstract ; RaiseFail]
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
| Sandshrew -> "Sandshrew"
| Geodude -> "Geodude"
| O -> "O"
let pmove_to_string = function
|Tackle -> "Tackle"
|VineWhip -> "Vine Whip"
|RazorLeaf -> "Razor Leaf"
|SolarBeam -> "Solar Beam"
|WaterGun -> "Water Gun"
|WaterPulse -> "Water Pulse"
|HydroPump -> "Hydro Pump"
|Bugbite -> "Bugbite"
|StringShot -> "String Shot"
|SandAttack -> "Sand Attack"
|GyroBall -> "Gyro Ball"
|SandStorm -> "Sand Storm"
|RockThrow -> "Rock Throw"
|Earthquake -> "Earthquake"
|Explosion -> "Explosion"
|Encapsulate -> "Encapsulate"
|Abstract -> "Abstract"
|RaiseFail -> "Raise Fail"


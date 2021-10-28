open Pokemon
type color = int

type t = {color: color; encounters: p list}

type tile = | Grass of t
            | Sand of t
            | Water of t
            | Bushes of t
            | Rocks of t
            | Path of t
let grass = Grass {color = 0x2ecc71; encounters = [Caterpie; Bulbasaur]}
let sand = Sand {color = 0xf1c40f; encounters = [Sandshrew; O]}
let water = Water {color = 0x3498db; encounters = [Squirtle]}
let bushes = Bushes {color = 0x8e8e93; encounters =  [Bulbasaur]}
let rocks = Rocks {color = 0xffeb3b; encounters =  [Geodude]}
let path = Path {color = 0xffbd66; encounters = []}

let generate_encounter 0 = true
(** TODO *)

let generate_pokemon 0 = {
  name = "Pokemon";
  t_poke = Bulbasaur;
  moves = [KarateChop];
  stats = {
    level = 5;
    xp = 0
  };
}
(** TODO *)

let get_color = function
| Grass t -> t.color
| Sand t -> t.color
| Water t -> t.color
| Bushes t -> t.color
| Rocks t -> t.color
| Path t -> t.color
open Tile
type exit_names = string
type room_id = string
type exit = {
  name : string;
  coordinates : int * int;
}

type room = {
  name : string;
  layout : tile array array;
  exits : exit list;
}

let grass = Grass {color = 0x2ecc71; encounters = [Caterpie; Bulbasaur]}
let sand = Sand {color = 0xf1c40f; encounters = [Sandshrew; O]}
let water = Water {color = 0x3498db; encounters = [Squirtle]}
let bushes = Bushes {color = 0x8e8e93; encounters =  [Bulbasaur]}
let rocks = Rocks {color = 0xffeb3b; encounters =  [Geodude]}
let path = Path {color = 0xffbd66; encounters = []}

let exit_to_room e = {name = ""; layout = [|[||]|]; exits = []}
(**TODO*)


let forest_exit = {name = "forest"; coordinates = (250, 525)}
let town_exit = {name = "town"; coordinates = (-25, 250)}
let hometown_layout =
  [|
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|path;path;path;path;path;path;path;path;path;path;path;path;path;path;path;path;path;path;path;path;path;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
    [|grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;path;grass;grass;grass;grass;grass;grass;grass;grass;grass;grass;|];
  |]
let hometown = {
  name = "hometown";
  layout = hometown_layout;
  exits = [
    forest_exit;
    town_exit;
    ];
}
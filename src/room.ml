open Yojson.Basic.Util
open Tile
open Parser

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
let bushes = Bushes {color = 0x1c390f; encounters =  [Bulbasaur]}
let rocks = Rocks {color = 0x808080; encounters =  [Geodude]}
let path = Path {color = 0xffbd66; encounters = []}

let exit_to_room e = {name = ""; layout = [|[||]|]; exits = []}
(**TODO*)


(* TODO: Add new parsing functions to .mli *)

let roomdata = "data/rooms.json" |> Yojson.Basic.from_file

(** [exit_record e] is an exit (record) representing a specific exit [e] in a
room *)
let exit_record exit = 
  let exitcoords = exit |> member "coordinates" in
  {
    name = exit |> member "name" |> to_string;
    coordinates = ((index 0 exitcoords) |> to_int, (index 1 exitcoords) |> to_int)
  }

(** [parse_exits r] is the list of exit (records) corresponding to the
room [r]*)
let rec parse_exits = function
  | [] -> []
  | h :: t -> exit_record h :: parse_exits t

(** [from_json j r] is the room (record) of the room [r] from the JSON [j] *)
let from_json j room_name =
  let room = j |> member room_name in
  {
    name = room |> member "name" |> to_string;
    layout = room |> member "layout" |> to_list |> (parse_list parse_tile) |> Array.of_list;
    exits = parse_exits (room |> member "exits" |> to_list)
  }

let home = from_json roomdata "home"
let forest = from_json roomdata "forest"
let town = from_json roomdata "town"
let cave = from_json roomdata "cave"
let beach = from_json roomdata "beach"

let room_layout = function
| "home" -> home.layout
| "forest" -> forest.layout
| "town" -> town.layout
| "cave" -> cave.layout
| "beach" -> beach.layout
| _ -> failwith "No"

(* let get_tile coord room_name = (room_layout room_name).((fst coord)/25).((snd coord)/25) *)
let get_tile coord room_name =
  (room_layout room_name).(20-(snd coord)/25).((fst coord)/25)

let string_to_room = function
| "home" -> home
| "forest" -> forest
| "town" -> town
| "cave" -> cave
| "beach" -> beach
| _ -> failwith "No"


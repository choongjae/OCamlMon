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

let exit_to_room e = {name = ""; layout = [|[||]|]; exits = []}
(**TODO*)
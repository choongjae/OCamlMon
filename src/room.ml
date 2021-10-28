open tile
type exit_names = string
type room_id = string
type exit = {
  room_id : room_id
}

type room = {
  id : room_id;
  tiles : tile list;
  exits : exit list;
}

type t = {
  rooms : room list;
  start_room : room_id
}
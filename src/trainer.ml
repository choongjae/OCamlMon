open Pokemon

type trainer = {
  name : string;
  team : pokemon list;
}

let add_pokemon t p = {name = t.name; team = p :: t.team}
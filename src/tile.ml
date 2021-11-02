open Pokemon
(* type color = int *)

type t = {color: int; encounters: p list}

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
(**Generates a random number*)
let generate_randomNum x = Random.int 11

(*Determines whether an encounter happens based on the random num generator*)
let generate_encounter () = if generate_randomNum () > 9 then true else false

(**generates a random pokemon tuple based on the tile*)
let type_pokemon = function 
    |Grass _-> if generate_randomNum () < 8 then (Some (Caterpie,poke_to_string Caterpie)) else Some (Bulbasaur, poke_to_string Bulbasaur)
    |Sand _-> if generate_randomNum () < 9 then Some (Sandshrew, poke_to_string Sandshrew) else Some (O, poke_to_string O)
    |Water _-> Some (Squirtle, poke_to_string Squirtle)
    |Bushes _-> Some (Bulbasaur, poke_to_string Bulbasaur)
    |Rocks _-> Some (Geodude, poke_to_string Geodude)
    |Path _ -> None

(**Generates a random moves based on the pokemon move list*)
let random_move l = List.nth l (Random.int (List.length l))

(**Generates a list of pokemon moves*)
let rec num_moves n l acc = match n with 
  0 -> acc
  |x -> num_moves (n-1) l ((random_move l) :: acc)
  (**generates the list of moves the pokemon has*)

let generate_move level = function
|Bulbasaur -> if level < 3 then [Tackle] else if level < 7 then num_moves 2 bulb_moves [] else if 
                  level < 9 then num_moves 3 bulb_moves [] else bulb_moves
|Squirtle -> if level < 3 then [Tackle] else if level < 7 then num_moves 2 squirtle_moves [] else if 
                  level < 9 then num_moves 3 squirtle_moves [] else squirtle_moves
|O -> if level < 5 then num_moves 1 o_moves [] else if level < 9 then num_moves 2 o_moves [] else o_moves
|Caterpie -> if level < 5 then [Tackle] else if level < 8 then num_moves 2 caterpie_moves [] else caterpie_moves
|Sandshrew -> if level < 3 then [Tackle] else if level < 7 then num_moves 2 sand_moves [] else if 
                  level < 9 then num_moves 3 sand_moves [] else sand_moves
|Geodude -> if level < 3 then [Tackle] else if level < 7 then num_moves 2 geodude_moves [] else if 
                  level < 9 then num_moves 3 geodude_moves [] else geodude_moves

let extract = function
| Some x -> x
| None -> failwith "error in tile extract"

(**Generates the random pokemon*)
let generate_pokemon tileT = match tileT with 
Path _ -> None 
|_ -> Some (let typeP = type_pokemon tileT in let l = generate_randomNum () in 
  let move_list = generate_move l (fst (extract typeP)) in
  {
    name = snd (extract typeP);
    t_poke = fst (extract typeP);
    moves = move_list;
    stats = {
      level = l;
      xp = ((l*10) + Random.int 10)
    };
  })

let get_color_string = function
| Grass t -> "Grass"
| Sand t -> "Sand"
| Water t -> "Water"
| Bushes t -> "Bushes"
| Rocks t -> "Rocks"
| Path t -> "Path"

let get_color = function
| Grass t -> t.color
| Sand t -> t.color
| Water t -> t.color
| Bushes t -> t.color
| Rocks t -> t.color
| Path t -> t.color
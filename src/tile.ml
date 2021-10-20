#require "Pokemon";;
type grass = {pokemon : pokemon; color : int}
type sand = {pokemon : pokemon; color : int}
type water = {pokemon : pokemon; color : int}
type bushes = {pokemon : pokemon; color : int}
type rocks = {pokemon : pokemon; color : int}
type path = { color : int}
type tile = Grass of grass| Sand of sand| Water of water| Bushes of bushes| Rocks of rocks|Path of path

let g_color = 0x2ecc71
let s_color = 0xf1c40f
let w_color = 0x3498db
let b_color = 0x008a00
let r_color = 0x8e8e93
let p_color = 0xffeb3b




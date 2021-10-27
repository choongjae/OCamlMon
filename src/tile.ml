open Pokemon
type color = int
type tile = Grass of {color : color; pokemon : pokemon}| Sand of {color : color; pokemon : pokemon}| 
Water of {color : color; pokemon : pokemon}| Bushes of {color : color; pokemon : pokemon}| 
Rocks of {color : color; pokemon : pokemon}|Path of color
let grass = Grass {color = 0x2ecc71; pokemon = Caterpie}
let sand = Sand {color = 0xf1c40f; pokemon = Sandshrew}
let water = Water {color = 0x3498db; pokemon = Squirtle}
let bushes = Bushes {color = 0x8e8e93; pokemon =  Bulbasaur}
let rocks = Rocks {color = 0xffeb3b; pokemon =  Geodude}
let path = Path 0xffbd66



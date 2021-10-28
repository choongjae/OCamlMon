open Pokemon
type color = int
type tile = Grass of {color : color; pokemon : p list}| Sand of {color : color; pokemon : p list}| 
Water of {color : color; pokemon : p list}| Bushes of {color : color; pokemon : p list}| 
Rocks of {color : color; pokemon : p list}|Path of color
let grass = Grass {color = 0x2ecc71; pokemon = [Caterpie; Bulbasaur]}
let sand = Sand {color = 0xf1c40f; pokemon = [Sandshrew; O]}
let water = Water {color = 0x3498db; pokemon = [Squirtle]}
let bushes = Bushes {color = 0x8e8e93; pokemon =  [Bulbasaur]}
let rocks = Rocks {color = 0xffeb3b; pokemon =  [Geodude]}
let path = Path 0xffbd66



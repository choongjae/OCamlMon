open Graphics
let player = 
  (*  1       2       3       4       5       6       7       8       9       10       11      12    13(m)    14      15      16      17      18      19      20      21      22      23      24     25 *)
  [|
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; red   ; transp; transp; transp; transp; transp; red   ; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; transp; black ; black ; black ; black ; black ; black ; black ; transp; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; transp; black ; transp; transp; transp; transp; transp; transp; transp; transp; transp; black ; transp; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; transp; transp; transp; transp; black ; transp; transp; transp; black ; transp; transp; transp; transp; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; transp; transp; black ; transp; transp; transp; black ; transp; transp; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; transp; transp; red   ; red   ; red   ; transp; transp; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; transp; transp; black ; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; transp; transp; black ; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; red   ; red   ; black ; black ; black ; red   ; red   ; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; black ; black ; red   ; red   ; red   ; black ; black ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; black ; black ; red   ; red   ; red   ; black ; black ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; black ; black ; black ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; transp; transp; transp; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; transp; transp; transp; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|]
  |]

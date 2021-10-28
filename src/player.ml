open Graphics
let player = 
  (*  1       2       3       4       5       6       7       8       9       10       11      12    13(m)    14      15      16      17      18      19      20      21      22      23      24     25 *)
  [|
    [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
    [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; black ; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; red   ; transp; transp; transp; transp; transp; red   ; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; yellow; black ; black ; black ; black ; black ; black ; black ; yellow; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; black ; yellow; yellow; yellow; yellow; yellow; yellow; yellow; yellow; yellow; black ; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; yellow; yellow; yellow; black ; yellow; yellow; yellow; black ; yellow; yellow; yellow; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; yellow; transp; black ; yellow; yellow; yellow; black ; yellow; yellow; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; yellow; yellow; red   ; red   ; red   ; yellow; yellow; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; yellow; black ; black ; black ; black ; black ; black ; black ; black ; yellow; yellow; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; black ; yellow; yellow; black ; black ; black ; black ; black ; black ; black ; black ; yellow; yellow; yellow; black ; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; black ; black ; black ; red   ; red   ; black ; black ; black ; red   ; red   ; black ; black ; black ; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; black ; black ; red   ; red   ; red   ; black ; black ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; black ; black ; red   ; red   ; red   ; black ; black ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; black ; red   ; red   ; red   ; black ; black ; black ; red   ; red   ; red   ; black ; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; transp; transp; transp; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; black ; black ; black ; transp; transp; transp; black ; black ; black ; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|];
  [|transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp; transp|]
  |]

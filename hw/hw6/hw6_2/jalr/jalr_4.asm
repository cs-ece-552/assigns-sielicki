// load r1 with 6, jalr to 6 - 2 = load r1 <- (-1), R7 point at 4
  lbi  r1, 6
  jalr r1, -2
  lbi  r1, -1
  halt
//  Expected: r7 == 4, 3 lines executed besides halt, r1 = -1

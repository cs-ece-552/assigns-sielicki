// load r1 with 6, jalr to 6 + 0 = halt, R7 point at 4
  lbi  r1, 6
  jalr r1, 0
  lbi  r1, -1
  halt
//  Expected: r7 == 4, r1 = 6, 2 lines executed besides halt

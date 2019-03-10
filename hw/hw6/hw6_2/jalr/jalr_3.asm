// load r1 with 0, jalr to 0 + 6 = halt, R7 point at 4
  lbi  r1, 0
  jalr r1, 6
  lbi  r1, -1
  halt
//  Expected: r7 == 4, 2 lines executed besides halt, r1 = 0

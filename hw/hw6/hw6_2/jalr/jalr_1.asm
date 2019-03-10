  // load r1 with 6, jalr to 6 + 2 = halt, R7 point at 4
  lbi  r1, 6
  jalr r1, 2
  lbi  r1, -1
  lbi  r1, -1
  halt
//  Expected: r7 == 4, 2 lines executed besides halt, R7 = 4

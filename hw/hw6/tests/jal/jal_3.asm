  // load r1 <- 0, jump forward, jump negative, set r1 <- 150, jump to halt
  lbi r1, 0
  jal 4
  lbi r1, 150
  jal 2
  jal -6
  halt
//  Expected: r1 == 150, 5 lines executed, R7 = 8

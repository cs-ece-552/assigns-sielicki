// Should end with r1 equal to 150, as lbi r1 is jumped over.
  lbi r1, 150
  jal 2
  lbi r1, 0
  halt
//  Expected: r1 == 150, 3 lines executed, R7 = 4



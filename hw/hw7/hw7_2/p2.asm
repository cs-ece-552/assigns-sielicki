  lbi r1, 5
  bgez r1, .BranchTarget1
  nop
  lbi r1, 20
  halt

  .BranchTarget1:
  add r1, r1, r1
  lbi r2, 0
  beqz r2, .BranchTarget2
  add r2, r2,r2
  halt


  .BranchTarget2:
  lbi r2, 11
  lbi r3, -6
  bltz r3, .BranchTarget3
  add r3, r3, r3
  halt

  .BranchTarget3:
  lbi r3, 12
  lbi r4 4
  lbi r5 5
  lbi r6 6
  beqz r4, .BranchTarget4
  bltz r5, .BranchTarget5
  beqz r6, .BranchTarget6
  halt

  .BranchTarget4:
  lbi r4 -4
  halt
  .BranchTarget5:
  lbi r5 -5
  halt
  .BranchTarget6:
  lbi r6 -6
  halt

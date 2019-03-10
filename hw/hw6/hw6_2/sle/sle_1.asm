// Should set rd with two equal negative operands    : (rs == rt) where ((rs,rt) < 0)
       lbi    r1, -1
       lbi    r2, -1
       sle    r3, r1, r2
       halt
//  Expected: r3 == 1, (r1,r2) == -1

// Should set rd with two equal operands of zero     : (rs == rt) where ((rs, rt) == 0)
       lbi    r1, 0
       lbi    r2, 0
       sle    r3, r1, r2
       halt
//  Expected: r3 == 1, (r1,r2) == 0

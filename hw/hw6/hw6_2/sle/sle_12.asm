// Should not set rt with with signed operand and zero   : (rt > rs)  where (rt == 0, 0 < rs)
       lbi    r1, 4
       lbi    r2, 0
       sle    r3, r1, r2
       halt
//  Expected: r3 == 0, r1 == 4, r2 == 0

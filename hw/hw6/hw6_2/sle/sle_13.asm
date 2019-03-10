// Should set rt with with zero and signed operand   : (rs > rt)  where (rs < 0, 0 == rt)
       lbi    r1, -4
       lbi    r2, 0
       sle    r3, r1, r2
       halt
//  Expected: r3 == 1, r1 == -4, r2 == 0

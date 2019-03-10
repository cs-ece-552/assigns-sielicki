// Should not set rt with two positive nonequal operands : (rs > rt)  where (rs != rt, 0 < (rs, rt))
       lbi    r1, 8
       lbi    r2, 4
       sle    r3, r1, r2
       halt
//  Expected: r3 == 0, r1 == 8, r2 == 4

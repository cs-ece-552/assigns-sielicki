// Should set rt with two positive nonequal operands : (rs < rt)  where (rs != rt, 0 < (rs, rt))
       lbi    r1, 4
       lbi    r2, 8
       sle    r3, r1, r2
       halt
//  Expected: r3 == 1, r1 == 4, r2 == 8

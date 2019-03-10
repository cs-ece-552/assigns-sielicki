// Should not set rt with opposite sign operands         : (rt < rs)  where (rs < 0, 0 < rt)
       lbi    r1, 4
       lbi    r2, -4
       sle    r3, r1, r2
       halt
//  Expected: r3 == 0, r1 == 4, r2 == -4

// Should not set rt with two negative operands          : (rs > rt)  where (rs != rt, (rs, rt) < 0)
       lbi    r1, -4
       lbi    r2, -8
       sle    r3, r1, r2
       halt
//  Expected: r3 == 0, r1 == -4, r2 == -8

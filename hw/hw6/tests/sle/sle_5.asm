// Should set rt with two negative operands          : (rs < rt)  where (rs != rt, (rs, rt) < 0)
	lbi    r1, -8
	lbi    r2, -4
	sle    r3, r1, r2
	halt
//  Expected: r3 == 1, r1 == -8, r2 == -4

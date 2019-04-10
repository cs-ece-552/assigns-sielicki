// Write your assembly program for Problem 1 (a) #3 here.
//
// This program demonstrates MEM to MEM forwarding in
// two subsequent instructions. It tests that when a value can be forward from
// EX-to-EX and MEM-to-EX simultaneously, that the more recent result is
//	preferred

.testbegin:
        // Load a register with a value
        lbi r1, 0x03
        lbi r2, 0x10
        jal .fullflush
        // load a value into memory
        st r1, r2, 0 // mem[0x10] <- 0x3
        lbi r1, 0x1   // r1 <-- 0x1
        jal .fullflush

        //  ___ Core of test is here ___
        // r1 contains 0x1, load it with 0x3 (mem[0x10])
        ld r1, r2, 0
	and r1, r1, 0
        // Do an ALU operation with it.
        add r4, r1, r1
        // ___ _____________________ ___

        // In case halt is not implemented correctly and operation
        // ceases before register contents are operated, do a full
        // flush here to ensure ample time for things to be correct.
        jal .fullflush
        halt

.fullflush:
        nop
        nop
        nop
        nop
        jr r7, 0

        // Pass:
        //   <--- setup --->
        //   r1 <-- 0x0001
        //   r2 <-- 0x10
        //   r7 <-- <PC+2>
        //   mem[0x10] <-- r1 (0x003)
        //   r1 <-- 0x0001
        //   <--- setup over --->
        //   r1 <-- mem[0x10]
        //   r4 <-- r1 + r1 ( RHS = 0x3 + 0x3 = 0x6)
        //   r7 <-- <PC+2>
        //
        // Fail:
        //   (any incorrect register content given above)
        //
        //   if output shows
        //      r4 <-- 0x2
        //         instead of
        //      r4 <-- 0x6
        //   Then r3 was assigned by: old RF contents of r1
        //            rather than by: forwarded contents of r1

// Write your assembly program for Problem 1 (a) #1 here.
//
// This program demonstrates EX to EX forwarding in
// two subsequent instructions. This test includes flushes
// to isolate this test as much as possible to just
// the behavior on the mux select logic for the alu.

.testbegin:
        // Load registers with some values.
        lbi r1, 0x10
        lbi r2, 0x20
        // Flush pipeline completely, we do not wish to test
        // RF bypassing here.
        jal .fullflush

	//  ___ Core of test is here ___
        // Do an ALU operation
        addi r2, r2, 0x01
        // Subsequent ALU operation should use 0x21 (ALU result),
        // not the prior value of r2 (0x20)
        add r3, r1, r2
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
        //   r1 <-- 0x10
        //   r2 <-- 0x20
        //   r7 <-- <PC+2>
        //   r2 <-- 0x21
        //   r3 <-- 0x31
        //   r7 <-- <PC+2>
        //      
        // Fail:
        //   (any incorrect register content given above)
        //   
        //   if difference on output shows
        //      - r3 <-- 0x31
        //      + r3 <-- 0x30
        //   Then r3 was assigned by: 0x10 + 0x20
        //            rather than by: 0x10 + 0x21
        //   ie: the value was read-out from the RF rather than from
        //       ex-ex forwarding.

/*
   CS/ECE 552, Spring '19
   Homework #6, Problem #1
  
   testbench for control module
*/
module control_hier_bench(/*AUTOARG*/);
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire       err;
    wire       RegWrite, DMemWrite,              // From top of control_hier.v
               DMemEn, ALUSrc2, PCSrc,           // From top of control_hier.v
               MemToReg, DMemDump, Jump;         // From top of control_hier.v
    wire [1:0] RegDst;                           // From top of control_hier.v
    wire [2:0] SESel;                            // From top of control_hier.v
    // End of automatics
    /*AUTOREGINPUT*/
    // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
    reg [4:0]  OpCode;                           // To top of control_hier.v
    reg [1:0]  Funct;                            // To top of control_hier.v
    // End of automatics

    //integer    cycle_count;

    wire       clk;
    wire       rst;

    reg        fail;

    // Instantiate the module we want to verify

    control_hier DUT(/*AUTOINST*/
                    // Outputs
                    .err                          (err),
                    .RegDst                       (RegDst),
                    .SESel                        (SESel),
                    .RegWrite                     (RegWrite),
                    .DMemWrite                    (DMemWrite),
                    .DMemEn                       (DMemEn),
                    .ALUSrc2                      (ALUSrc2),
                    .PCSrc                        (PCSrc),
                    .MemToReg                     (MemToReg),
                    .DMemDump                     (DMemDump),
                    .Jump                         (Jump),
                    // Inputs
                    .OpCode                       (OpCode),
                    .Funct                        (Funct));

   /* YOUR CODE HERE */
   initial begin
        fail = 0;
        Funct = 2'b00;
		OpCode = 5'b00000; //HALT
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b00001; //NOP
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end

		#10
		OpCode = 5'b01000; //SUBI
        if(RegDst != 2'b01) begin //
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel[2:1] != 2'b01) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01001; //ADDI
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel[2:1] != 2'b01) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
        
		#10
		OpCode = 5'b01010; //ANDNI
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel != 3'b000) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01011; //XORI
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel != 3'b000) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b10100; //ROLI
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b10101; //SLLI
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b10110; //RORI
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b10111; //SRLI
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b10000; //ST
        if(SESel[2:1] != 2'b01) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b10001; //LD
        if(RegDst != 2'b01) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel[2:1] != 2'b01) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b1) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b10011; //STU
        if(RegDst != 2'b10) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel[2:1] != 2'b01) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b11001; //BTR
        if(RegDst != 2'b00) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b1) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b11011; //ADD, SUB, XOR, ANDN
        if(RegDst != 2'b00) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b1) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b11010; //ROL, SLL, ROR, SRL
        if(RegDst != 2'b00) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b1) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b11100; //SEQ
        if(RegDst != 2'b00) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b1) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b11101; //SLT
        if(RegDst != 2'b00) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b1) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b11110; //SLE
        if(RegDst != 2'b00) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b1) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b11111; //SCO
        if(RegDst != 2'b00) begin
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b1) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end    

		#10
		OpCode = 5'b01100; //BNEZ
        if(SESel[2:1] != 2'b10) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("ERRORCHECK: Incorrect ALUSrc2");
        //    fail = 1;
			$stop;
        //end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end

		#10
		OpCode = 5'b01101; //BEQZ
        if(SESel[2:1] != 2'b10) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("ERRORCHECK: Incorrect ALUSrc2");
        //    fail = 1;
			$stop;
        //end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01110; //BLTZ
        if(SESel[2:1] != 2'b10) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("ERRORCHECK: Incorrect ALUSrc2");
        //    fail = 1;
			$stop;
        //end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01111; //BGEZ
        if(SESel[2:1] != 2'b10) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("ERRORCHECK: Incorrect ALUSrc2");
        //    fail = 1;
			$stop;
        //end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01000; //LBI
        if(RegDst != 2'b10) begin //
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel[2:1] != 2'b10) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("ERRORCHECK: Incorrect ALUSrc2");
        //    fail = 1;
			$stop;
        //end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01000; //SLBI
        if(RegDst != 2'b10) begin //
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel != 3'b001) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b1) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(ALUSrc2 != 1'b0) begin
            $display("ERRORCHECK: Incorrect ALUSrc2");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01000; //J
        if(SESel[2:1] != 2'b11) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b1) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01000; //JR
        if(SESel[2:1] != 2'b10) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b1) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01000; //JAL
        if(SESel[2:1] != 2'b11) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegDst != 2'b11) begin //
            $display("ERRORCHECK: Incorrect RegDst");
            fail = 1;
			$stop;
        end
        if(SESel != 3'b110 && SESel != 3'b111) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b1) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		#10
		OpCode = 5'b01000; //JALR
        if(SESel[2:1] != 2'b10) begin
            $display("ERRORCHECK: Incorrect SESel");
            fail = 1;
			$stop;
        end
        if(RegWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect RegWrite");
            fail = 1;
			$stop;
        end
        if(DMemWrite != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemWrite");
            fail = 1;
			$stop;
        end
        if(DMemEn != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEn");
            fail = 1;
			$stop;
        end
        if(PCSrc != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCSrc");
            fail = 1;
			$stop;
        end
        if(MemToReg != 1'b0) begin
            $display("ERRORCHECK: Incorrect MemToReg");
            fail = 1;
			$stop;
        end
        if(DMemDump != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemDump");
            fail = 1;
			$stop;
        end
//        if(PCImm != 1'b0) begin
//            $display("ERRORCHECK: Incorrect PCImm");
//            fail = 1;
//			$stop;
//        end
        if(Jump != 1'b1) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
        
        if (fail)
            $display("\nTEST FAILED\n");
        else
            $display("\nTEST PASSED\n");
        
        #10
        $stop;
    end

endmodule // control_hier_bench

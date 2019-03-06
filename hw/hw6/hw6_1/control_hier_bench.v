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

   integer    cycle_count;

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
		opCode = 00000; //HALT
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 00001; //NOP
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end

		opCode = 01000; //SUBI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01001; //ADDI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
        
		opCode = 01010; //ANDNI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01011; //XORI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 10100; //ROLI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 10101; //SLLI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 10110; //RORI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 10111; //SRLI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 10000; //ST
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
        if(DMemEnd != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 10001; //LD
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
        if(DMemEnd != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 10011; //STU
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
        if(DMemEnd != 1'b1) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 11001; //BTR
        if(Regdst != 2'b00) begin
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 11011; //ADD, SUB, XOR, ANDN
        if(Regdst != 2'b00) begin
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 11010; //ROL, SLL, ROR, SRL
        if(Regdst != 2'b00) begin
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 11100; //SEQ
        if(Regdst != 2'b00) begin
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 11101; //SLT
        if(Regdst != 2'b00) begin
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 11110; //SLE
        if(Regdst != 2'b00) begin
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 11111; //SCO
        if(Regdst != 2'b00) begin
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end    

		opCode = 01100; //BNEZ
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end

		opCode = 01101; //BEQZ
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01110; //BLTZ
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01111; //BGEZ
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01000; //LBI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01000; //SLBI
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01000; //J
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01000; //JR
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b1) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01000; //JAL
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b1) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b0) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
    
		opCode = 01000; //JALR
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
        if(DMemEnd != 1'b0) begin
            $display("ERRORCHECK: Incorrect DMemEnd");
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
        if(PCImm != 1'b0) begin
            $display("ERRORCHECK: Incorrect PCImm");
            fail = 1;
			$stop;
        end
        if(Jump != 1'b1) begin
            $display("ERRORCHECK: Incorrect Jump");
            fail = 1;
			$stop;
        end
        
        $stop;
    end

endmodule // control_hier_bench

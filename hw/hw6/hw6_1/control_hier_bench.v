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
               DMemEn, ALUSrc2, PCImm, PCSrc,    // From top of control_hier.v
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
                    .PCImm                        (PCImm),
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
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect DMemEn");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b1) begin
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 00000 , Cmd: Halt, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b00001; //NOP
        if(RegWrite != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect DMemEn");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 00001 , Cmd: NOP, ERRORCHECK: Incorrect Jump");
        end

		#10
		OpCode = 5'b01000; //SUBI
        if(RegDst != 2'b01) begin //
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel[2:1] != 2'b01) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01000 , Cmd: SUBI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b01001; //ADDI
        if(RegDst != 2'b01) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel[2:1] != 2'b01) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01001 , Cmd: ADDI, ERRORCHECK: Incorrect Jump");
        end
        
		#10
		OpCode = 5'b01010; //ANDNI
        if(RegDst != 2'b01) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel != 3'b000) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01010 , Cmd: ANDI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b01011; //XORI
        if(RegDst != 2'b01) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel != 3'b000) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01011 , Cmd: XORI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10100; //ROLI
        if(RegDst != 2'b01) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10100 , Cmd: ROLI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10101; //SLLI
        if(RegDst != 2'b01) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10101 , Cmd: SLLI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10110; //RORI
        if(RegDst != 2'b01) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10110 , Cmd: ROLI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10111; //SRLI
        if(RegDst != 2'b01) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10111 , Cmd: SRLI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10000; //ST
        if(SESel[2:1] != 2'b01) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b1) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b1) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10000 , Cmd: ST, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10001; //LD
        if(RegDst != 2'b01) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel[2:1] != 2'b01) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b1) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b1) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10001 , Cmd: LD, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10011; //STU
        if(RegDst != 2'b10) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel[2:1] != 2'b01) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b1) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b1) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10011 , Cmd: STU, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11001; //BTR
        if(RegDst != 2'b00) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b1) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11001 , Cmd: BTR, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11011; //ADD, SUB, XOR, ANDN
        if(RegDst != 2'b00) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b1) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11011 , Cmd: ADD/SUB/XOR/ANDN, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11010; //ROL, SLL, ROR, SRL
        if(RegDst != 2'b00) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b1) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11010 , Cmd: ROL/SLL/ROR/SRL, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11100; //SEQ
        if(RegDst != 2'b00) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b1) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11100 , Cmd: SEQ, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11101; //SLT
        if(RegDst != 2'b00) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b1) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11101 , Cmd: SLT, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11110; //SLE
        if(RegDst != 2'b00) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b1) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11110 , Cmd: SLE, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11111; //SCO
        if(RegDst != 2'b00) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect RegDst");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b1) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11111 , Cmd: SCO, ERRORCHECK: Incorrect Jump");
        end    

		#10
		OpCode = 5'b01100; //BNEZ
        if(SESel[2:1] != 2'b10) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect DMemEn");
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("OpCode = 11100 , Cmd: BNEZ, ERRORCHECK: Incorrect ALUSrc2");
        //end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01100 , Cmd: BNEZ, ERRORCHECK: Incorrect Jump");
        end

		#10
		OpCode = 5'b01101; //BEQZ
        if(SESel[2:1] != 2'b10) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect DMemEn");
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect ALUSrc2");
        //end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01101 , Cmd: BQEZ, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b01110; //BLTZ
        if(SESel[2:1] != 2'b10) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect DMemEn");
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect ALUSrc2");
        //end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01110 , Cmd: BLTZ, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b01111; //BGEZ
        if(SESel[2:1] != 2'b10) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect DMemEn");
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect ALUSrc2");
        //end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 01111, Cmd: BGEZ, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b11000; //LBI
        if(RegDst != 2'b10) begin //
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel[2:1] != 2'b10) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect DMemEn");
        end
        //if(ALUSrc2 != 1'b0) begin
        //    $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect ALUSrc2");
        //end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 11000, Cmd: LBI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b10010; //SLBI
        if(RegDst != 2'b10) begin //
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel != 3'b001) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b1) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect DMemEn");
        end
        if(ALUSrc2 != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect ALUSrc2");
        end
        if(PCSrc != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b0) begin
            $display("OpCode = 10010, Cmd: SLBI, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b00100; //J
        if(SESel[2:1] != 2'b11) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect DMemEn");
        end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect DMemDump");
        end
//        if(PCImm != 1'b1) begin
//            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect PCImm");
//        end
        if(Jump != 1'b0) begin
            $display("OpCode = 00100, Cmd: J, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b00101; //JR
        if(SESel[2:1] != 2'b10) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect DMemEn");
        end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b1) begin
            $display("OpCode = 00101, Cmd: JR, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b00110; //JAL
        if(SESel[2:1] != 2'b11) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect SESel");
        end
        if(RegDst != 2'b11) begin //
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect RegDst");
        end
        if(SESel != 3'b110 && SESel != 3'b111) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect DMemEn");
        end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect DMemDump");
        end
//        if(PCImm != 1'b1) begin
//            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect PCImm");
//        end
        if(Jump != 1'b0) begin
            $display("OpCode = 00110, Cmd: JAL, ERRORCHECK: Incorrect Jump");
        end
    
		#10
		OpCode = 5'b00111; //JALR
        if(SESel[2:1] != 2'b10) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect SESel");
        end
        if(RegWrite != 1'b0) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect RegWrite");
        end
        if(DMemWrite != 1'b0) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect DMemWrite");
        end
        if(DMemEn != 1'b0) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect DMemEn");
        end
        if(PCSrc != 1'b1) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect PCSrc");
        end
        if(MemToReg != 1'b0) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect MemToReg");
        end
        if(DMemDump != 1'b0) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect DMemDump");
        end
        if(PCImm != 1'b0) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect PCImm");
        end
        if(Jump != 1'b1) begin
            $display("OpCode = 00111, Cmd: JALR, ERRORCHECK: Incorrect Jump");
        end
        
        $display("\nTEST FINISHED\n");
        
        #10
        $stop;
    end

endmodule // control_hier_bench

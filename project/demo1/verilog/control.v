/*
   CS/ECE 552, Spring '19
   Homework #6, Problem #1
  
   This module determines all of the control logic for the processor.
*/
module control (/*AUTOARG*/
                // Outputs
                err, 
                RegDst,
                SESel,
                RegWrite,
                DMemWrite,
                DMemEn,
                ALUSrc2,
                PCSrc,
                PCImm,
                MemToReg,
                DMemDump,
                Jump,
		illegalOp,
		rti,
                // Inputs
                OpCode,
                Funct
                );

   // inputs
   input [4:0]  OpCode;
   input [1:0]  Funct;
   
   // outputs
   output       err;
   output       RegWrite, DMemWrite, DMemEn, ALUSrc2, PCSrc, 
                PCImm, MemToReg, DMemDump, Jump, illegalOp, rti;
   output [1:0] RegDst;
   output [2:0] SESel;

   /* YOUR CODE HERE */

   regWrite regwrite (.opcode(OpCode), .out(RegWrite));
   dMemWrite dmemwrite (.opcode(OpCode), .out(DMemWrite));
   dMemEn dmemen (.opcode(OpCode), .out(DMemEn));
   aluSrc2 alusrc2 (.opcode(OpCode), .out(ALUSrc2));
   pcSrc pcsrc (.opcode(OpCode), .out(PCSrc));
   pcImm pcimm (.opcode(OpCode), .out(PCImm));
   memToReg memtoreg (.opcode(OpCode), .out(MemToReg));
   dMemDump dmemdump (.opcode(OpCode), .out(DMemDump));
   jump jump (.opcode(OpCode), .out(Jump));
   regDst regdst (.opcode(OpCode), .out(RegDst));
   seSel sesel (.opcode(OpCode), .out(SESel));
   IllegalOp Illegaop (.opcode(OpCode), .out(illegalOp));
   Rti ri (.opcode(OpCode), .out(rti));

   assign err = ^{OpCode[0],
                  OpCode[1],
                  OpCode[2],
                  OpCode[3],
                  OpCode[4],
                  Funct[0],
                  Funct[1]} === 1'bX;
   
endmodule

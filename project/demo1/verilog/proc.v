/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err,
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // Fixme: change width on this when we know how many modules with errout
   // exist.


   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 ALUSrc2;                // From control of control.v
   wire                 DMemDump;               // From control of control.v
   wire                 DMemEn;                 // From control of control.v
   wire                 DMemWrite;              // From control of control.v
   wire                 Jump;                   // From control of control.v
   wire                 MemToReg;               // From control of control.v
   wire                 PCImm;                  // From control of control.v
   wire                 PCSrc;                  // From control of control.v
   wire [1:0]           RegDst;                 // From control of control.v
   wire                 RegWrite;               // From control of control.v
   wire [2:0]           SESel;                  // From control of control.v
   wire [15:0]          outData;                // From pc of reg_16b.v
   wire [15:0]          readData1;              // From rf_bypass of rf.v
   wire [15:0]          readData2;              // From rf_bypass of rf.v
   // End of automatics

   wire [15:0]          currPC;
   wire [15:0]          newPC;
   wire [15:0]          PCplus2;
   wire [15:0]          Inst;
   wire                 branchFlag;
   wire [15:0] 		jumpVal;
   wire [15:0]          AluRes;
   wire [15:0]          writeData;
   wire [2:0] 		writeRegSel;

   wire [15:0]          MemOut;
   wire [1:0]           errTemp;

   assign OpCode = Inst[15:11];
   assign branchFlag = PCImm | (PCSrc & AluRes[0]);
   assign writeData = MemToReg ? MemOut : AluRes;
   assign writeRegSel = RegDst[1] ? 
                             (RegDst[0] ? 3'b111 : Inst[10:8]) :
                             (RegDst[0] ? Inst[7:5] : Inst[4:2]);
   assign err = |errTemp;

   

   reg_16b  pc(/*AUTOINST*/
               // Outputs
               .outData                 (currPC),
               // Inputs
               .clk                     (clk),
               .rst                     (rst),
               .inData                  (newPC),
               .writeEn                 (writeEn));

   memory2c instructionmem(/*AUTOINST*/
                           // Outputs
                           .data_out            (Inst),
                           // Inputs
                           .data_in             (),
                           .addr                (currPC),
                           .enable              (1'b1),
                           .wr                  (),
                           .createdump          (),
                           .clk                 (clk),
                           .rst                 (rst));

   control  control(/*AUTOINST*/
                    // Outputs
                    .err                (errTemp[0]),
                    .RegWrite           (RegWrite),
                    .DMemWrite          (DMemWrite),
                    .DMemEn             (DMemEn),
                    .ALUSrc2            (ALUSrc2),
                    .PCSrc              (PCSrc),
                    .PCImm              (PCImm),
                    .MemToReg           (MemToReg),
                    .DMemDump           (DMemDump),
                    .Jump               (Jump),
                    .RegDst             (RegDst[1:0]),
                    .SESel              (SESel[2:0]),
                    // Inputs
                    .OpCode             (Inst[15:11]),
                    .Funct              (Inst[1:0]));

   PCAdder pc_adder(
                     // Outputs
                     .pc(newPC), 
                     .pc_plus2(PCplus2),
                     // Inputs
                     .basePC(currPC), 
                     .I(Inst[7:0]), 
                     .D(Inst[10:0]), 
                     .SESel(SESel[1]),
                     .Jump(Jump),
                     .branchFlag(branchFlag), 
                     .jumpValue(jumpVal));

   

   rf       rf_bypass(/*AUTOINST*/
                      // Outputs
                      .readData1        (readData1),
                      .readData2        (readData2),
                      .err              (errTemp[1]),
                      // Inputs
                      .clk              (clk),
                      .rst              (rst),
                      .readReg1Sel      (Inst[10:8]),
                      .readReg2Sel      (Inst[7:5]),
                      .writeRegSel      (writeRegSel),
                      .writeData        (writeData),
                      .writeEn          (RegWrite));

   alu      alu(
	        // Outputs
                .res(AluRes),
                .jumpVal(jumpVal),
                // Inputs
                .OpCode(Inst[15:11]),
                .funct(Inst[1:0]),
                .Rs(readData1),
                .Rt(readData2),
                .Pc(PCplus2),
                .Imm(Inst[7:0]));

   memory2c datamem(/*AUTOINST*/
                    // Outputs
                    .data_out           (MemOut),
                    // Inputs
                    .data_in            (readData2),
                    .addr               (AluRes),
                    .enable             (DMemEn),
                    .wr                 (DMemWrite),
                    .createdump         (createdump),
                    .clk                (clk),
                    .rst                (rst));

endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

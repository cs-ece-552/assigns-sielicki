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
   wire [15:0]          data_out;               // From instructionmem of memory2c.v, ...
   wire [15:0]          outData;                // From pc of reg_16b.v
   wire [15:0]          readData1;              // From rf_bypass of rf.v
   wire [15:0]          readData2;              // From rf_bypass of rf.v
   // End of automatics

   assign OpCode = data_out[15:11];
   
   
   

   reg_16b  pc(/*AUTOINST*/
               // Outputs
               .outData                 (outData[15:0]),
               // Inputs
               .clk                     (clk),
               .rst                     (rst),
               .inData                  (inData),
               .writeEn                 (writeEn));
   memory2c instructionmem(/*AUTOINST*/
                           // Outputs
                           .data_out            (data_out[15:0]),
                           // Inputs
                           .data_in             (data_in[15:0]),
                           .addr                (PC[15:0]),
                           .enable              (enable),
                           .wr                  (wr),
                           .createdump          (createdump),
                           .clk                 (clk),
                           .rst                 (rst));
   control  control(/*AUTOINST*/
                    // Outputs
                    .err                (err),
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
                    .OpCode             (OpCode[4:0]),
                    .Funct              (Funct[1:0]));
   rf       rf_bypass(/*AUTOINST*/
                      // Outputs
                      .readData1        (readData1[15:0]),
                      .readData2        (readData2[15:0]),
                      .err              (err),
                      // Inputs
                      .clk              (clk),
                      .rst              (rst),
                      .readReg1Sel      (readReg1Sel[2:0]),
                      .readReg2Sel      (readReg2Sel[2:0]),
                      .writeRegSel      (writeRegSel[2:0]),
                      .writeData        (writeData[15:0]),
                      .writeEn          (writeEn));
   //alu      alu(/*AUTOINST*/);
   memory2c datamem(/*AUTOINST*/
                    // Outputs
                    .data_out           (data_out[15:0]),
                    // Inputs
                    .data_in            (data_in[15:0]),
                    .addr               (addr[15:0]),
                    .enable             (enable),
                    .wr                 (wr),
                    .createdump         (createdump),
                    .clk                (clk),
                    .rst                (rst));

endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

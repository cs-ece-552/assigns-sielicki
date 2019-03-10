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
   wire [10] errout;

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   assign err = ^{clk, rst, errout} === 1'bX;


   reg_16b  pc(
               // Outputs
               .outData            (outData[15:0]),
               // Inputs
               .clk                (clk),
               .rst                (rst),
               .inData             (inData),
               .writeEn            (writeEn));
   

   rf       rf_bypass(
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


   memory2c instructionmem(
                     // Outputs
                     .data_out          (data_out[15:0]),
                     // Inputs
                     .data_in           (data_in[15:0]),
                     .addr              (addr[15:0]),
                     .enable            (enable),
                     .wr                (wr),
                     .createdump        (createdump),
                     .clk               (clk),
                     .rst               (rst));


   control control(
                   // Outputs
                   .err                 (err),
                   .RegWrite            (RegWrite),
                   .DMemWrite           (DMemWrite),
                   .DMemEn              (DMemEn),
                   .ALUSrc2             (ALUSrc2),
                   .PCSrc               (PCSrc),
                   .PCImm               (PCImm),
                   .MemToReg            (MemToReg),
                   .DMemDump            (DMemDump),
                   .Jump                (Jump),
                   .RegDst              (RegDst[1:0]),
                   .SESel               (SESel[2:0]),
                   // Inputs
                   .OpCode              (data_out[15:11]),
                   .Funct               (data_out[1:0]))


   alu alu(
           // Outputs
           .Out                         (Out[N-1:0]),
           .Ofl                         (Ofl),
           .Zero                        (Zero),
           // Inputs
           .A                           (A[N-1:0]),
           .B                           (B[N-1:0]),
           .Cin                         (Cin),
           .Op                          (Op[O-1:0]),
           .invA                        (invA),
           .invB                        (invB),
           .sign                        (sign))


     memory2c datamem( //VALUES NEED FIXING
                             // Outputs
                             .data_out          (data_out[15:0]),
                             // Inputs
                             .data_in           (data_in[15:0]),
                             .addr              (addr[15:0]),
                             .enable            (enable),
                             .wr                (wr),
                             .createdump        (createdump),
                             .clk               (clk),
                             .rst               (rst));
     

endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

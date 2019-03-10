/*
 INPUT:
 15:0 PC
 rst
 clk
 7:0 I   SIGN EXTEND
 10:0 D  SIGN EXTEND
 4:0 OPCODE
 branchFlag
 15:0 (RS+IMM)
 
 sign extension for 8 bits is
 
 I[7] & 1 ? (16'b1111111110000000 | I) : (16b'0000000011111111 & I)
 D[10] & 1 ? (16'b111110000000000 | D) : (16b'0000011111111111 & D)
 
 
 OUTPUT: 15:0 PC
 */


module PCAdder(/*AUTOARG*/
   // Outputs
   pc,
   // Inputs
   basePC, I, D, OpCode, branchFlag, jumpValue
   );
   //Outputs

//   parameter N =16;
   output [15:0] pc;

   // 00 : pc + 2 + I(sign extend)
   // 01   pc + 2 + D(sign extend)
   // 02 : rs + I(sign extend)

   //Inputs
   input [15:0] basePC;
   input [7:0] I;
   input [10:0] D;
   input [4:0]  OpCode;
   input        branchFlag;
   input [15:0] jumpValue;


   /*AUTOWIRE*/

   wire [15:0]          iSign,dSign, pc_plus2, pc_plusExt, extension, pcRelative;
   assign iSign = I[7] & 1 ? (16'b1111111110000000 | I) : (16b'0000000011111111 & I);
   assign dSign = D[10] & 1 ? (16'b111110000000000 | D) : (16b'0000011111111111 & D);
   
   rca_16b pc_plus_2(
                     // Outputs
                     .S                 (pc_plus2),
                     .C_out             (C_out),
                     // Inputs
                     .A                 (basePc),
                     .B                 (2'b10),
                     .C_in              (1'b0));

   wire                 dSig, bsig, registerJump;
   wire [15:0]          extension;
   d_iSig dsig(.opcode(OpCode), .out(dsig));

   mux2_1_16b muxImm (.InA(iSign), .InB(dSign), .S(dsig), .Out(extension));

   rca_16b pc_plus_ext(
                       // Outputs
                       .S               (pc_plusExt),
                       .C_out           (C_out),
                       // Inputs
                       .A               (pc_plus2),
                       .B               (extension),
                       .C_in            (1'b0));
   regJump regjump (.opcode(OpCode), .out(registerJump));
   mux2_1_16b muxBranch (.InA(pc_plus2), .InB(pc_plusExt), .S(branchFlag), .Out(pcRelative));
   mux2_1_16b pcFinal (.InA(pcRelative), .InB(jumpValue), .S(registerJump), .Out(pc));
endmodule // PCAdder

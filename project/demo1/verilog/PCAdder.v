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
   basePC, I
   );
   //Outputs
   
   output [15:0] pc;

   // 00 : pc + 2 + I(sign extend)
   // 01   pc + 2 + D(sign extend)
   // 02 : rs + I(sign extend)

   //Inputs
   input [15:0] basePC;
   input [15:0] I;

   rca_16b(/*AUTOARG*/
   // Outputs
   pc
   // Inputs
           pc, 1'd2,
   )




   
endmodule; // PCAdder

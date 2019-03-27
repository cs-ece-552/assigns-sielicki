/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 16-bit RCA module
*/
module rca_16b(A, B, C_in, S, C_out);

   // declare constant for size of inputs, outputs (N)
   parameter   N = 16;
   // Size of subadder block
   parameter   M = 4;

   input [N-1: 0] A, B;
   input 	   C_in;
   output [N-1:0]  S;
   output 	   C_out;

   wire 	   c0, c1, c2;

   rca_4b bit1(
	       // Outputs
	       .S			(S[3:0]),
	       .C_out			(c0),
	       // Inputs
	       .A			(A[3:0]),
	       .B			(B[3:0]),
	       .C_in			(C_in));
   rca_4b bit2(
	       // Outputs
	       .S			(S[7:4]),
	       .C_out			(c1),
	       // Inputs
	       .A			(A[7:4]),
	       .B			(B[7:4]),
	       .C_in			(c0));
   rca_4b bit3(
	       // Outputs
	       .S			(S[11:8]),
	       .C_out			(c2),
	       // Inputs
	       .A			(A[11:8]),
	       .B			(B[11:8]),
	       .C_in			(c1));
   rca_4b bit4(
	       // Outputs
	       .S			(S[15:12]),
	       .C_out			(C_out),
	       // Inputs
	       .A			(A[15:12]),
	       .B			(B[15:12]),
	       .C_in			(c2));



endmodule

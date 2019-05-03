/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 16-bit RCA module
*/
module cla_16b(A, B, C_in, S, C_out);

   // declare constant for size of inputs, outputs (N)
   parameter   N = 16;
   // Size of subadder block
   parameter   M = 4;

   input [N-1: 0] A, B;
   input 	   C_in;
   output [N-1:0]  S;
   output 	   C_out;

   wire 	   c1, c2, c3;
   wire       p0, p1, p2, p3;
   wire       g0, g1, g2, g3;

   assign c1 = g0 | (p0 & C_in); 
   assign c2 = g1 | (p1 & g0) | (p1 & p0 & C_in);
   assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & C_in);
   assign C_out = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & C_in);
   
   cla_4b bit1(
	       // Outputs
	       .S			(S[3:0]),
	       .gen         (g0),
           .prop        (p0),
	       // Inputs
	       .A			(A[3:0]),
	       .B			(B[3:0]),
	       .C_in		(C_in));
   cla_4b bit2(
	       // Outputs
	       .S			(S[7:4]),
	       .gen         (g1),
           .prop        (p1),
           // Inputs
	       .A			(A[7:4]),
	       .B			(B[7:4]),
	       .C_in		(c1));
   cla_4b bit3(
	       // Outputs
	       .S			(S[11:8]),
	       .gen         (g2),
           .prop        (p2),
           // Inputs
	       .A			(A[11:8]),
	       .B			(B[11:8]),
	       .C_in		(c2));
   cla_4b bit4(
	       // Outputs
	       .S			(S[15:12]),
	       .gen         (g3),
           .prop        (p3),
           // Inputs
	       .A			(A[15:12]),
	       .B			(B[15:12]),
	       .C_in		(c3));



endmodule

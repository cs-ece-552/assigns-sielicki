/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 4-bit RCA module
*/
module rca_4b(A, B, C_in, S, C_out);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 4;

    input [N-1: 0] A, B;
    input          C_in;
    output [N-1:0] S;
    output         C_out;

    wire 	   c1, c2, c3;


    fullAdder_1b one(
		     // Outputs
		     .S			(S[0]),
		     .C_out		(c1),
		     // Inputs
		     .A			(A[0]),
		     .B			(B[0]),
		     .C_in		(C_in));

    fullAdder_1b two(
		     // Outputs
		     .S			(S[1]),
		     .C_out		(c2),
		     // Inputs
		     .A			(A[1]),
		     .B			(B[1]),
		     .C_in		(c1));

   fullAdder_1b three(
		     // Outputs
		     .S			(S[2]),
		     .C_out		(c3),
		     // Inputs
		     .A			(A[2]),
		     .B			(B[2]),
		     .C_in		(c2));

   fullAdder_1b four(
		     // Outputs
		     .S			(S[3]),
		     .C_out		(C_out),
		     // Inputs
		     .A			(A[3]),
		     .B			(B[3]),
		     .C_in		(c3));

endmodule

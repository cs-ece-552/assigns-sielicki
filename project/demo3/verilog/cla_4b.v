/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 4-bit RCA module
*/
module cla_4b(A, B, C_in, S, gen, prop);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 4;

    input [N-1: 0] A, B;
    input          C_in;
    output [N-1:0] S;
    output         prop;
    output         gen;

    wire 	   c1, c2, c3;
    wire       p0, p1, p2, p3;
    wire       g0, g1, g2, g3;

    assign p0 = A[0] ^ B[0];
    assign p1 = A[1] ^ B[1];
    assign p2 = A[2] ^ B[2];
    assign p3 = A[3] ^ B[3];

    assign g0 = A[0] & B[0];
    assign g1 = A[1] & B[1];
    assign g2 = A[2] & B[2];
    assign g3 = A[3] & B[3];


    assign c1 = g0 | (p0 & C_in); 
    assign c2 = g1 | (p1 & g0) | (p1 & p0 & C_in);
    assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & C_in);
    assign gen = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & C_in);
    assign prop = p0 & p1 & p2 & p3;

    fullAdder_1b_cla one(
		     // Outputs
		     .S			(S[0]),
		     // Inputs
		     .A			(A[0]),
		     .B			(B[0]),
		     .C_in		(C_in));

    fullAdder_1b_cla two(
		     // Outputs
		     .S			(S[1]),
		     // Inputs
		     .A			(A[1]),
		     .B			(B[1]),
		     .C_in		(c1));

   fullAdder_1b_cla three(
		     // Outputs
		     .S			(S[2]),
		     // Inputs
		     .A			(A[2]),
		     .B			(B[2]),
		     .C_in		(c2));

   fullAdder_1b_cla four(
		     // Outputs
		     .S			(S[3]),
		     // Inputs
		     .A			(A[3]),
		     .B			(B[3]),
		     .C_in		(c3));

endmodule

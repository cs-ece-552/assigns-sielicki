/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    4-1 mux template
*/

module mux4_1(InA, InB, InC, InD, S, Out);
   input        InA, InB, InC, InD;
   input [1:0] 	 S;
   output 	 Out;

   wire 	 m1, m2;

   mux2_1 a(
	    // Outputs
	    .Out			(m1),
	    // Inputs
	    .InA			(InA),
	    .InB			(InB),
	    .S				(S[0]));
   mux2_1 b(
	    // Outputs
	    .Out			(m2),
	    // Inputs
	    .InA			(InC),
	    .InB			(InD),
	    .S				(S[0]));
   mux2_1 c(
	    // Outputs
	    .Out			(Out),
	    // Inputs
	    .InA			(m1),
	    .InB			(m2),
	    .S				(S[1]));
   
endmodule

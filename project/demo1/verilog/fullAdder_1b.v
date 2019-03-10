/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 1-bit full adder
*/
module fullAdder_1b(A, B, C_in, S, C_out);
   input  A, B;
   input   C_in;
   output  S;
   output  C_out;

   // THIS IS TOTALLY A VERY GOOD EDUCATIONAL EXPERIENCE.
   // THIS IS DEFINITELY NOT BUSY WORK.

   wire    a,b,c,d,e,f,g;

   nor2 one(
	    // Outputs
	    .out			(a),
	    // Inputs
	    .in1			(A),
	    .in2			(B));
   nor2 two(
	    // Outputs
	    .out			(b),
	    // Inputs
	    .in1			(A),
	    .in2			(a));
   nor2 three(
	      // Outputs
	      .out			(c),
	      // Inputs
	      .in1			(B),
	      .in2			(a));
   nor2 four(
	     // Outputs
	     .out			(d),
	     // Inputs
	     .in1			(b),
	     .in2			(c));
   nor2 five(
	     // Outputs
	     .out			(e),
	     // Inputs
	     .in1			(d),
	     .in2			(C_in));
   nor2 six(
	    // Outputs
	    .out			(C_out),
	    // Inputs
	    .in1			(e),
	    .in2			(a));
   nor2 seven(
	      // Outputs
	      .out			(g),
	      // Inputs
	      .in1			(e),
	      .in2			(d));
   nor2 eight(
	      // Outputs
	      .out			(f),
	      // Inputs
	      .in1			(e),
	      .in2			(C_in));
   nor2 nine(
	     // Outputs
	     .out			(S),
	     // Inputs
	     .in1			(f),
	     .in2			(g));

endmodule

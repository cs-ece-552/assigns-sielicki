/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2-1 mux template
*/
module mux2_1(InA, InB, S, Out);
   input   InA, InB;
   input    S;
   output   Out;

   wire     NotS, MaxA, MaxB;
   
   not1 i(
	  // Outputs
	  .out				(NotS),
	  // Inputs
	  .in1				(S));
   nand2 j(
	   // Inputs
	   .in1                         (NotS),
	   .in2                         (InA),
	   // Outputs
	   .out                         (MaxA));
   nand2 k(
	   // Inputs
	   .in1                         (S),
	   .in2                         (InB),
	   // Outputs
	   .out                         (MaxB));
   nand2 l(
	   // Inputs
	   .in1                         (MaxA),
	   .in2                         (MaxB),
	   // Outputs
	   .out                         (Out));
      
endmodule

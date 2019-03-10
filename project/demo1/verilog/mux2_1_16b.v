/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

*/
module mux2_1_16b(InA, InB, S, Out);

   // parameter N for length of inputs and outputs (to use with larger inputs/outputs)
   parameter N = 16;

   input [N-1:0]   InA, InB;
   input 	   S;
   output [N-1:0]   Out;

   mux2_1 bit0(
	       // Outputs
	       .Out			(Out[0]),
	       // Inputs
	       .InA			(InA[0]),
	       .InB			(InB[0]),
	       .S			(S));

      mux2_1 bit1(
	       // Outputs
	       .Out			(Out[1]),
	       // Inputs
	       .InA			(InA[1]),
	       .InB			(InB[1]),
	       .S			(S));

      mux2_1 bit2(
	       // Outputs
	       .Out			(Out[2]),
	       // Inputs
	       .InA			(InA[2]),
	       .InB			(InB[2]),
	       .S			(S));

      mux2_1 bit3(
	       // Outputs
	       .Out			(Out[3]),
	       // Inputs
	       .InA			(InA[3]),
	       .InB			(InB[3]),
	       .S			(S));

      mux2_1 bit4(
	       // Outputs
	       .Out			(Out[4]),
	       // Inputs
	       .InA			(InA[4]),
	       .InB			(InB[4]),
	       .S			(S));   

      mux2_1 bit5(
	       // Outputs
	       .Out			(Out[5]),
	       // Inputs
	       .InA			(InA[5]),
	       .InB			(InB[5]),
	       .S			(S));    


      mux2_1 bit6(
	       // Outputs
	       .Out			(Out[6]),
	       // Inputs
	       .InA			(InA[6]),
	       .InB			(InB[6]),
	       .S			(S));    

      mux2_1 bit7(
	       // Outputs
	       .Out			(Out[7]),
	       // Inputs
	       .InA			(InA[7]),
	       .InB			(InB[7]),
	       .S			(S));

      mux2_1 bit8(
	       // Outputs
	       .Out			(Out[8]),
	       // Inputs
	       .InA			(InA[8]),
	       .InB			(InB[8]),
	       .S			(S));

      mux2_1 bit9(
	       // Outputs
	       .Out			(Out[9]),
	       // Inputs
	       .InA			(InA[9]),
	       .InB			(InB[9]),
	       .S			(S)); 


      mux2_1 bit10(
	       // Outputs
	       .Out			(Out[10]),
	       // Inputs
	       .InA			(InA[10]),
	       .InB			(InB[10]),
	       .S			(S));    


      mux2_1 bit11(
	       // Outputs
	       .Out			(Out[11]),
	       // Inputs
	       .InA			(InA[11]),
	       .InB			(InB[11]),
	       .S			(S));     


      mux2_1 bit12(
	       // Outputs
	       .Out			(Out[12]),
	       // Inputs
	       .InA			(InA[12]),
	       .InB			(InB[12]),
	       .S			(S));

      mux2_1 bit13(
	       // Outputs
	       .Out			(Out[13]),
	       // Inputs
	       .InA			(InA[13]),
	       .InB			(InB[13]),
	       .S			(S));


      mux2_1 bit14(
	       // Outputs
	       .Out			(Out[14]),
	       // Inputs
	       .InA			(InA[14]),
	       .InB			(InB[14]),
	       .S			(S));

      mux2_1 bit15(
	       // Outputs
	       .Out			(Out[15]),
	       // Inputs
	       .InA			(InA[15]),
	       .InB			(InB[15]),
	       .S			(S));     
   
endmodule

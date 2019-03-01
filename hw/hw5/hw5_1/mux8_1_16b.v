/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a 4-bit (quad) 4-1 Mux template
*/
module mux8_1_16b(In, S, Out);

   parameter wIn   = 8; // Number of inputs
   parameter wData = 16; // Data Width
   parameter wSel  = 3;  // Select Width
 

   input [wData-1:0]          In [wIn-1:0];
   input [wSel-1:0] 	    S;
   output [wData-1:0] 	    Out;
   wire  [wData-1:0] 	    imm [3:0];

   mux4_1_16b im0(
	       // Outputs
	       .Out			(imm[0]),
	       // Inputs
	       .InA			(In[0]),
	       .InB			(In[1]),
	       .InC			(In[2]),
	       .InD			(In[3]),
	       .S			(S[1:0]));

   mux4_1_16b im1(
	       // Outputs
	       .Out			(imm[1]),
	       // Inputs
	       .InA			(In[4]),
	       .InB			(In[5]),
	       .InC			(In[6]),
	       .InD			(In[7]),
	       .S			(S[1:0]));

   mux2_1_16b outM(
	       // Outputs
	       .Out			(Out),
	       // Inputs
	       .InA			(imm[0]),
	       .InB			(imm[1]),
	       .S			(S[2]));

endmodule

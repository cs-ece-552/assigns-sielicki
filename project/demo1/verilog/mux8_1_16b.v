/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a 4-bit (quad) 4-1 Mux template
*/
module mux8_1_16b(In, S, Out);

   parameter wIn   = 8; // Number of inputs
   parameter wData = 16; // Data Width
   parameter wTotal = 128;
   parameter wSel  = 3;  // Select Width
 

   input [wTotal-1:0]          In;
   input [wSel-1:0] 	    S;
   output [wData-1:0] 	    Out;
   wire  [wData-1:0] 	    imm [3:0];

   mux4_1_16b im0(
	       // Outputs
	       .Out			(imm[0]),
	       // Inputs
	       .InA			(In[63:48]),
	       .InB			(In[47:32]),
	       .InC			(In[31:16]),
	       .InD			(In[15:0]),		  
	       .S			(S[1:0]));

   mux4_1_16b im1(
	       // Outputs
	       .Out			(imm[1]),
	       // Inputs
	       .InA			(In[127:112]),
	       .InB			(In[111:96]),		  
	       .InC			(In[95:80]),
	       .InD			(In[79:64]),
	       .S			(S[1:0]));

   mux2_1_16b outM(
	       // Outputs
	       .Out			(Out),
	       // Inputs
	       .InA			(imm[1]),
	       .InB			(imm[0]),
	       .S			(S[2]));

endmodule

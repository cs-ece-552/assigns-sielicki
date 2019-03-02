/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a 4-bit (quad) 4-1 Mux template
*/
module mux16_1_16b(In, S, Out);

   parameter wIn   = 16; // Number of inputs
   parameter wTotal = 256;
   parameter wData = 16; // Data Width
   parameter wSel  = 4;  // Select Width
 

   input [wTotal-1:0]          In;
   input [wSel-1:0] 	    S;
   output [wData-1:0] 	    Out;
   wire  [wData-1:0] 	    imm [3:0];

   mux4_1_16b im0(
	       // Outputs
	       .Out			(imm[0]),
	       // Inputs
	       .InA			(In[15:0]),
	       .InB			(In[31:16]),
	       .InC			(In[47:32]),
	       .InD			(In[63:48]),
	       .S			(S[1:0]));

   mux4_1_16b im1(
	       // Outputs
	       .Out			(imm[1]),
	       // Inputs
	       .InA			(In[79:64]),
	       .InB			(In[95:80]),
	       .InC			(In[111:96]),
	       .InD			(In[127:112]),
	       .S			(S[1:0]));

   mux4_1_16b im2(
	       // Outputs
	       .Out			(imm[2]),
	       // Inputs
	       .InA			(In[143:128]),
	       .InB			(In[159:144]),
	       .InC			(In[175:160]),
	       .InD			(In[191:176]),
	       .S			(S[1:0]));
   
   mux4_1_16b im3(
	       // Outputs
	       .Out			(imm[1]),
	       // Inputs
	       .InA			(In[207:192]),
	       .InB			(In[223:208]),
	       .InC			(In[239:224]),
	       .InD			(In[255:240]),
	       .S			(S[1:0]));

   mux4_1_16b outM(
	       // Outputs
	       .Out			(Out),
	       // Inputs
	       .InA			(imm[0]),
	       .InB			(imm[1]),
	       .InC			(imm[2]),
	       .InD			(imm[3]),
	       .S			(S[3:2]));

endmodule

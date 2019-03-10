/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1
    
    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the Op() value that is passed in (2 bit number).  It uses these
    shifts to shift the value any number of bits between 0 and 15 bits.
*/
module barrelShifter (In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   parameter   N = 16;
   parameter   C = 4;
   parameter   O = 2;
   
   input [N-1:0]   In;
   input [C-1:0]   Cnt;
   input [O-1:0]   Op;
   output [N-1:0]  Out;

   wire [N-1:0]    inr;
   wire [N-1:0]    outr;

   // Each Input is connected to two muxes. Additionally, the output
   // of those muxes is repeated for C stages with different offsets.
   // This 2D wire array holds all those wires.
   // Note, size of C portion being C+1 elements is intentional
   wire [N-1:0]    muxbus [C:0];
   
   //  Intentional Because the first input stage is just In
   assign muxbus[0][N-1:0] = Op[1] ? inr : In[N-1:0];
   //  And Out is the last elem of muxbus
   assign Out[N-1:0] = Op[1] ? outr : muxbus [C][N-1:0];





   // Reverse endianness of in and out.
   assign inr  = { In[0], In[1], In[2], In[3], In[4], In[5], In[6], In[7], In[8], In[9], In[10], In[11], In[12], In[13], In[14], In[15] };
   assign outr = { muxbus[C][0], 
		   muxbus[C][1], 
		   muxbus[C][2],
		   muxbus[C][3],
		   muxbus[C][4],
		   muxbus[C][5],
		   muxbus[C][6],
		   muxbus[C][7],
		   muxbus[C][8],
		   muxbus[C][9],
		   muxbus[C][10],
		   muxbus[C][11],
		   muxbus[C][12],
		   muxbus[C][13],
		   muxbus[C][14],
		   muxbus[C][15] };
   


   
   // Intermediate shift wires stored in this bus.
   wire [N-1:0]    shiftbus [C-1:0];
   
   // Assigns
   assign shiftbus[0][N-1:1] = muxbus[0][N-2:0];
   assign shiftbus[0][0] =   (Op[0] | ~Op[1] ? muxbus[0][N-1]     & {1 {(~Op[0])}} : muxbus[0][N-1]     & 0 | {1 {(muxbus[0][0])}});
   
   assign shiftbus[1][N-1:2] = muxbus[1][N-3:0];
   assign shiftbus[1][1:0] = (Op[0] | ~Op[1] ? muxbus[1][N-1:N-2] & {2 {(~Op[0])}} : muxbus[1][N-1:N-2] & 0 | {2 {(muxbus[0][0])}});
   
   assign shiftbus[2][N-1:4] = muxbus[2][N-5:0];
   assign shiftbus[2][3:0] = (Op[0] | ~Op[1] ? muxbus[2][N-1:N-4] & {4 {(~Op[0])}} : muxbus[2][N-1:N-4] & 0 | {4 {(muxbus[0][0])}});
      
   assign shiftbus[3][N-1:8] = muxbus[3][N-9:0];
   assign shiftbus[3][7:0] = (Op[0] | ~Op[1] ? muxbus[3][N-1:N-8] & {8 {(~Op[0])}} : muxbus[3][N-1:N-8] & 0 | {8 {(muxbus[0][0])}});
   

   // For loops are ILLEGAL! 


   mux2_1 inst00(
	       // Outputs
	       .Out			(muxbus[1][0]),
	       // Inputs
	       .InA			(muxbus[0][0]),
	       .InB			(shiftbus[0][0]),
	       .S			(Cnt[0]));
   
   mux2_1 inst01(
	       // Outputs
	       .Out			(muxbus[1][1]),
	       // Inputs
	       .InA			(muxbus[0][1]),
	       .InB			(shiftbus[0][1]),
	       .S			(Cnt[0]));

   mux2_1 inst02(
	       // Outputs
	       .Out			(muxbus[1][2]),
	       // Inputs
	       .InA			(muxbus[0][2]),
	       .InB			(shiftbus[0][2]),
	       .S			(Cnt[0]));

   mux2_1 inst03(
	       // Outputs
	       .Out			(muxbus[1][3]),
	       // Inputs
	       .InA			(muxbus[0][3]),
	       .InB			(shiftbus[0][3]),
	       .S			(Cnt[0]));

   mux2_1 inst04(
		// Outputs
		.Out			(muxbus[1][4]),
	       // Inputs
	       .InA			(muxbus[0][4]),
	       .InB			(shiftbus[0][4]),
	       .S			(Cnt[0]));
   
   mux2_1 inst05(
		// Outputs
		.Out			(muxbus[1][5]),
	       // Inputs
	       .InA			(muxbus[0][5]),
	       .InB			(shiftbus[0][5]),
	       .S			(Cnt[0]));

   mux2_1 inst06(
		// Outputs
		.Out			(muxbus[1][6]),
	       // Inputs
	       .InA			(muxbus[0][6]),
	       .InB			(shiftbus[0][6]),
	       .S			(Cnt[0]));

   mux2_1 inst07(
		// Outputs
		.Out			(muxbus[1][7]),
	       // Inputs
	       .InA			(muxbus[0][7]),
	       .InB			(shiftbus[0][7]),
	       .S			(Cnt[0]));

   mux2_1 inst08(
		// Outputs
		.Out			(muxbus[1][8]),
	       // Inputs
	       .InA			(muxbus[0][8]),
	       .InB			(shiftbus[0][8]),
	       .S			(Cnt[0]));

   mux2_1 inst09(
		// Outputs
		.Out			(muxbus[1][9]),
	       // Inputs
	       .InA			(muxbus[0][9]),
	       .InB			(shiftbus[0][9]),
	       .S			(Cnt[0]));


   mux2_1 inst0A(
		// Outputs
		.Out			(muxbus[1][10]),
	       // Inputs
	       .InA			(muxbus[0][10]),
	       .InB			(shiftbus[0][10]),
	       .S			(Cnt[0]));

   mux2_1 inst0B(
		// Outputs
		.Out			(muxbus[1][11]),
	       // Inputs
	       .InA			(muxbus[0][11]),
	       .InB			(shiftbus[0][11]),
	       .S			(Cnt[0]));

   mux2_1 inst0Cnt(
		// Outputs
		.Out			(muxbus[1][12]),
	       // Inputs
	       .InA			(muxbus[0][12]),
	       .InB			(shiftbus[0][12]),
	       .S			(Cnt[0]));

   mux2_1 inst0D(
		// Outputs
		.Out			(muxbus[1][13]),
	       // Inputs
	       .InA			(muxbus[0][13]),
	       .InB			(shiftbus[0][13]),
	       .S			(Cnt[0]));

   mux2_1 inst0E(
		// Outputs
		.Out			(muxbus[1][14]),
	       // Inputs
	       .InA			(muxbus[0][14]),
	       .InB			(shiftbus[0][14]),
	       .S			(Cnt[0]));

   mux2_1 inst0F(
		// Outputs
		.Out			(muxbus[1][15]),
	       // Inputs
	       .InA			(muxbus[0][15]),
	       .InB			(shiftbus[0][15]),
	       .S			(Cnt[0]));






   mux2_1 inst10(
	       // Outputs
	       .Out			(muxbus[2][0]),
	       // Inputs
	       .InA			(muxbus[1][0]),
	       .InB			(shiftbus[1][0]),
	       .S			(Cnt[1]));


   mux2_1 inst11(
	       // Outputs
	       .Out			(muxbus[2][1]),
	       // Inputs
	       .InA			(muxbus[1][1]),
	       .InB			(shiftbus[1][1]),
	       .S			(Cnt[1]));

   mux2_1 inst12(
	       // Outputs
	       .Out			(muxbus[2][2]),
	       // Inputs
	       .InA			(muxbus[1][2]),
	       .InB			(shiftbus[1][2]),
	       .S			(Cnt[1]));

   mux2_1 inst13(
	       // Outputs
	       .Out			(muxbus[2][3]),
	       // Inputs
	       .InA			(muxbus[1][3]),
	       .InB			(shiftbus[1][3]),
	       .S			(Cnt[1]));

   mux2_1 inst14(
		// Outputs
		.Out			(muxbus[2][4]),
	       // Inputs
	       .InA			(muxbus[1][4]),
	       .InB			(shiftbus[1][4]),
	       .S			(Cnt[1]));
   
   mux2_1 inst15(
		// Outputs
		.Out			(muxbus[2][5]),
	       // Inputs
	       .InA			(muxbus[1][5]),
	       .InB			(shiftbus[1][5]),
	       .S			(Cnt[1]));

   mux2_1 inst16(
		// Outputs
		.Out			(muxbus[2][6]),
	       // Inputs
	       .InA			(muxbus[1][6]),
	       .InB			(shiftbus[1][6]),
	       .S			(Cnt[1]));

   mux2_1 inst17(
		// Outputs
		.Out			(muxbus[2][7]),
	       // Inputs
	       .InA			(muxbus[1][7]),
	       .InB			(shiftbus[1][7]),
	       .S			(Cnt[1]));

   mux2_1 inst18(
		// Outputs
		.Out			(muxbus[2][8]),
	       // Inputs
	       .InA			(muxbus[1][8]),
	       .InB			(shiftbus[1][8]),
	       .S			(Cnt[1]));

   mux2_1 inst19(
		// Outputs
		.Out			(muxbus[2][9]),
	       // Inputs
	       .InA			(muxbus[1][9]),
	       .InB			(shiftbus[1][9]),
	       .S			(Cnt[1]));


   mux2_1 inst1A(
		// Outputs
		.Out			(muxbus[2][10]),
	       // Inputs
	       .InA			(muxbus[1][10]),
	       .InB			(shiftbus[1][10]),
	       .S			(Cnt[1]));

   mux2_1 inst1B(
		// Outputs
		.Out			(muxbus[2][11]),
	       // Inputs
	       .InA			(muxbus[1][11]),
	       .InB			(shiftbus[1][11]),
	       .S			(Cnt[1]));

   mux2_1 inst1Cnt(
		// Outputs
		.Out			(muxbus[2][12]),
	       // Inputs
	       .InA			(muxbus[1][12]),
	       .InB			(shiftbus[1][12]),
	       .S			(Cnt[1]));

   mux2_1 inst1D(
		// Outputs
		.Out			(muxbus[2][13]),
	       // Inputs
	       .InA			(muxbus[1][13]),
	       .InB			(shiftbus[1][13]),
	       .S			(Cnt[1]));

   mux2_1 inst1E(
		// Outputs
		.Out			(muxbus[2][14]),
	       // Inputs
	       .InA			(muxbus[1][14]),
	       .InB			(shiftbus[1][14]),
	       .S			(Cnt[1]));

   mux2_1 inst1F(
		// Outputs
		.Out			(muxbus[2][15]),
	       // Inputs
	       .InA			(muxbus[1][15]),
	       .InB			(shiftbus[1][15]),
	       .S			(Cnt[1]));





   mux2_1 inst20(
	       // Outputs
	       .Out			(muxbus[3][0]),
	       // Inputs
	       .InA			(muxbus[2][0]),
	       .InB			(shiftbus[2][0]),
	       .S			(Cnt[2]));


   mux2_1 inst21(
	       // Outputs
	       .Out			(muxbus[3][1]),
	       // Inputs
	       .InA			(muxbus[2][1]),
	       .InB			(shiftbus[2][1]),
	       .S			(Cnt[2]));

   mux2_1 inst22(
	       // Outputs
	       .Out			(muxbus[3][2]),
	       // Inputs
	       .InA			(muxbus[2][2]),
	       .InB			(shiftbus[2][2]),
	       .S			(Cnt[2]));

   mux2_1 inst23(
	       // Outputs
	       .Out			(muxbus[3][3]),
	       // Inputs
	       .InA			(muxbus[2][3]),
	       .InB			(shiftbus[2][3]),
	       .S			(Cnt[2]));

   mux2_1 inst24(
		// Outputs
		.Out			(muxbus[3][4]),
	       // Inputs
	       .InA			(muxbus[2][4]),
	       .InB			(shiftbus[2][4]),
	       .S			(Cnt[2]));
   
   mux2_1 inst25(
		// Outputs
		.Out			(muxbus[3][5]),
	       // Inputs
	       .InA			(muxbus[2][5]),
	       .InB			(shiftbus[2][5]),
	       .S			(Cnt[2]));

   mux2_1 inst26(
		// Outputs
		.Out			(muxbus[3][6]),
	       // Inputs
	       .InA			(muxbus[2][6]),
	       .InB			(shiftbus[2][6]),
	       .S			(Cnt[2]));

   mux2_1 inst27(
		// Outputs
		.Out			(muxbus[3][7]),
	       // Inputs
	       .InA			(muxbus[2][7]),
	       .InB			(shiftbus[2][7]),
	       .S			(Cnt[2]));

   mux2_1 inst28(
		// Outputs
		.Out			(muxbus[3][8]),
	       // Inputs
	       .InA			(muxbus[2][8]),
	       .InB			(shiftbus[2][8]),
	       .S			(Cnt[2]));

   mux2_1 inst29(
		// Outputs
		.Out			(muxbus[3][9]),
	       // Inputs
	       .InA			(muxbus[2][9]),
	       .InB			(shiftbus[2][9]),
	       .S			(Cnt[2]));


   mux2_1 inst2A(
		// Outputs
		.Out			(muxbus[3][10]),
	       // Inputs
	       .InA			(muxbus[2][10]),
	       .InB			(shiftbus[2][10]),
	       .S			(Cnt[2]));

   mux2_1 inst2B(
		// Outputs
		.Out			(muxbus[3][11]),
	       // Inputs
	       .InA			(muxbus[2][11]),
	       .InB			(shiftbus[2][11]),
	       .S			(Cnt[2]));

   mux2_1 inst2Cnt(
		// Outputs
		.Out			(muxbus[3][12]),
	       // Inputs
	       .InA			(muxbus[2][12]),
	       .InB			(shiftbus[2][12]),
	       .S			(Cnt[2]));

   mux2_1 inst2D(
		// Outputs
		.Out			(muxbus[3][13]),
	       // Inputs
	       .InA			(muxbus[2][13]),
	       .InB			(shiftbus[2][13]),
	       .S			(Cnt[2]));

   mux2_1 inst2E(
		// Outputs
		.Out			(muxbus[3][14]),
	       // Inputs
	       .InA			(muxbus[2][14]),
	       .InB			(shiftbus[2][14]),
	       .S			(Cnt[2]));

   mux2_1 inst2F(
		// Outputs
		.Out			(muxbus[3][15]),
	       // Inputs
	       .InA			(muxbus[2][15]),
	       .InB			(shiftbus[2][15]),
	       .S			(Cnt[2]));












   
   mux2_1 inst30(
	       // Outputs
	       .Out			(muxbus[4][0]),
	       // Inputs
	       .InA			(muxbus[3][0]),
	       .InB			(shiftbus[3][0]),
	       .S			(Cnt[3]));


   mux2_1 inst31(
	       // Outputs
	       .Out			(muxbus[4][1]),
	       // Inputs
	       .InA			(muxbus[3][1]),
	       .InB			(shiftbus[3][1]),
	       .S			(Cnt[3]));

   mux2_1 inst32(
	       // Outputs
	       .Out			(muxbus[4][2]),
	       // Inputs
	       .InA			(muxbus[3][2]),
	       .InB			(shiftbus[3][2]),
	       .S			(Cnt[3]));

   mux2_1 inst33(
	       // Outputs
	       .Out			(muxbus[4][3]),
	       // Inputs
	       .InA			(muxbus[3][3]),
	       .InB			(shiftbus[3][3]),
	       .S			(Cnt[3]));

   mux2_1 inst34(
		// Outputs
		.Out			(muxbus[4][4]),
	       // Inputs
	       .InA			(muxbus[3][4]),
	       .InB			(shiftbus[3][4]),
	       .S			(Cnt[3]));
   
   mux2_1 inst35(
		// Outputs
		.Out			(muxbus[4][5]),
	       // Inputs
	       .InA			(muxbus[3][5]),
	       .InB			(shiftbus[3][5]),
	       .S			(Cnt[3]));

   mux2_1 inst36(
		// Outputs
		.Out			(muxbus[4][6]),
	       // Inputs
	       .InA			(muxbus[3][6]),
	       .InB			(shiftbus[3][6]),
	       .S			(Cnt[3]));

   mux2_1 inst37(
		// Outputs
		.Out			(muxbus[4][7]),
	       // Inputs
	       .InA			(muxbus[3][7]),
	       .InB			(shiftbus[3][7]),
	       .S			(Cnt[3]));

   mux2_1 inst38(
		// Outputs
		.Out			(muxbus[4][8]),
	       // Inputs
	       .InA			(muxbus[3][8]),
	       .InB			(shiftbus[3][8]),
	       .S			(Cnt[3]));

   mux2_1 inst39(
		// Outputs
		.Out			(muxbus[4][9]),
	       // Inputs
	       .InA			(muxbus[3][9]),
	       .InB			(shiftbus[3][9]),
	       .S			(Cnt[3]));


   mux2_1 inst3A(
		// Outputs
		.Out			(muxbus[4][10]),
	       // Inputs
	       .InA			(muxbus[3][10]),
	       .InB			(shiftbus[3][10]),
	       .S			(Cnt[3]));

   mux2_1 inst3B(
		// Outputs
		.Out			(muxbus[4][11]),
	       // Inputs
	       .InA			(muxbus[3][11]),
	       .InB			(shiftbus[3][11]),
	       .S			(Cnt[3]));

   mux2_1 inst3Cnt(
		// Outputs
		.Out			(muxbus[4][12]),
	       // Inputs
	       .InA			(muxbus[3][12]),
	       .InB			(shiftbus[3][12]),
	       .S			(Cnt[3]));

   mux2_1 inst3D(
		// Outputs
		.Out			(muxbus[4][13]),
	       // Inputs
	       .InA			(muxbus[3][13]),
	       .InB			(shiftbus[3][13]),
	       .S			(Cnt[3]));

   mux2_1 inst3E(
		// Outputs
		.Out			(muxbus[4][14]),
	       // Inputs
	       .InA			(muxbus[3][14]),
	       .InB			(shiftbus[3][14]),
	       .S			(Cnt[3]));

   mux2_1 inst3F(
		// Outputs
		.Out			(muxbus[4][15]),
	       // Inputs
	       .InA			(muxbus[3][15]),
	       .InB			(shiftbus[3][15]),
	       .S			(Cnt[3]));

   
endmodule

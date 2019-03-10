module barrelShifter2 (In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   
   parameter   N = 16;
   parameter   C = 4;

   input [N-1:0]   In;
   input [C-1:0]   Cnt;
   input Op;
   output [N-1:0]  Out;
   
   wire [15:0]rshift1 ;
   wire [15:0]rshift2 ;
   wire [15:0]rshift4 ;
   wire [15:0]rshift8 ;
   
   wire [15:0]rr1 ;
   wire [15:0]rr2 ;
   wire [15:0]rr4 ;
   wire [15:0]rr8 ;
   
   assign rshift1 = Cnt[0] ? {1'b0, In[15:1]} : In;
   assign rshift2 = Cnt[1] ? {2'b00, rshift1[15:2]} : rshift1;
   assign rshift4 = Cnt[2] ? {4'b0000, rshift2[15:4]} : rshift2;
   assign rshift8 = Cnt[3] ? {8'b00000000, rshift4[15:8]} : rshift4;
   
   assign rr1 = Cnt[0] ? {In[0],In[15:1]} : In;
   assign rr2 = Cnt[1] ? {lr1[1:0], rr1[15:2]} : rr1;
   assign rr4 = Cnt[2] ? {lr2[3:0], rr2[15:4]} : rr2;
   assign r8 = Cnt[3] ? {lr4[7:0], rr4[15:8]} : rr4;
   
   assign Out = Op ? rshift8 : rr8;
   
endmodule
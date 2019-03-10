module barrelShifter2 (In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   
   parameter   N = 16;
   parameter   C = 4;

   input [N-1:0]   In;
   input [C-1:0]   Cnt;
   input Op;
   output [N-1:0]  Out;
   
   wire lshift1 [15:0];
   wire lshift2 [15:0];
   wire lshift4 [15:0];
   wire lshift8 [15:0];
   
   wire lr1 [15:0];
   wire lr2 [15:0];
   wire lr4 [15:0];
   wire lr8 [15:0];
   
   assign lshift1 = Cnt[0] ? {1'b0, In[15:1]};
   assign lshift2 = Cnt[1] ? {2'b00, lshift1[15:2]};
   assign lshift4 = Cnt[2] ? {4'b0000, lshift2[15:4]};
   assign lshift8 = Cnt[3] ? {8'b00000000, lshift4[15:8]};
   
   assign lr1 = Cnt[0] ? {In[0],In[15:1]};
   assign lr2 = Cnt[1] ? {lr[1:0], lr1[15:2]};
   assign lr4 = Cnt[2] ? {lr[3:0], lr2[15:4]};
   assign lr8 = Cnt[3] ? {lr[7:0], lr4[15:8]};
   
   assign Out = Op ? lshift8 : lr8;
   
endmodule;
module mux2_1_2(InA, InB, S, Out);
   input [1:0] InA, InB;
   input S;
   output [1:0] Out;

   assign Out[0] = (~S & InA[0]) | (S & InB[0]);
   assign Out[1] = (~S & InA[1]) | (S & InB[1]);

endmodule // mux2_1


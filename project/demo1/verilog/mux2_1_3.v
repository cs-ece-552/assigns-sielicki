module mux2_1_3(InA, InB, S, Out);
   input [2:0] InA, InB;
   input       S;
   output [2:0] Out;

   assign Out[0] = (~S & InA[0]) | (S & InB[0]);
   assign Out[1] = (~S & InA[1]) | (S & InB[1]);
   assign Out[2] = (~S & InA[2]) | (S & InB[2]);

endmodule // mux2_1


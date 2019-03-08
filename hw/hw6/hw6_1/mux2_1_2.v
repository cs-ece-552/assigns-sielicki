module mux2_1_2(InA, InB, S, Out);
   input [1:0] InA, InB;
   input S;
   output [2:0] Out;

   assign Out = (~S & InA) | (S & InB);

endmodule // mux2_1


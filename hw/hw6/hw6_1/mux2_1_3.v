module mux2_1_3(InA, InB, S, Out);
   input [3:0] InA, InB;
   input       S;
   output [3:0] Out;

   assign Out = (~S & InA) | (S & InB);

endmodule // mux2_1


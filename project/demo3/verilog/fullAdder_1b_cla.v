/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 1-bit full adder
*/
module fullAdder_1b_cla(A, B, C_in, S);
   input  A, B;
   input   C_in;
   output  S;

   assign S = A ^ B ^ C_in;

endmodule

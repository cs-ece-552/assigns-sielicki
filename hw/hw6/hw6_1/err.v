module err(opcode, out);
   input [4:0] opcode;
   output      out;
   wire        funct;

   xnor5_1 xnor0  (.opcode(opcode), .func(5'bxxxxx), .out(funct));
   assign out = funct;

endmodule; // dMemWrite


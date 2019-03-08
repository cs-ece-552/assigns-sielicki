module dMemDump(opcode, out);
   input [4:0] opcode;
   output      out;
   wire        funct;

   xnor5_1 xnor0  (.opcode(opcode), .func(4'b00000), .out(funct));
   assign out = funct;

endmodule; // dMemWrite


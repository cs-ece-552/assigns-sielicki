module dMemEn(opcode, out);
   input [4:0] opcode;
   output      out;
   wire        funct[2:0];

   xnor5_1 xnor0  (.opcode(opcode), .func(5'b10000), .out(funct[0]));
   xnor5_1 xnor1  (.opcode(opcode), .func(5'b10001), .out(funct[1]));
   xnor5_1 xnor2  (.opcode(opcode), .func(5'b10011), .out(funct[2]));

   assign out = funct[0] | funct[1] | funct[2];

endmodule // dMemWrite


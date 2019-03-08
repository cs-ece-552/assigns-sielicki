module pcSrc(opcode, out);
   input [4:0] opcode;
   output      out;
   wire        funct[3:0];

   xnor5_1 xnor0  (.opcode(opcode), .func(5'b01100), .out(funct[0]));
   xnor5_1 xnor1  (.opcode(opcode), .func(5'b01101), .out(funct[1]));
   xnor5_1 xnor2  (.opcode(opcode), .func(5'b01110), .out(funct[2]));
   xnor5_1 xnor3  (.opcode(opcode), .func(5'b01111), .out(funct[3]));

   assign out = funct[0] | funct[1] | funct[2] | funct[3];

endmodule; // dMemWrite


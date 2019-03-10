module aluSrc2(opcode, out);
   input [4:0] opcode;
   output      out;
   wire        funct[5:0];

   xnor5_1 xnor0  (.opcode(opcode), .func(5'b11011), .out(funct[0]));
   xnor5_1 xnor1  (.opcode(opcode), .func(5'b11010), .out(funct[1]));
   xnor5_1 xnor2  (.opcode(opcode), .func(5'b11100), .out(funct[2]));
   xnor5_1 xnor3  (.opcode(opcode), .func(5'b11101), .out(funct[3]));
   xnor5_1 xnor4  (.opcode(opcode), .func(5'b11110), .out(funct[4]));
   xnor5_1 xnor5  (.opcode(opcode), .func(5'b11111), .out(funct[5]));

   assign out = funct[0] | funct[1] | funct[2] | funct[3] | funct[4] | funct[5];

endmodule; // dMemWrite


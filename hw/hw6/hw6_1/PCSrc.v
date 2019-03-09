module pcSrc(opcode, out);
   input [4:0] opcode;
   output      out;
   wire        funct[7:0];

   xnor5_1 xnor0  (.opcode(opcode), .func(5'b01100), .out(funct[0]));
   xnor5_1 xnor1  (.opcode(opcode), .func(5'b01101), .out(funct[1]));
   xnor5_1 xnor2  (.opcode(opcode), .func(5'b01110), .out(funct[2]));
   xnor5_1 xnor3  (.opcode(opcode), .func(5'b01111), .out(funct[3]));
   
   xnor5_1 xnor4  (.opcode(opcode), .func(5'b00100), .out(funct[4]));
   xnor5_1 xnor5  (.opcode(opcode), .func(5'b00101), .out(funct[5]));
   xnor5_1 xnor6  (.opcode(opcode), .func(5'b00110), .out(funct[6]));
   xnor5_1 xnor7  (.opcode(opcode), .func(5'b00111), .out(funct[7]));

   assign out =  funct[0] | funct[1] | funct[2] |funct[3] |funct[4] |funct[5] |funct[6] |funct[7];

endmodule; // dMemWrite


module regWrite(opcode, out);
   input [4:0] opcode;
   output      out;

   wire        funct[20:0];
   
   xnor5_1 xnor0  (.opcode(opcode), .func(5'b01000), .out(funct[0]));
   xnor5_1 xnor1  (.opcode(opcode), .func(5'b01001), .out(funct[1]));
   xnor5_1 xnor2  (.opcode(opcode), .func(5'b01010), .out(funct[2]));
   xnor5_1 xnor3  (.opcode(opcode), .func(5'b01011), .out(funct[3]));
   xnor5_1 xnor4  (.opcode(opcode), .func(5'b10100), .out(funct[4]));
   xnor5_1 xnor5  (.opcode(opcode), .func(5'b10101), .out(funct[5]));
   xnor5_1 xnor6  (.opcode(opcode), .func(5'b10110), .out(funct[6]));
   xnor5_1 xnor7  (.opcode(opcode), .func(5'b10111), .out(funct[7]));
   xnor5_1 xnor8  (.opcode(opcode), .func(5'b10001), .out(funct[8]));
   xnor5_1 xnor9  (.opcode(opcode), .func(5'b10011), .out(funct[9]));
   xnor5_1 xnor10 (.opcode(opcode), .func(5'b11001), .out(funct[10]));
   xnor5_1 xnor11 (.opcode(opcode), .func(5'b11011), .out(funct[11]));
   xnor5_1 xnor12 (.opcode(opcode), .func(5'b11010), .out(funct[12]));
   xnor5_1 xnor13 (.opcode(opcode), .func(5'b11100), .out(funct[13]));
   xnor5_1 xnor14 (.opcode(opcode), .func(5'b11101), .out(funct[14]));
   xnor5_1 xnor15 (.opcode(opcode), .func(5'b11110), .out(funct[15]));
   xnor5_1 xnor16 (.opcode(opcode), .func(5'b11111), .out(funct[16]));
   xnor5_1 xnor17 (.opcode(opcode), .func(5'b11000), .out(funct[17]));
   xnor5_1 xnor18 (.opcode(opcode), .func(5'b10010), .out(funct[18]));
   xnor5_1 xnor19 (.opcode(opcode), .func(5'b00110), .out(funct[19]));
   xnor5_1 xnor20 (.opcode(opcode), .func(5'b00111), .out(funct[20]));
   

   assign out = funct[0]|funct[1]|funct[2]|funct[3]|funct[4]|funct[5]|funct[6]|funct[7]|funct[8]|funct[9]|funct[10]|funct[11]|funct[12]|funct[13]|funct[14]|funct[15]|funct[16]|funct[17]|funct[18]|funct[19]|funct[20];

endmodule // regWrite

     

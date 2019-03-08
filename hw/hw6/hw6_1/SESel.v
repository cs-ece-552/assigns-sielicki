module seSel(opcode, out);
   input [4:0] opcode;
   output [2:0] out;
   
   wire [5:0]  zero_zero_zero_funct;
   wire        zero_zero_one_funct;
   wire [3:0]  zero_one_x_funct;
   wire [6:0]  one_zero_x_funct;
   wire [1:0]  one_one_x_funct;
 
   
   wire [1:0]  mux000,mux001,mux01x, mux10x;
   wire        final000, final001, final01x, final10x, final11x;
   
   

   xnor5_1 zero_zero_zero0 (.opcode(opcode), .func(5'b01010), .out(zero_zero_zero_funct[0]));
   xnor5_1 zero_zero_zero1 (.opcode(opcode), .func(5'b01011), .out(zero_zero_zero_funct[1]));
   xnor5_1 zero_zero_zero2 (.opcode(opcode), .func(5'b10100), .out(zero_zero_zero_funct[2]));
   xnor5_1 zero_zero_zero3 (.opcode(opcode), .func(5'b10101), .out(zero_zero_zero_funct[3]));
   xnor5_1 zero_zero_zero4 (.opcode(opcode), .func(5'b10110), .out(zero_zero_zero_funct[4]));
   xnor5_1 zero_zero_zero5 (.opcode(opcode), .func(5'b10111), .out(zero_zero_zero_funct[5]));
   
   xnor5_1 zero_zero_one (.opcode(opcode), .func(5'b10010), .out(zero_zero_one_funct));
   
   xnor5_1 zero_one_x0 (.opcode(opcode), .func(5'b01000), .out(zero_one_x_funct[0]));
   xnor5_1 zero_one_x1 (.opcode(opcode), .func(5'b01001), .out(zero_one_x_funct[1]));
   xnor5_1 zero_one_x2 (.opcode(opcode), .func(5'b10000), .out(zero_one_x_funct[2]));
   xnor5_1 zero_one_x3 (.opcode(opcode), .func(5'b10001), .out(zero_one_x_funct[3]));

   xnor5_1 one_zero_x0 (.opcode(opcode), .func(5'b01100), .out(one_zero_x_funct[0]));
   xnor5_1 one_zero_x1 (.opcode(opcode), .func(5'b01101), .out(one_zero_x_funct[1]));
   xnor5_1 one_zero_x2 (.opcode(opcode), .func(5'b01110), .out(one_zero_x_funct[2]));
   xnor5_1 one_zero_x3 (.opcode(opcode), .func(5'b01111), .out(one_zero_x_funct[3]));
   xnor5_1 one_zero_x4 (.opcode(opcode), .func(5'b11000), .out(one_zero_x_funct[4]));
   xnor5_1 one_zero_x5 (.opcode(opcode), .func(5'b00101), .out(one_zero_x_funct[5]));
   xnor5_1 one_zero_x6 (.opcode(opcode), .func(5'b00111), .out(one_zero_x_funct[6]));
   
   xnor5_1 one_one_x0 (.opcode(opcode), .func(5'b00100), .out(one_one_x_funct[0]));
   xnor5_1 one_one_x1 (.opcode(opcode), .func(5'b00110), .out(one_one_x_funct[1]));

   assign final000 = zero_zero_zero_funct[0]|zero_zero_zero_funct[1]|zero_zero_zero_funct[2]|zero_zero_zero_funct[3]|zero_zero_zero_funct[4]|zero_zero_zero_funct[5];

   assign final001 = zero_zero_one_funct;

   assign final01x =zero_one_x_funct[0]|zero_one_x_funct[1]|zero_one_x_funct[2]|zero_one_x_funct[3];

   assign final10x = one_zero_x_funct[0]|one_zero_x_funct[1]|one_zero_x_funct[2]|one_zero_x_funct[3]|one_zero_x_funct[4]|one_zero_x_funct[5]|one_zero_x_funct[6];

   assign final11x = one_one_x_funct[0]|one_one_x_funct[1];
   
   mux2_1_3 mux_zero_zero_zero (.InA(3'b000), .InB(3'b000), .S(final000), .Out(mux000));
   mux2_1_3 mux_zero_zero_one (.InA(mux000), .InB(3'b001), .S(final001), .Out(mux001));
   mux2_1_3 mux_zero_one_x (.InA(mux001), .InB(3'b010), .S(final01x), .Out(mux01x));
   mux2_1_3 mux_one_zero_x (.InA(mux01x), .InB(3'b100), .S(final10x), .Out(mux10x));
   mux2_1_3 mux_one_one_x (.InA(mux01x), .InB(3'b110), .S(final11x), .Out(out));

endmodule; // dMemWrite


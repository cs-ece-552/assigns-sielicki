module regDst(opcode, out);
   input [4:0] opcode;
   output [1:0] out;
   
   wire [6:0]  zero_zero_funct;
   wire [8:0]  zero_one_funct;
   wire [1:0]  one_zero_funct;
   wire [1:0]  one_one_funct;
   
   wire [1:0]  mux00,mux01,mux10;
   wire        finalZeroZero, finalZeroOne, finalOneZero, finalOneOne;
   
   

   xnor5_1 zero_zero0 (.opcode(opcode), .func(5'b11001), .out(zero_zero_funct[0]));
   xnor5_1 zero_zero1 (.opcode(opcode), .func(5'b11011), .out(zero_zero_funct[1]));
   xnor5_1 zero_zero2 (.opcode(opcode), .func(5'b11010), .out(zero_zero_funct[2]));
   xnor5_1 zero_zero3 (.opcode(opcode), .func(5'b11100), .out(zero_zero_funct[3]));
   xnor5_1 zero_zero4 (.opcode(opcode), .func(5'b11101), .out(zero_zero_funct[4]));
   xnor5_1 zero_zero5 (.opcode(opcode), .func(5'b11110), .out(zero_zero_funct[5]));
   xnor5_1 zero_zero6 (.opcode(opcode), .func(5'b11111), .out(zero_zero_funct[6]));
   
   xnor5_1 zero_one0 (.opcode(opcode), .func(5'b01001), .out(zero_one_funct[0]));
   xnor5_1 zero_one1 (.opcode(opcode), .func(5'b01010), .out(zero_one_funct[1]));
   xnor5_1 zero_one2 (.opcode(opcode), .func(5'b01011), .out(zero_one_funct[2]));
   xnor5_1 zero_one3 (.opcode(opcode), .func(5'b10101), .out(zero_one_funct[3]));
   xnor5_1 zero_one4 (.opcode(opcode), .func(5'b10110), .out(zero_one_funct[4]));
   xnor5_1 zero_one5 (.opcode(opcode), .func(5'b10111), .out(zero_one_funct[5]));
   xnor5_1 zero_one6 (.opcode(opcode), .func(5'b10000), .out(zero_one_funct[6]));
   xnor5_1 zero_one7 (.opcode(opcode), .func(5'b10001), .out(zero_one_funct[7]));
   xnor5_1 zero_one8 (.opcode(opcode), .func(5'b10011), .out(zero_one_funct[8]));
   
   xnor5_1 one_zero0 (.opcode(opcode), .func(5'b11000), .out(one_zero_funct[0]));
   xnor5_1 one_zero1 (.opcode(opcode), .func(5'b10010), .out(one_zero_funct[1]));
  
   xnor5_1 one_one0 (.opcode(opcode), .func(5'b00110), .out(one_one_funct[0]));
   xnor5_1 one_one1 (.opcode(opcode), .func(5'b00110), .out(one_one_funct[1]));

   assign finalZeroZero = zero_zero_funct[0]|zero_zero_funct[1]|zero_zero_funct[2]|zero_zero_funct[3]|zero_zero_funct[4]|zero_zero_funct[5]|zero_zero_funct[6];

   assign finalZeroOne = zero_one_funct[0]|zero_one_funct[1]|zero_one_funct[2]|zero_one_funct[3]|zero_one_funct[4]|zero_one_funct[5]|zero_one_funct[6]|zero_one_funct[7]|zero_one_funct[8];

   assign finalOneZero =one_zero_funct[0]|one_zero_funct[1];

   assign finalOneOne = one_one_funct[0]|one_one_funct[1];
   
   mux2_1_2 mux_zero_zero (.InA(1'b00), .InB(1'b00), .S(finalZeroZero), .Out(mux00));
   mux2_1_2 mux_zero_one (.InA(mux00), .InB(1'b01), .S(finalZeroOne), .Out(mux01));
   mux2_1_2 mux_one_zero (.InA(mux01), .InB(1'b10), .S(finalOneZero), .Out(mux10));
   mux2_1_2 mux_one_one (.InA(mux10), .InB(1'b11), .S(finalOneOne), .Out(out));   

endmodule; // dMemWrite


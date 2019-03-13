module Rti (opcode, out);
   input[4:0]  opcode;
   output      out;

   xnor5_1 op (.opcode(opcode), .func(5'b00011), .out(out));

endmodule

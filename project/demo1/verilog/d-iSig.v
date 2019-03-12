module d_iSig(opcode, out);
  input[4:0] opcode;
   output    out;
   wire [1:0]   funct;

   xnor5_1 xnor0 (.opcode(opcode), .func(5'b00100), .out(funct[0]));
   xnor5_1 xnor1 (.opcode(opcode), .func(5'b00110), .out(funct[1]));

   assign out = funct[0] | funct[1];
endmodule // d_iSig



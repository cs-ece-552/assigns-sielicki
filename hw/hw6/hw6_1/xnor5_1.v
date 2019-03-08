module xnor5_1(opcode, func, out);
   input [4:0] opcode, func;
   output      out;

   wire        xor0, xor1, xor2, xor3, xor4;

   assign xor0 = ~(opcode[0] ^ func[0]);
   assign xor1 = ~(opcode[1] ^ func[1]);
   assign xor2 = ~(opcode[2] ^ func[2]);
   assign xor3 = ~(opcode[3] ^ func[3]);
   assign xor4 = ~(opcode[4] ^ func[4]);

   assign out = xor0 & xor1 & xor2 & xor3 & xor4;

endmodule; // xnor5_1


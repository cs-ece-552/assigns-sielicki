/* Generated by Yosys 0.8 (git sha1 b4e5e37, clang 8.0.1 -fPIC -Os) */

(* top =  1  *)
(* keep_hierarchy =  1  *)
(* src = "../demo3/verilog/IllegalOp.v:1" *)
module IllegalOp(opcode, out);
  (* src = "../demo3/verilog/IllegalOp.v:2" *)
  input [4:0] opcode;
  (* src = "../demo3/verilog/IllegalOp.v:3" *)
  output out;
  (* src = "../demo3/verilog/IllegalOp.v:5" *)
  xnor5_1 op (
    .func(5'h02),
    .opcode(opcode),
    .out(out)
  );
endmodule

(* src = "../demo3/verilog/xnor5_1.v:1" *)
module xnor5_1(opcode, func, out);
  (* src = "../demo3/verilog/xnor5_1.v:13" *)
  wire _00_;
  (* src = "../demo3/verilog/xnor5_1.v:13" *)
  wire _01_;
  (* src = "../demo3/verilog/xnor5_1.v:13" *)
  wire _02_;
  (* src = "../demo3/verilog/xnor5_1.v:10" *)
  wire _03_;
  (* src = "../demo3/verilog/xnor5_1.v:11" *)
  wire _04_;
  (* src = "../demo3/verilog/xnor5_1.v:7" *)
  wire _05_;
  (* src = "../demo3/verilog/xnor5_1.v:8" *)
  wire _06_;
  (* src = "../demo3/verilog/xnor5_1.v:9" *)
  wire _07_;
  (* src = "../demo3/verilog/xnor5_1.v:2" *)
  input [4:0] func;
  (* src = "../demo3/verilog/xnor5_1.v:2" *)
  input [4:0] opcode;
  (* src = "../demo3/verilog/xnor5_1.v:3" *)
  output out;
  (* src = "../demo3/verilog/xnor5_1.v:5" *)
  wire xor0;
  (* src = "../demo3/verilog/xnor5_1.v:5" *)
  wire xor1;
  (* src = "../demo3/verilog/xnor5_1.v:5" *)
  wire xor2;
  (* src = "../demo3/verilog/xnor5_1.v:5" *)
  wire xor3;
  (* src = "../demo3/verilog/xnor5_1.v:5" *)
  wire xor4;
  assign _00_ = xor0 & (* src = "../demo3/verilog/xnor5_1.v:13" *) xor1;
  assign _01_ = _00_ & (* src = "../demo3/verilog/xnor5_1.v:13" *) xor2;
  assign _02_ = _01_ & (* src = "../demo3/verilog/xnor5_1.v:13" *) xor3;
  assign out = _02_ & (* src = "../demo3/verilog/xnor5_1.v:13" *) xor4;
  assign xor3 = ~ (* src = "../demo3/verilog/xnor5_1.v:10" *) _03_;
  assign xor4 = ~ (* src = "../demo3/verilog/xnor5_1.v:11" *) _04_;
  assign xor0 = ~ (* src = "../demo3/verilog/xnor5_1.v:7" *) _05_;
  assign xor1 = ~ (* src = "../demo3/verilog/xnor5_1.v:8" *) _06_;
  assign xor2 = ~ (* src = "../demo3/verilog/xnor5_1.v:9" *) _07_;
  assign _03_ = opcode[3] ^ (* src = "../demo3/verilog/xnor5_1.v:10" *) func[3];
  assign _04_ = opcode[4] ^ (* src = "../demo3/verilog/xnor5_1.v:11" *) func[4];
  assign _05_ = opcode[0] ^ (* src = "../demo3/verilog/xnor5_1.v:7" *) func[0];
  assign _06_ = opcode[1] ^ (* src = "../demo3/verilog/xnor5_1.v:8" *) func[1];
  assign _07_ = opcode[2] ^ (* src = "../demo3/verilog/xnor5_1.v:9" *) func[2];
endmodule

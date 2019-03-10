module alu (OpCode, funct, Rs, Rt, Imm, res);
    input [4:0] OpCode;
    input [1:0] funct;
    input [15:0] Rs;
    input [15:0] Rt;
    input [7:0] Imm;
    
    output [15:0] res;
    
endmodule
    
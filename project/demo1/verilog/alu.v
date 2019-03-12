module alu (OpCode, funct, Rs, Rt, Pc, Imm, res, jumpVal);
    input [4:0] OpCode;
    input [1:0] funct;
    input [15:0] Rs;
    input [15:0] Rt;
    input [15:0] Pc;
    input [7:0] Imm;
    
    output [15:0] res;
    output [15:0] jumpVal;    
        
    wire [15:0] A;
    wire [15:0] B;
    wire C_in;
    wire [15:0] res_add;
    wire C_out;
    
    wire [15:0]res_barrel;
    wire BarrelOp;
    wire [15:0] preFlip;
    wire [15:0] flip1_res;
    wire [15:0] flip2_res;
    
    wire [15:0]res_xor;
    wire [15:0]res_and;
    wire [15:0]res_shifter;
    wire [15:0]res_flag;
    wire [15:0]res_lbi;
    wire [15:0]res_slbi;
    
    wire invS;
    wire invT;
    wire selImm5;
    wire selImm8;
    wire selImmJump;
    wire signImm;
    
    //wire adder;
    wire xors;
    wire andn;
    wire shifter;
    wire flags;
    wire lbi;
    wire slbi;
    wire pc_o;
    
    wire zero;
    wire lt;
    
    //control
    //assign adder = (OpCode[4:1] ^ 4'b0100) |
    //               (OpCode[4:1] ^ 4'b1000) |
    //               (OpCode ^ 5'b10011) |
    //               ((OpCode ^ 5'b11011) & (funct[1] ^ 0));
                   
    assign xors = (~|(OpCode ^ 5'b01011)) | ((~|(OpCode ^ 5'b11011)) & (~|(funct ^ 2'b10)));
    
    assign andn = (~|(OpCode ^ 5'b01010)) | ((~|(OpCode ^ 5'b11011)) & (~|(funct ^ 2'b11)));
    
    assign shifter = (~|(OpCode[4:2] ^ 3'b101)) | (~|(OpCode [4:0] ^ 5'b11001)) | (~|(OpCode[4:0] ^ 5'b11010));
    
    assign flags = ~|(OpCode[3:2] ^ 2'b11);
    
    assign lbi = ~|(OpCode[4:0] ^ 5'b11000);
    
    assign slbi = ~|(OpCode[4:0] ^ 5'b10010);
    
    assign pc_o = ~|(OpCode[4:3] ^ 2'b00);
    
    assign res = pc_o ? Pc :
                 (xors ? res_xor :
                 (andn ? res_and :
                 (shifter ? res_shifter :
                 (flags ? res_flag :
                 (lbi ? res_lbi :
                 (slbi ? res_slbi :
                 res_add))))));
                 
    
    assign invS = (~|(OpCode ^ 5'b01000)) | ((~|(OpCode ^ 5'b11011)) & (~|(funct ^ 2'b01)));
    assign invT = (|(OpCode ^ 5'b11111)) & flags;
    assign selImm5 = (~|(OpCode[4:2] ^ 3'b010)) | (~|(OpCode[4:2] ^ 3'b101)) | (~|(OpCode[4:2] ^ 3'b100));
    assign signImm = (~OpCode [1]) | (~|(OpCode[4:0] ^ 5'b10011));
    assign selImm8 = (~|(OpCode[4:2] ^ 3'b011));
    assign selImmJump = (~|(OpCode[4:3] ^ 2'b00));
    
    assign A = invS ? ~Rs : Rs;
    assign B = selImm5 ? (signImm ? {{11{Imm[4]}},Imm[4:0]} : {{11{1'b0}},Imm[4:0]}) : 
                    (selImmJump ? res_lbi : 
                        (selImm8 ? 16'b0000_0000_0000_0000 : (invT ? ~Rt : Rt)));
    assign C_in = invS | invT;
    
    //adder
    rca_16b rca (.A(A), .B(B), .C_in(C_in), .S(res_add), .C_out(C_out));
    
    //xor
    assign res_xor = A ^ B;
    
    //andn
    assign res_and = A & ~B;
    
    //shifter
    bitflip flip1(.In(Rs), .Out(flip1_res));
    barrelShifter2 barrelShift (.In(preFlip), .Cnt(B[3:0]), .Op(BarrelOp), .Out(res_barrel));
    bitflip flip2(.In(res_barrel), .Out(flip2_res));
    
    assign BarrelOp = (OpCode[3] == 1'b1) ? funct[0] : OpCode[0];
    assign preFlip = (OpCode[3] == 1'b1) ? 
                                ((funct[1] == 1'b1) ? Rs : flip1_res) :
                                ((OpCode[1] == 1'b1) ? Rs : flip1_res);
    
    assign res_shifter = (OpCode == 5'b11001) ? flip1_res :
                            ((OpCode[3] == 1'b1)? 
                                ((funct[1] == 1'b1) ? res_barrel : flip2_res) :
                                ((OpCode[1] == 1'b1) ? res_barrel : flip2_res)
                            );
    
    //flags
    assign zero = ~(|res_add);
    assign lt = res_add[15];
    
    assign res_flag[15:1] = {15{1'b0}};
    assign res_flag[0] = (OpCode[4] == 1'b1) ?
                        ((OpCode[1] == 1'b1) ?
                            ((OpCode[0] == 1'b1) ? C_out : (lt | zero)):
                            ((OpCode[0] == 1'b1) ? lt : zero)
                        ) :
                        ((OpCode[1] == 1'b1) ?
                            ((OpCode[0] == 1'b1) ? lt : ~lt):
                            ((OpCode[0] == 1'b1) ? zero : ~zero)
                        );                        
    
    //lbi
    assign res_lbi = {{8{Imm[7]}}, Imm};
    
    //slbi
    assign res_slbi = {Rs[7:0], Imm};
    
    //jumpVal, this is just result from adder, but the value is only valid during Jr and Jalr
    assign jumpVal = res_add;
    
    
endmodule
    

module alu (OpCode, funct, Rs, Rt, Pc, Imm, res);
    input [4:0] OpCode;
    input [1:0] funct;
    input [15:0] Rs;
    input [15:0] Rt;
    input [15:0] Pc;
    input [7:0] Imm;
    
    output [15:0] res;
    
    wire [15:0] A;
    wire [15:0] B;
    wire C_in;
    wire res_add;
    wire C_out;
    
    wire res_barrel;
    wire barrel_Op;
    wire [16:0] preFlip;
    wire [16:0] flip1_res;
    wire [16:0] flip2_res;
    
    wire res_xor;
    wire res_and;
    wire res_shifter;
    wire res_flag;
    wire res_lbi;
    wire res_slbi;
    
    wire invS;
    wire invT;
    wire selImm5;
    wire selImm8;
    wire signImm;
    
    wire adder;
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
    //assign adder = (OpCode[4:1] == 4'b0100) |
    //               (OpCode[4:1] == 4'b1000) |
    //               (OpCode == 5'b10011) |
    //               ((OpCode == 5'b11011) & (funct[1] == 0));
                   
    assign xors = (OpCode == 5'b01011) | ((OpCode == 5'b11011) & (funct == 10));
    
    assign andn = (OpCode == 5'b01010) | ((OpCode == 5'b11011) & (funct == 11));
    
    assign shifter = (OpCode[4:2] == 3'b101) | (OpCode [4:0] == 5'b11001) | (OpCode[4:0] == 5'b11010);
    
    assign flags = (OpCode[3:2] == 2'b11);
    
    assign lbi = (OpCode[4:0] == 5'b11000);
    
    assign slbi = (OpCode[4:0] == 5'b10010);
    
    assign pc_o = (OpCode[4:3] == 2'b00);
    
    assign res = pc_o ? Pc :
                 (xors ? res_xor :
                 (andn ? res_and :
                 (shifter ? res_shifter :
                 (flags ? res_flag :
                 (lbi ? res_lbi :
                 (slbi ? res_slbi :
                 res_add))))));
                 
    
    assign invS = (OpCode == 5'b01000) | (OpCode == 5'b11011 & funct == 2'b01);
    assign invT = ~(OpCode == 5'b11111) & flags;
    assign selImm5 = (OpCode[4:2] == 3'b010) | (OpCode[4:2] == 3'b101) | (OpCode[4:2] == 3'b100);
    assign signImm = (~OpCode [1]) | (OpCode[4:0] == 5'b10011);
    assign selImm8 = (OpCode[4:2] == 3'b011);
    
    assign A = invS ? ~Rs : Rs;
    assign B = selImm5 ? (signImm ? {{11{Imm[4]}},Imm[4:0]} : {{11{1'b0}},Imm[4:0]}) : 
                    (selImm8 ? {{8{Imm[7]}},Imm[7:0]} : (invT ? ~Rt : Rt));
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
    
    assign BarrelOp = OpCode[3] ? funct[0] : OpCode[0];
    assign preFlip = OpCode[4:2] == 3'b110 ? 
                                (OpCode[0] | funct[1] ? flip1_res : Rs) :
                                (OpCode[1] ? flip1_res : Rs);
    
    assign res_shifter = OpCode == 5'b 11001 ? preFlip :
                            (OpCode[3] ? 
                                (funct[1] ? flip2_res : res_barrel) :
                                (OpCode[1] ? flip2_res : res_barrel)
                            );
    
    //flags
    assign zero = ~(|res_add);
    assign lt = res_add[15];
    
    assign res_flag = OpCode[4] ?
                        (OpCode[1] ?
                            (OpCode[0] ? {{15{1'b0}},C_out} : {{15{1'b0}}, lt | zero}):
                            (OpCode[0] ? {{15{1'b0}},lt} : {{15{1'b0}},zero})
                        ) :
                        (OpCode[1] ?
                            (OpCode[0] ? {{15{1'b0}}, ~lt} : {{15{1'b0}}, lt}):
                            (OpCode[0] ? {{15{1'b0}}, zero} : {{15{1'b0}}, ~zero})
                        );                        
    
    //lbi
    assign res_lbi = {{8{Imm[7]}}, Imm};
    
    //slbi
    assign res_slbi = {Rs[7:0], Imm};
    
    
    
endmodule;
    
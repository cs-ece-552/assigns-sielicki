module lru_reg_64 (addr, inData, writeEn,
        outData,
        clk, rst);

    input [5:0] addr;
    input inData;
    input writeEn;
    output outData;

    input clk;
    input rst;

    wire g0, g1, g2, g3;

    lru_reg_16 group0 (.addr(addr[3:0]), .outData(g0), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr[5:4] == 2'b00)));
    lru_reg_16 group1 (.addr(addr[3:0]), .outData(g1), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr[5:4] == 2'b01)));
    lru_reg_16 group2 (.addr(addr[3:0]), .outData(g2), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr[5:4] == 2'b10)));
    lru_reg_16 group3 (.addr(addr[3:0]), .outData(g3), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr[5:4] == 2'b11)));

    assign outData = addr[5] ? (addr[4] ? g3 : g2) : (addr[4] ? g1 : g0);

endmodule

module lru_reg_4 (addr, inData, writeEn,
        outData,
        clk, rst);

    input [1:0] addr;
    input inData;
    input writeEn;
    output outData;

    input clk;
    input rst;

    wire g0, g1, g2, g3;

    reg_1b group0 (.outData(g0), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr == 2'b00)));
    reg_1b group1 (.outData(g1), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr == 2'b01)));
    reg_1b group2 (.outData(g2), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr == 2'b10)));
    reg_1b group3 (.outData(g3), .clk(clk), .rst(rst), .inData(inData), .writeEn(writeEn & (addr == 2'b11)));

    assign outData = addr[1] ? (addr[0] ? g3 : g2) : (addr[0] ? g1 : g0);

endmodule

module writeback (
    //Input
    writeData,
    RegWrite, DMemDump,
    RdAddr,
    clk, rst
    );
    
    input [15:0] writeData;
    input RegWrite;
    input DMemDump;
    input [2:0] RdAddr;
    input clk;
    input rst;
    
endmodule
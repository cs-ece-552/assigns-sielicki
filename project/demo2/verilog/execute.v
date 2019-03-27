module execute (
    //Output
    AluRes, RtOut,
    RegWriteOut, DMemWriteOut, DMemEnOut, MemToRegOut, DMemDumpOut,
    RsAddr, RtAddr, RdAddrOut,
    //input
    InstIn, pcplus2In, RsIn, RtIn,
    RegWriteIn, DMemWriteIn, DMemEnIn, MemToRegOut, DMemDumpIn,
    RdAddrIn, 
    clk, rst
    );
    
    output [15:0] AluRes;
    output [15:0] RtOut;
    
    output RegWriteOut;
    output DMemWriteOut;
    output DMemEnOut;
    output MemToRegOut;
    output DMemDumpOut;
    
    output [2:0] RsAddr;
    output [2:0] RtAddr;
    output [2:0] RdAddrOut;
    
    input [15:0] InstIn;
    input [15:0] RsIn;
    input [15:0] RtIn;
    
    input RegWriteIn;
    input DMemWriteIn;
    input DMemEnIn;
    input MemToRegIn;
    input DMemDumpIn;
    
    input [2:0] RdAddrIn;
    
    input clk;
    input rst;
    
    assign RtOut = RtIn;
    
    assign RegWriteOut = RegWriteIn;
    assign DMemWriteOut = DMemWriteIn;
    assign DMemEnOut = DMemEnIn;
    assign MemToRegOut = MemToRegIn;
    assign DMemDumpOut = DMemDumpIn;
    
    assign RsAddr = InstIn[10:8];
    assign RtAddr = InstIn[7:5];
    assign RdAddrOut = RdAddrIn;
    
    alu alu(
	        // Outputs
            .res(AluRes),
            // Inputs
            .OpCode(InstIn[15:11]),
            .funct(InstIn[1:0]),
            .Rs(RsIn),
            .Rt(RtOut),
            .Pc(pcplus2In),
            .Imm(InstIn[7:0]));
    
endmodule
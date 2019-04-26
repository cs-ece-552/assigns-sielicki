module memory (
    //Output
    writeData,
    RegWriteOut, DMemDumpOut,
    RdAddrOut,
    err, stall,
    //Input
    AluRes, RtIn,
    RegWriteIn, DMemWriteIn, DMemEnIn, MemToRegIn, DMemDumpIn,
    RsAddrIn, RtAddrIn, RdAddrIn,
    clk, rst
               );
   
    
    output [15:0] writeData;
    output RegWriteOut;
    output DMemDumpOut;
    output [2:0] RdAddrOut;
    output err;
    output stall;

    input [15:0] AluRes;
    input [15:0] RtIn;
    
    input RegWriteIn;
    input DMemWriteIn;
    input DMemEnIn;
    input MemToRegIn;
    input DMemDumpIn;
    
    input [2:0] RsAddrIn;
    input [2:0] RtAddrIn;
    input [2:0] RdAddrIn;
    
    input clk;
    input rst;
    
    wire [15:0] MemOut;

    wire MemRd;
    wire mem_done;
    wire mem_stall;
    wire mem_err;
    
    assign writeData = MemToRegIn ? MemOut : AluRes;
    assign RegWriteOut = RegWriteIn;
    assign DMemDumpOut = DMemDumpIn;
    assign RdAddrOut = RdAddrIn;
    assign stall = DMemEnIn & ~mem_done & mem_stall;
    assign MemRd = DMemEnIn & ~DMemWriteIn;
    assign err = mem_err & DMemEnIn;
    //assign stall = mem_stall & ~mem_done;

    mem_system datamem(
            // Outputs
            .DataOut    (MemOut),
            .Done       (mem_done),
            .Stall      (mem_stall),
            .CacheHit   (),
            .err        (mem_err), 
            // Inputs
            .Addr       (AluRes),
            .DataIn     (RtIn),
            .Rd         (MemRd),
            .Wr         (DMemWriteIn),
            .createdump (DMemDumpIn),
            .clk        (clk),
            .rst        (rst));
    
    //stallmem datamem(
	//            //Outputs
    //                .DataOut            (MemOut),
    //                .Done               (mem_done),
    //                .Stall              (mem_stall),
    //                .CacheHit           (),
    //                .err                (err),
	//            //Inputs
    //                .Addr               (AluRes),
    //                .DataIn             (RtIn),
    //                .Rd                 (MemRd),
    //                .Wr                 (DMemWriteIn),
    //                .createdump         (DMemDumpIn),
    //                .clk                (clk),
    //                .rst                (rst));

    //memory2c_align datamem(/*AUTOINST*/
    //                // Outputs
    //                .data_out           (MemOut),
    //                .err                (err),
    //                // Inputs
    //                .data_in            (RtIn),
    //                .addr               (AluRes),
    //                .enable             (DMemEnIn),
    //                .wr                 (DMemWriteIn),
    //                .createdump         (DMemDumpIn),
    //                .clk                (clk),
    //                .rst                (rst));
    
endmodule

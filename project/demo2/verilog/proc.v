/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
   /* your code here */
   
    module fetch(
        //Outputs
        .Inst(IFIDinst),
        .pcplus2(IFIDpcplus2),
        //Inputs
        .pcbranch(IDIFpcbranch), .branch(IDIFbranch),
        .clk(clk), .rst(rst)
    );
    
    //IF/ID
    
    wire [15:0] IFIDinst;
    wire [15:0] IFIDpcplus2;
    
    //forwarding new pc
    wire [15:0] IDIFpcbranch;
    wire IDIFbranch;
    
    module decode(
        //Output
        .InstOut(IDEXinst), .pcplus2Out(IDEXpcplus2), .Rs(IDEXrs), .Rt(IDEXrt),
        .RegWrite(IDEXregwrite), .DMemWrite(IDEXdmemwrite), ,DMemEn(IDEXdmemen), .MemToReg(IDEXmemtoreg), .DMemDump(),
        .RdAddr(IDEXrdaddr),
        .pcbranch(IDIFpcbranch), .branch(IDIFbranch), 
        .err(err),
        //Input
        .InstIn(IFIDinst), .pcplus2In(IFIDpcplus2),
        .wbwriteData(MEMWBwritedata),
        .wbRegWrite(MEMWBregwrite),
        .wbRdAddr(MEMWBrdaddr),
        .clk(clk), .rst(rst),
    );
    
    //ID/EX
    wire [15:0] IDEXinst;
    wire [15:0] IDEXpcplus2;
    wire [15:0] IDEXrs;
    wire [15:0] IDEXrt;
    wire IDEXregwrite;
    wire IDEXdmemwrite;
    wire IDEXdmemen;
    wire IDEXmemtoreg;
    wire IDEXdmemdump;
    wire [2:0] IDEXrdaddr;
    
    module execute (
        //Output
        .AluRes(EXMEMalures), .RtOut(EXMEMrtin),
        .RegWriteOut(EXMEMregwrite), .DMemWriteOut(EXMEMdmemwrite), .DMemEnOut(EXMEMdmemen), .MemToRegOut(EXMEMmemtoreg), .DMemDumpOut(EXMEMdmemdump),
        .RsAddr(EXMEMrsaddr), .RtAddr(EXMEMrtaddr), .RdAddrOut(EXMEMrdaddr),
        //input
        .InstIn(IDEXinst), .pcplus2In(IDEXpcplus2), .RsIn(IDEXrs), .RtIn(IDEXrt),
        .RegWriteIn(IDEXregwrite), .DMemWriteIn(IDEXdmemwrite), .DMemEnIn(IDEXdmemen), .MemToRegOut(IDEXmemtoreg), .DMemDumpIn(IDEXdmemdump),
        .RdAddrIn(IDEXrdaddr), 
        .clk(clk), .rst(rst)
    );
    
    //EX/MEM
    wire [15:0] EXMEMalures;
    wire [15:0] EXMEMrtin;
    wire EXMEMregwrite;
    wire EXMEMdmemwrite;
    wire EXMEMdmemen;
    wire EXMEMmemtoreg;
    wire EXMEMdmemdump;
    wire [2:0] EXMEMrsaddr;
    wire [2:0] EXMEMrtaddr;
    wire [2:0] EXMEMrdaddr;
    
    module memory (
        //Output
        .writeData(MEMWBwritedata),
        .RegWriteOut(MEMWBregwrite), .DMemDumpOut(MEMWBdmemdump),
        .RdAddrOut(MEMWBrdaddr),
        //Input
        .AluRes(EXMEMalures), .RtIn(EXMEMrtin),
        .RegWriteIn(EXMEMregwrite), .DMemWriteIn(EXMEMdmemwrite), .DMemEnIn(EXMEMdmemen), .MemToRegIn(EXMEMmemtoreg), .DMemDumpIn(EXMEMdmemdump),
        .RsAddrIn(EXMEMrsaddr), .RtAddrIn(EXMEMrtaddr), .RdAddrIn(EXMEMrdaddr),
        .clk(clk), .rst(rst)
    )
    
    //MEM/WB
    wire [15:0] MEMWBwritedata;
    wire MEMWBregwrite;
    wire MEMWBdmemdump;
    wire MEMWBrdaddr;
    
    //go back to decode module which contains the register file
   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

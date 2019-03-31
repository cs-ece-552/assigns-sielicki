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

   //IF/ID
   wire [15:0] IFIDinst;
   wire [15:0] IFIDpcplus2;
   wire [15:0] IFIDinstOut;
   wire [15:0] IFIDpcplus2Out;

   //forwarding new pc
   wire [15:0] IDIFpcbranch;
   wire        IDIFbranch;


   //ID/EX
   wire [15:0] IDEXinst;
   wire [15:0] IDEXpcplus2;
   wire [15:0] IDEXrs;
   wire [15:0] IDEXrt;
   
   wire [15:0] IDEXinstOut;
   wire [15:0] IDEXpcplus2Out;
   wire [15:0] IDEXrsOut;
   wire [15:0] IDEXrtOut;
   
   wire        IDEXregwrite;
   wire        IDEXdmemwrite;
   wire        IDEXdmemen;
   wire        IDEXmemtoreg;
   wire        IDEXdmemdump;

   wire        IDEXregwriteOut;
   wire        IDEXdmemwriteOut;
   wire        IDEXdmemenOut;
   wire        IDEXmemtoregOut;
   wire        IDEXdmemdumpOut;
   
   wire [2:0]  IDEXrdaddr;
   wire [2:0]  IDEXrdaddrOut;

   //EX/MEM
   wire [15:0] EXMEMalures;
   wire [15:0] EXMEMrtin;

   wire [15:0] EXMEMaluresOut;
   wire [15:0] EXMEMrtinOut;

   wire        EXMEMregwrite;
   wire        EXMEMdmemwrite;
   wire        EXMEMdmemen;
   wire        EXMEMmemtoreg;
   wire        EXMEMdmemdump;

   wire        EXMEMregwriteOut;
   wire        EXMEMdmemwriteOut;
   wire        EXMEMdmemenOut;
   wire        EXMEMmemtoregOut;
   wire        EXMEMdmemdumpOut;
   
   wire [2:0]  EXMEMrsaddr;
   wire [2:0]  EXMEMrtaddr;
   wire [2:0]  EXMEMrdaddr;

   wire [2:0]  EXMEMrsaddrOut;
   wire [2:0]  EXMEMrtaddrOut;
   wire [2:0]  EXMEMrdaddrOut;

   //MEM/WB
   wire [15:0] MEMWBwritedata;

   wire [15:0] MEMWBwritedataOut;
   
   wire        MEMWBregwrite;
   wire        MEMWBdmemdump;

   wire        MEMWBregwriteOut;
   wire        MEMWBdmemdumpOut;

   
   wire [2:0]  MEMWBrdaddr;
   
   wire [2:0]  MEMWBrdaddrOut;
   
   
    fetch fetch(
        //Outputs
        .Inst(IFIDinst),
        .pcplus2(IFIDpcplus2),
        //Inputs
        .pcbranch(IDIFpcbranch), .branch(IDIFbranch),
        .clk(clk), .rst(rst)
    );

   //IF-ID Pipeline
   reg_16b ifidinst(.clk(clk), .rst(rst),.inData(IFIDinst),.writeEn(1'b1),.outData(IFIDinstOut));
   reg_16b ifidpcplus2(.clk(clk), .rst(rst),.inData(IFIDpcplus2),.writeEn(1'b1),.outData(IFIDpcplus2Out));
   

   decode decode(
                 //Output
                 .InstOut(IDEXinst), .pcplus2Out(IDEXpcplus2), .Rs(IDEXrs), .Rt(IDEXrt),
                 .RegWrite(IDEXregwrite), .DMemWrite(IDEXdmemwrite), .DMemEn(IDEXdmemen), .MemToReg(IDEXmemtoreg), .DMemDump(IDEXdmemdump),
                 .RdAddr(IDEXrdaddr),
                 .pcbranch(IDIFpcbranch), .branch(IDIFbranch), 
                 .err(err),
                 //Input
                 .InstIn(IFIDinstOut), .pcplus2In(IFIDpcplus2Out),
                 .wbwriteData(MEMWBwritedataOut),
                 .wbRegWrite(MEMWBregwriteOut),
                 .wbRdAddr(MEMWBrdaddrOut),
                 .clk(clk), .rst(rst)
                 );
   
   reg_16b idexinst(.clk(clk), .rst(rst),.inData(IDEXinst),.writeEn(1'b1),.outData(IDEXinstOut));
   reg_16b idexpcplus2(.clk(clk), .rst(rst),.inData(IDEXpcplus2),.writeEn(1'b1),.outData(IDEXpcplus2Out));
   reg_16b idexrs(.clk(clk), .rst(rst),.inData(IDEXrs),.writeEn(1'b1),.outData(IDEXrsOut));
   reg_16b idexrt(.clk(clk), .rst(rst),.inData(IDEXrt),.writeEn(1'b1),.outData(IDEXrtOut));
   
   reg_1b idexregwrite(.clk(clk), .rst(rst),.inData(IDEXregwrite),.writeEn(1'b1),.outData(IDEXregwriteOut));
   reg_1b idexdmemwrite(.clk(clk), .rst(rst),.inData(IDEXdmemwrite),.writeEn(1'b1),.outData(IDEXdmemwriteOut));
   reg_1b idexdmemen(.clk(clk), .rst(rst),.inData(IDEXdmemen),.writeEn(1'b1),.outData(IDEXdmemenOut));
   reg_1b idexmemtoreg(.clk(clk), .rst(rst),.inData(IDEXmemtoreg),.writeEn(1'b1),.outData(IDEXmemtoregOut));
   reg_1b idexdmemdump(.clk(clk), .rst(rst),.inData(IDEXdmemdump),.writeEn(1'b1),.outData(IDEXdmemdumpOut));

   reg_3b idexrdaddr(.clk(clk), .rst(rst),.inData(IDEXrdaddr),.writeEn(1'b1),.outData(IDEXrdaddrOut));

   execute execute (
                    //Output
                    .AluRes(EXMEMalures), .RtOut(EXMEMrtin),
                    .RegWriteOut(EXMEMregwrite), .DMemWriteOut(EXMEMdmemwrite), .DMemEnOut(EXMEMdmemen), .MemToRegOut(EXMEMmemtoreg), .DMemDumpOut(EXMEMdmemdump),
                    .RsAddr(EXMEMrsaddr), .RtAddr(EXMEMrtaddr), .RdAddrOut(EXMEMrdaddr),
                    //input
                    .InstIn(IDEXinstOut), .pcplus2In(IDEXpcplus2Out), .RsIn(IDEXrsOut), .RtIn(IDEXrtOut),
                    .RegWriteIn(IDEXregwriteOut), .DMemWriteIn(IDEXdmemwriteOut), .DMemEnIn(IDEXdmemenOut), .MemToRegIn(IDEXmemtoregOut), .DMemDumpIn(IDEXdmemdumpOut),
                    .RdAddrIn(IDEXrdaddrOut), 
                    .clk(clk), .rst(rst)
                    );


   reg_16b exmemalures(.clk(clk), .rst(rst),.inData(EXMEMalures),.writeEn(1'b1),.outData(EXMEMaluresOut));
   reg_16b exmemrtin(.clk(clk), .rst(rst),.inData(EXMEMrtin),.writeEn(1'b1),.outData(EXMEMrtin));

   reg_1b exmemregwrite(.clk(clk), .rst(rst),.inData(EXMEMregwrite),.writeEn(1'b1),.outData(EXMEMregwriteOut));
   reg_1b exmemdmemwrite(.clk(clk), .rst(rst),.inData(EXMEMdmemwrite),.writeEn(1'b1),.outData(EXMEMdmemwriteOut));
   reg_1b exmemdmemen(.clk(clk), .rst(rst),.inData(EXMEMdmemen),.writeEn(1'b1),.outData(EXMEdmemenOut));
   reg_1b exmemmemtoreg(.clk(clk), .rst(rst),.inData(EXMEMmemtoreg),.writeEn(1'b1),.outData(EXMEMmemtoregOut));
   reg_1b exmemdmemdump(.clk(clk), .rst(rst),.inData(EXMEMdmemdump),.writeEn(1'b1),.outData(EXMEMdmemdumpOut));

   reg_3b exmemrsaddr(.clk(clk), .rst(rst),.inData(EXMEMrsaddr),.writeEn(1'b1),.outData(EXMEMrsaddrOut));
   reg_3b exmemrtaddr(.clk(clk), .rst(rst),.inData(EXMEMrtaddr),.writeEn(1'b1),.outData(EXMEMrtaddrOut));
   reg_3b exmemrdaddr(.clk(clk), .rst(rst),.inData(EXMEMrdaddr),.writeEn(1'b1),.outData(EXMEMrdaddrOut));
   
   memory memory (
                  //Output
                  .writeData(MEMWBwritedata),
                  .RegWriteOut(MEMWBregwrite), .DMemDumpOut(MEMWBdmemdump),
                  .RdAddrOut(MEMWBrdaddr),
                  //Input
                  .AluRes(EXMEMaluresOut), .RtIn(EXMEMrtinOut),
                  .RegWriteIn(EXMEMregwriteOut), .DMemWriteIn(EXMEMdmemwriteOut), .DMemEnIn(EXMEMdmemenOut), .MemToRegIn(EXMEMmemtoregOut), .DMemDumpIn(EXMEMdmemdumpOut),
                  .RsAddrIn(EXMEMrsaddrOut), .RtAddrIn(EXMEMrtaddrOut), .RdAddrIn(EXMEMrdaddrOut),
                  .clk(clk), .rst(rst)
                  );
   

   reg_16b memwbwritedata(.clk(clk), .rst(rst),.inData(MEMWBwritedata),.writeEn(1'b1),.outData(MEMWBwritedataOut));

   reg_1b memwbregwrite(.clk(clk), .rst(rst),.inData(MEMWBregwrite),.writeEn(1'b1),.outData(MEMWBregwriteOut));
   reg_1b memwbdmemdump(.clk(clk), .rst(rst),.inData(MEMWBdmemdump),.writeEn(1'b1),.outData(MEMWBdmemdumpOut));

   reg_3b memwbrdaddr(.clk(clk), .rst(rst),.inData(MEMWBrdaddr),.writeEn(1'b1),.outData(MEMWBrdaddrOut));
   
    //go back to decode module which contains the register file
   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

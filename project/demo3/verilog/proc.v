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


    fetch fetch(
        //Outputs
        .Inst(IFIDinst),
        .pcplus2(IFIDpcplus2),
        .err(errLogic[0]), .stall(fetchstall_logic),
        //Inputs
        .pcbranch(IDIFpcbranch), .branch(IDIFbranch), .stallPc(fetchstall_nobranch),
        .clk(clk), .rst(rst)
    );


   decode decode(
                 //Output
                 .InstOut(IDEXinst), .pcplus2Out(IDEXpcplus2), .Rs(IDEXrs), .Rt(IDEXrt),
                 .RegWrite(IDEXregwrite), .DMemWrite(IDEXdmemwrite), .DMemEn(IDEXdmemen), .MemToReg(IDEXmemtoreg), .DMemDump(IDEXdmemdump),
                 .ALUSrc2(IDEXalusrc2), .PCSrc(IDpcsrc), .PCImm(IDpcimm),
                 .RdAddr(IDEXrdaddr),
                 .pcbranch(IDIFpcbranch), .branch(IDIFbranch), 
                 .err(errLogic[1]),
                 //Input
                 .InstIn(IFIDinstOut2), .pcplus2In(IFIDpcplus2Out),
                 .wbwriteData(MEMWBwritedataOut),
                 .wbRegWrite(MEMWBregwriteOut),
                 .wbRdAddr(MEMWBrdaddrOut),
                 .forwardlogic(EXtoID_forwardRs_logic), .forwardRs(EXMEMaluresOut),
                 .clk(clk), .rst(rst)
                 );


   execute execute (
                    //Output
                    .AluRes(EXMEMalures), .RtOut(EXMEMrtin),
                    .RegWriteOut(EXMEMregwrite), .DMemWriteOut(EXMEMdmemwrite), .DMemEnOut(EXMEMdmemen), .MemToRegOut(EXMEMmemtoreg), .DMemDumpOut(EXMEMdmemdump),
                    .RsAddr(EXMEMrsaddr), .RtAddr(EXMEMrtaddr), .RdAddrOut(EXMEMrdaddr),
                    //input
                    .InstIn(IDEXinstOut), .pcplus2In(IDEXpcplus2Out), .RsIn(IDEXrsOut2), .RtIn(IDEXrtOut2),
                    .RegWriteIn(IDEXregwriteOut), .DMemWriteIn(IDEXdmemwriteOut), .DMemEnIn(IDEXdmemenOut), .MemToRegIn(IDEXmemtoregOut), .DMemDumpIn(IDEXdmemdumpOut),
                    .RdAddrIn(IDEXrdaddrOut), 
                    .clk(clk), .rst(rst)
                    );

 

   memory memory (
                  //Output
                  .writeData(MEMWBwritedata),
                  .RegWriteOut(MEMWBregwrite), .DMemDumpOut(MEMWBdmemdump),
                  .RdAddrOut(MEMWBrdaddr),
                  .err(errLogic[3]), .stall(memorystall_logic),
                  //Input
                  .AluRes(EXMEMaluresOut), .RtIn(EXMEMrtinOut2),
                  .RegWriteIn(EXMEMregwriteOut), .DMemWriteIn(EXMEMdmemwriteOut2), .DMemEnIn(EXMEMdmemenOut2), .MemToRegIn(EXMEMmemtoregOut), .DMemDumpIn(EXMEMdmemdumpOut),
                  .RsAddrIn(EXMEMrsaddrOut), .RtAddrIn(EXMEMrtaddrOut), .RdAddrIn(EXMEMrdaddrOut),
                  .clk(clk), .rst(rst)
                  );

   writeback writeback (/*AUTOINST*/
			// Outputs
			.EXMEMaluresOut	(EXMEMaluresOut[15:0]),
			.EXMEMdmemdump	(EXMEMdmemdump),
			.EXMEMdmemdumpIn(EXMEMdmemdumpIn),
			.EXMEMdmemdumpOut(EXMEMdmemdumpOut),
			.EXMEMdmemen	(EXMEMdmemen),
			.EXMEMdmemenIn	(EXMEMdmemenIn),
			.EXMEMdmemenOut	(EXMEMdmemenOut),
			.EXMEMdmemenOut2(EXMEMdmemenOut2),
			.EXMEMdmemwrite	(EXMEMdmemwrite),
			.EXMEMdmemwriteIn(EXMEMdmemwriteIn),
			.EXMEMdmemwriteOut(EXMEMdmemwriteOut),
			.EXMEMdmemwriteOut2(EXMEMdmemwriteOut2),
			.EXMEMmemtoreg	(EXMEMmemtoreg),
			.EXMEMmemtoregOut(EXMEMmemtoregOut),
			.EXMEMrdaddr	(EXMEMrdaddr[2:0]),
			.EXMEMrdaddrOut	(EXMEMrdaddrOut[2:0]),
			.EXMEMregwrite	(EXMEMregwrite),
			.EXMEMregwriteIn(EXMEMregwriteIn),
			.EXMEMregwriteOut(EXMEMregwriteOut),
			.EXMEMrsaddr	(EXMEMrsaddr[2:0]),
			.EXMEMrsaddrOut	(EXMEMrsaddrOut[2:0]),
			.EXMEMrtaddr	(EXMEMrtaddr[2:0]),
			.EXMEMrtaddrOut	(EXMEMrtaddrOut[2:0]),
			.EXMEMrtin	(EXMEMrtin[15:0]),
			.EXMEMrtinIn	(EXMEMrtinIn[15:0]),
			.EXMEMrtinOut	(EXMEMrtinOut[15:0]),
			.EXMEMrtinOut2	(EXMEMrtinOut2[15:0]),
			.EXMEMrtwriteen	(EXMEMrtwriteen),
			.EXtoEX_forwardRs_logic(EXtoEX_forwardRs_logic),
			.EXtoEX_forwardRt_logic(EXtoEX_forwardRt_logic),
			.EXtoID_forwardRs_logic(EXtoID_forwardRs_logic),
			.IDEXalusrc2	(IDEXalusrc2),
			.IDEXalusrc2Out	(IDEXalusrc2Out),
			.IDEXdmemdumpIn	(IDEXdmemdumpIn),
			.IDEXdmemdumpOut(IDEXdmemdumpOut),
			.IDEXdmemenIn	(IDEXdmemenIn),
			.IDEXdmemenOut	(IDEXdmemenOut),
			.IDEXdmemwriteIn(IDEXdmemwriteIn),
			.IDEXdmemwriteOut(IDEXdmemwriteOut),
			.IDEXinstOut	(IDEXinstOut[15:0]),
			.IDEXmemtoreg	(IDEXmemtoreg),
			.IDEXmemtoregOut(IDEXmemtoregOut),
			.IDEXpcplus2Out	(IDEXpcplus2Out[15:0]),
			.IDEXrdaddr	(IDEXrdaddr[2:0]),
			.IDEXrdaddrOut	(IDEXrdaddrOut[2:0]),
			.IDEXregwriteIn	(IDEXregwriteIn),
			.IDEXregwriteOut(IDEXregwriteOut),
			.IDEXrsIn	(IDEXrsIn[15:0]),
			.IDEXrsOut	(IDEXrsOut[15:0]),
			.IDEXrsOut2	(IDEXrsOut2[15:0]),
			.IDEXrswriteen	(IDEXrswriteen),
			.IDEXrtIn	(IDEXrtIn[15:0]),
			.IDEXrtOut	(IDEXrtOut[15:0]),
			.IDEXrtOut2	(IDEXrtOut2[15:0]),
			.IDEXrtwriteen	(IDEXrtwriteen),
			.IDIFpcbranch	(IDIFpcbranch[15:0]),
			.IFIDinstIn	(IFIDinstIn[15:0]),
			.IFIDinstOut	(IFIDinstOut[15:0]),
			.IFIDinstOut2	(IFIDinstOut2[15:0]),
			.IFIDpcplus2Out	(IFIDpcplus2Out[15:0]),
			.MEMWBdmemdumpIn(MEMWBdmemdumpIn),
			.MEMWBdmemdumpOut(MEMWBdmemdumpOut),
			.MEMWBrdaddrOut	(MEMWBrdaddrOut[2:0]),
			.MEMWBregwriteIn(MEMWBregwriteIn),
			.MEMWBregwriteOut(MEMWBregwriteOut),
			.MEMWBwritedataOut(MEMWBwritedataOut[15:0]),
			.MEMtoEX_forwardRs_logic(MEMtoEX_forwardRs_logic),
			.MEMtoEX_forwardRt_logic(MEMtoEX_forwardRt_logic),
			.MEMtoMEM_forwardRt_logic(MEMtoMEM_forwardRt_logic),
			.WBtoEX_forwardRs_logic(WBtoEX_forwardRs_logic),
			.WBtoEX_forwardRt_logic(WBtoEX_forwardRt_logic),
			.WBtoMEM_forwardRt_logic(WBtoMEM_forwardRt_logic),
			.branchstall_logic(branchstall_logic),
			.decodestall	(decodestall),
			.decodestall_logic(decodestall_logic),
			.errIn		(errIn/*.[2:0]*/),
			.errLogic	(errLogic/*.[3:0]*/),
			.errOut		(errOut/*.[2:0]*/),
			.err_next	(err_next),
			.executestall	(executestall),
			.executestall_logic(executestall_logic),
			.fetchpipestall	(fetchpipestall),
			.fetchstall	(fetchstall),
			.fetchstall_nobranch(fetchstall_nobranch),
			.halt		(halt),
			.halt_next	(halt_next),
			.memorystall	(memorystall),
			.resstall_logic	(resstall_logic),
			.rstReg		(rstReg),
			.err		(err),
			// Inputs
			.clk		(clk),
			.rst		(rst),
			.err		(err),
			.EXMEMalures	(EXMEMalures),
			.IDEXinst	(IDEXinst),
			.IDEXpcplus2	(IDEXpcplus2),
			.IDEXrs		(IDEXrs),
			.IDEXrt		(IDEXrt),
			.IDEXregwrite	(IDEXregwrite),
			.IDEXdmemwrite	(IDEXdmemwrite),
			.IDEXdmemen	(IDEXdmemen),
			.IDEXdmemdump	(IDEXdmemdump),
			.IDIFbranch	(IDIFbranch),
			.IDpcimm	(IDpcimm),
			.IDpcsrc	(IDpcsrc),
			.IFIDinst	(IFIDinst[15:0]),
			.IFIDpcplus2	(IFIDpcplus2[15:0]),
			.MEMWBdmemdump	(MEMWBdmemdump),
			.MEMWBrdaddr	(MEMWBrdaddr[2:0]),
			.MEMWBregwrite	(MEMWBregwrite),
			.MEMWBwritedata	(MEMWBwritedata[15:0]),
			.fetchstall_logic(fetchstall_logic),
			.memorystall_logic(memorystall_logic));


    //go back to decode module which contains the register file
   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

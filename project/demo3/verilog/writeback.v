module writeback (/*AUTOARG*/
   // Outputs
   rstReg, resstall_logic, memorystall, halt_next, halt,
   fetchstall_nobranch, fetchstall, fetchpipestall,
   executestall_logic, executestall, err_next, errOut, errLogic,
   errIn, decodestall_logic, decodestall, branchstall_logic,
   WBtoMEM_forwardRt_logic, WBtoEX_forwardRt_logic,
   WBtoEX_forwardRs_logic, MEMtoMEM_forwardRt_logic,
   MEMtoEX_forwardRt_logic, MEMtoEX_forwardRs_logic,
   MEMWBwritedataOut, MEMWBregwriteOut, MEMWBregwriteIn,
   MEMWBrdaddrOut, MEMWBdmemdumpOut, MEMWBdmemdumpIn, IFIDpcplus2Out,
   IFIDinstOut2, IFIDinstOut, IFIDinstIn, IDIFpcbranch, IDEXrtwriteen,
   IDEXrtOut2, IDEXrtOut, IDEXrtIn, IDEXrswriteen, IDEXrsOut2,
   IDEXrsOut, IDEXrsIn, IDEXregwriteOut, IDEXregwriteIn,
   IDEXrdaddrOut, IDEXrdaddr, IDEXpcplus2Out, IDEXmemtoregOut,
   IDEXmemtoreg, IDEXinstOut, IDEXdmemwriteOut, IDEXdmemwriteIn,
   IDEXdmemenOut, IDEXdmemenIn, IDEXdmemdumpOut, IDEXdmemdumpIn,
   IDEXalusrc2Out, IDEXalusrc2, EXtoID_forwardRs_logic,
   EXtoEX_forwardRt_logic, EXtoEX_forwardRs_logic, EXMEMrtwriteen,
   EXMEMrtinOut2, EXMEMrtinOut, EXMEMrtinIn, EXMEMrtin,
   EXMEMrtaddrOut, EXMEMrtaddr, EXMEMrsaddrOut, EXMEMrsaddr,
   EXMEMregwriteOut, EXMEMregwriteIn, EXMEMregwrite, EXMEMrdaddrOut,
   EXMEMrdaddr, EXMEMmemtoregOut, EXMEMmemtoreg, EXMEMdmemwriteOut2,
   EXMEMdmemwriteOut, EXMEMdmemwriteIn, EXMEMdmemwrite,
   EXMEMdmemenOut2, EXMEMdmemenOut, EXMEMdmemenIn, EXMEMdmemen,
   EXMEMdmemdumpOut, EXMEMdmemdumpIn, EXMEMdmemdump, EXMEMaluresOut,
   err,
   // Inputs
   clk, rst, err, EXMEMalures, IDEXinst, IDEXpcplus2, IDEXrs, IDEXrt,
   IDEXregwrite, IDEXdmemwrite, IDEXdmemen, IDEXdmemdump, IDIFbranch,
   IDpcimm, IDpcsrc, IFIDinst, IFIDpcplus2, MEMWBdmemdump,
   MEMWBrdaddr, MEMWBregwrite, MEMWBwritedata, fetchstall_logic,
   memorystall_logic
   );


   input clk;
   input rst;
   input err;
   input EXMEMalures;
   input IDEXinst;
   input EXMEMalures;
   input IDEXpcplus2;
   input IDEXrs;
   input IDEXrt;
   input IDEXregwrite;
   input IDEXdmemwrite;
   input IDEXdmemen;
   input IDEXdmemwrite;
   input IDEXdmemdump;
   input IDIFbranch;
   input IDpcimm;
   input IDpcsrc;
   input [15:0] IFIDinst;   
   input [15:0] IFIDpcplus2;   
   input 	MEMWBdmemdump;   
   input [2:0] 	MEMWBrdaddr;   
   input 	MEMWBregwrite;
   input [15:0] MEMWBwritedata;
   input 	fetchstall_logic;
   input 	memorystall_logic;   

   /*AUTOINPUT*/   
   /*AUTOOUTPUTEVERY*/
   // Beginning of automatic outputs (every signal)
   output [15:0] EXMEMaluresOut;
   output 	 EXMEMdmemdump;
   output 	 EXMEMdmemdumpIn;
   output 	 EXMEMdmemdumpOut;
   output 	 EXMEMdmemen;
   output 	 EXMEMdmemenIn;
   output 	 EXMEMdmemenOut;
   output 	 EXMEMdmemenOut2;
   output 	 EXMEMdmemwrite;
   output 	 EXMEMdmemwriteIn;
   output 	 EXMEMdmemwriteOut;
   output 	 EXMEMdmemwriteOut2;
   output 	 EXMEMmemtoreg;
   output 	 EXMEMmemtoregOut;
   output [2:0]  EXMEMrdaddr;
   output [2:0]  EXMEMrdaddrOut;
   output 	 EXMEMregwrite;
   output 	 EXMEMregwriteIn;
   output 	 EXMEMregwriteOut;
   output [2:0]  EXMEMrsaddr;
   output [2:0]  EXMEMrsaddrOut;
   output [2:0]  EXMEMrtaddr;
   output [2:0]  EXMEMrtaddrOut;
   output [15:0] EXMEMrtin;
   output [15:0] EXMEMrtinIn;
   output [15:0] EXMEMrtinOut;
   output [15:0] EXMEMrtinOut2;
   output 	 EXMEMrtwriteen;
   output 	 EXtoEX_forwardRs_logic;
   output 	 EXtoEX_forwardRt_logic;
   output 	 EXtoID_forwardRs_logic;
   output 	 IDEXalusrc2;
   output 	 IDEXalusrc2Out;
   output 	 IDEXdmemdumpIn;
   output 	 IDEXdmemdumpOut;
   output 	 IDEXdmemenIn;
   output 	 IDEXdmemenOut;
   output 	 IDEXdmemwriteIn;
   output 	 IDEXdmemwriteOut;
   output [15:0] IDEXinstOut;
   output 	 IDEXmemtoreg;
   output 	 IDEXmemtoregOut;
   output [15:0] IDEXpcplus2Out;
   output [2:0]  IDEXrdaddr;
   output [2:0]  IDEXrdaddrOut;
   output 	 IDEXregwriteIn;
   output 	 IDEXregwriteOut;
   output [15:0] IDEXrsIn;
   output [15:0] IDEXrsOut;
   output [15:0] IDEXrsOut2;
   output 	 IDEXrswriteen;
   output [15:0] IDEXrtIn;
   output [15:0] IDEXrtOut;
   output [15:0] IDEXrtOut2;
   output 	 IDEXrtwriteen;
   output [15:0] IDIFpcbranch;
   output [15:0] IFIDinstIn;
   output [15:0] IFIDinstOut;
   output [15:0] IFIDinstOut2;
   output [15:0] IFIDpcplus2Out;
   output 	 MEMWBdmemdumpIn;
   output 	 MEMWBdmemdumpOut;
   output [2:0]  MEMWBrdaddrOut;
   output 	 MEMWBregwriteIn;
   output 	 MEMWBregwriteOut;
   output [15:0] MEMWBwritedataOut;
   output 	 MEMtoEX_forwardRs_logic;
   output 	 MEMtoEX_forwardRt_logic;
   output 	 MEMtoMEM_forwardRt_logic;
   output 	 WBtoEX_forwardRs_logic;
   output 	 WBtoEX_forwardRt_logic;
   output 	 WBtoMEM_forwardRt_logic;
   output 	 branchstall_logic;
   output 	 decodestall;
   output 	 decodestall_logic;
   output 	 errIn [2:0];
   output 	 errLogic [3:0];
   output 	 errOut [2:0];
   output 	 err_next;
   output 	 executestall;
   output 	 executestall_logic;
   output 	 fetchpipestall;
   output 	 fetchstall;
   output 	 fetchstall_nobranch;
   output 	 halt;
   output 	 halt_next;
   output 	 memorystall;
   output 	 resstall_logic;
   output 	 rstReg;
   // End of automatics
   /*AUTOLOGIC*/
   /*AUTOWIRE*/

   output 		err;
   
      //IF/ID
   wire [15:0] IFIDinst;
   wire [15:0] IFIDpcplus2;
   wire [15:0] IFIDinstOut;
   wire [15:0] IFIDpcplus2Out;
   wire [15:0] IFIDinstIn;
   wire [15:0] IFIDinstOut2; 
   wire rstReg;

   //forwarding new pc
   wire [15:0] IDIFpcbranch;
   wire        IDIFbranch;
   wire        IDpcsrc;
   wire        IDpcimm;

   //ID/EX
   wire [15:0] IDEXinst;
   wire [15:0] IDEXpcplus2;
   wire [15:0] IDEXrs;
   wire [15:0] IDEXrt;

   wire [15:0] IDEXrsIn;
   wire [15:0] IDEXrtIn;

   wire [15:0] IDEXinstOut;
   wire [15:0] IDEXpcplus2Out;
   wire [15:0] IDEXrsOut;
   wire [15:0] IDEXrtOut;
   wire [15:0] IDEXrsOut2;
   wire [15:0] IDEXrtOut2;  
  
   wire        IDEXregwrite;
   wire        IDEXdmemwrite;
   wire        IDEXdmemen;
   wire        IDEXmemtoreg;
   wire        IDEXdmemdump;
   wire        IDEXalusrc2;

   wire        IDEXregwriteOut;
   wire        IDEXdmemwriteOut;
   wire        IDEXdmemenOut;
   wire        IDEXmemtoregOut;
   wire        IDEXdmemdumpOut;
   wire        IDEXalusrc2Out;

   wire        IDEXregwriteIn;
   wire        IDEXdmemwriteIn;
   wire        IDEXdmemenIn;
   wire        IDEXdmemdumpIn;
   
   wire [2:0]  IDEXrdaddr;
   wire [2:0]  IDEXrdaddrOut;

   //EX/MEM
   wire [15:0] EXMEMalures;
   wire [15:0] EXMEMrtin;

   wire [15:0] EXMEMrtinIn;

   wire [15:0] EXMEMaluresOut;
   wire [15:0] EXMEMrtinOut;
   wire [15:0] EXMEMrtinOut2;

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
   wire        EXMEMdmemenOut2;
   wire        EXMEMdmemwriteOut2;

   wire        EXMEMregwriteIn;
   wire        EXMEMdmemwriteIn;
   wire        EXMEMdmemenIn;
   wire        EXMEMdmemdumpIn;
 
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

   wire        MEMWBregwriteIn;
   wire        MEMWBdmemdumpIn;
   
   wire [2:0]  MEMWBrdaddr;
   
   wire [2:0]  MEMWBrdaddrOut;

   //forwarding
   //ex to id forwarding is weird since the logic is inside of decode, so we
   //let decode handle the pathway. proc still handle the logic for it
   wire EXtoID_forwardRs_logic;

   wire EXtoEX_forwardRs_logic;
   wire EXtoEX_forwardRt_logic;
   wire MEMtoEX_forwardRs_logic;
   wire MEMtoEX_forwardRt_logic;
   wire MEMtoMEM_forwardRt_logic;

   wire WBtoEX_forwardRs_logic;
   wire WBtoEX_forwardRt_logic;
   wire IDEXrswriteen;
   wire IDEXrtwriteen;

   wire WBtoMEM_forwardRt_logic;
   wire EXMEMrtwriteen;

      wire halt;


   
   //stalls
   //wire fetchstall_logic;
   wire fetchstall_logic;
   wire decodestall_logic;
   wire executestall_logic;
   wire memorystall_logic;
   wire resstall_logic;
   wire branchstall_logic;
   wire fetchstall;
   wire fetchstall_nobranch;
   wire fetchpipestall;
   wire decodestall;
   wire executestall;
   wire memorystall;

   assign resstall_logic = ~rstReg;
   assign branchstall_logic = IDIFbranch;
   assign decodestall_logic = (((IFIDinstOut[10:8] == IDEXrdaddrOut)) & (IDEXregwriteOut) & IDpcsrc & ~IDpcimm) |
               	              (((IFIDinstOut[10:8] == EXMEMrdaddrOut)) & (EXMEMmemtoregOut) & (EXMEMregwriteOut) & IDpcsrc & ~IDpcimm);
   assign executestall_logic = ((IDEXinstOut[10:8] == EXMEMrdaddrOut) & (EXMEMregwriteOut) & (EXMEMmemtoregOut)) |
	                        ((IDEXinstOut[7:5] == EXMEMrdaddrOut) & (EXMEMregwriteOut) & (EXMEMmemtoregOut) & IDEXalusrc2Out);
   //assign memorystall_logic = 1'b0; //:q((EXMEMrtaddrOut == MEMWBrdaddrOut) & MEMWBregwriteOut));

   assign fetchpipestall = branchstall_logic | fetchstall_logic;
   assign fetchstall = branchstall_logic | fetchstall_nobranch;
   assign fetchstall_nobranch = (decodestall_logic | executestall_logic | memorystall_logic);
   assign decodestall = decodestall_logic | executestall_logic | memorystall_logic;
   assign executestall = executestall_logic | memorystall_logic;
   assign memorystall = memorystall_logic;


   //error
   wire errLogic[3:0];
   wire errIn[2:0];
   wire errOut[2:0];
   wire err_next;

   assign err_next = errLogic[3] | errOut[2];
   //assign err = 1'b0;
   reg_1b errreg(.clk(clk), .rst(rst), .inData(err_next), .writeEn(~err), .outData(err));

   //for halt and resets
   wire halt_next;
   assign halt_next = EXMEMdmemdumpOut | err_next; //halt next cycle when halt is asserted or an err occurred
   reg_1b rstreg(.clk(clk), .rst(rst), .inData(1'b1),.writeEn(1'b1), .outData(rstReg)); 
   reg_1b haltreg(.clk(clk), .rst(rst), .inData(halt_next), .writeEn(~halt), .outData(halt)); 

   assign EXtoID_forwardRs_logic = ((IFIDinstOut2[10:8]) == (EXMEMrdaddrOut)) & (EXMEMregwriteOut) & (~EXMEMmemtoregOut);
   assign EXtoEX_forwardRs_logic = ((IDEXinstOut[10:8]) == (EXMEMrdaddrOut)) & (EXMEMregwriteOut) & (~EXMEMmemtoregOut);
   assign EXtoEX_forwardRt_logic = ((IDEXinstOut[7:5]) == (EXMEMrdaddrOut)) & (EXMEMregwriteOut) & (~EXMEMmemtoregOut);
   assign MEMtoEX_forwardRs_logic = ((IDEXinstOut[10:8]) == (MEMWBrdaddrOut)) & (MEMWBregwriteOut);
   assign MEMtoEX_forwardRt_logic = ((IDEXinstOut[7:5]) == (MEMWBrdaddrOut)) & (MEMWBregwriteOut);
   assign MEMtoMEM_forwardRt_logic = ((EXMEMrtaddrOut == MEMWBrdaddrOut)) & (MEMWBregwriteOut);
  
   assign WBtoEX_forwardRs_logic = (executestall & MEMtoEX_forwardRs_logic);
   assign WBtoEX_forwardRt_logic = (executestall & MEMtoEX_forwardRt_logic);
   assign IDEXrswriteen = (~executestall) | WBtoEX_forwardRs_logic;
   assign IDEXrtwriteen = (~executestall) | WBtoEX_forwardRt_logic;

   assign WBtoMEM_forwardRt_logic = (memorystall & MEMtoMEM_forwardRt_logic);
   assign EXMEMrtwriteen = (~memorystall) | WBtoMEM_forwardRt_logic;
   
   
   //IF-ID Pipeline
   assign IFIDinstIn = fetchpipestall ? 16'b0000_1000_0000_0000 : IFIDinst;
   assign errIn[0] = fetchpipestall ? 1'b0 : errLogic[0];
   reg_16b ifidinst(.clk(clk), .rst(rst),.inData(IFIDinstIn),.writeEn(~decodestall),.outData(IFIDinstOut));
   reg_16b ifidpcplus2(.clk(clk), .rst(rst),.inData(IFIDpcplus2),.writeEn(~decodestall),.outData(IFIDpcplus2Out));
   reg_1b ifiderr(.clk(clk), .rst(rst),.inData(errIn[0]),.writeEn(~decodestall),.outData(errOut[0]));
   assign IFIDinstOut2 = resstall_logic ? 16'b0000_1000_0000_0000 : IFIDinstOut;


   
   //ID-EX Pipeline
   assign IDEXregwriteIn = decodestall_logic ? 1'b0 : IDEXregwrite;
   assign IDEXdmemwriteIn = decodestall_logic ? 1'b0 : IDEXdmemwrite;
   assign IDEXdmemenIn = decodestall_logic ? 1'b0 : IDEXdmemen;
   assign IDEXdmemdumpIn = decodestall_logic ? 1'b0 : IDEXdmemdump;
   assign errIn[1] = decodestall_logic ? 1'b0 : (errLogic[1] | errOut[0]);

   assign IDEXrsIn = WBtoEX_forwardRs_logic ? MEMWBwritedataOut : IDEXrs;
   assign IDEXrtIn = WBtoEX_forwardRt_logic ? MEMWBwritedataOut : IDEXrt;

   reg_16b idexinst(.clk(clk), .rst(rst),.inData(IDEXinst),.writeEn(~executestall),.outData(IDEXinstOut));
   reg_16b idexpcplus2(.clk(clk), .rst(rst),.inData(IDEXpcplus2),.writeEn(~executestall),.outData(IDEXpcplus2Out));
   reg_16b idexrs(.clk(clk), .rst(rst),.inData(IDEXrsIn),.writeEn(IDEXrswriteen),.outData(IDEXrsOut));
   reg_16b idexrt(.clk(clk), .rst(rst),.inData(IDEXrtIn),.writeEn(IDEXrtwriteen),.outData(IDEXrtOut));
   
   reg_1b idexregwrite(.clk(clk), .rst(rst),.inData(IDEXregwriteIn),.writeEn(~executestall), .outData(IDEXregwriteOut));
   reg_1b idexdmemwrite(.clk(clk), .rst(rst),.inData(IDEXdmemwriteIn),.writeEn(~executestall), .outData(IDEXdmemwriteOut));
   reg_1b idexdmemen(.clk(clk), .rst(rst),.inData(IDEXdmemenIn),.writeEn(~executestall), .outData(IDEXdmemenOut));
   reg_1b idexmemtoreg(.clk(clk), .rst(rst),.inData(IDEXmemtoreg),.writeEn(~executestall), .outData(IDEXmemtoregOut));
   reg_1b idexdmemdump(.clk(clk), .rst(rst),.inData(IDEXdmemdumpIn),.writeEn(~executestall), .outData(IDEXdmemdumpOut));
   reg_1b idexalusrc2(.clk(clk), .rst(rst), .inData(IDEXalusrc2), .writeEn(~executestall), .outData(IDEXalusrc2Out));

   reg_3b idexrdaddr(.clk(clk), .rst(rst),.inData(IDEXrdaddr),.writeEn(~executestall),.outData(IDEXrdaddrOut));

   reg_1b idexerr(.clk(clk), .rst(rst),.inData(errIn[1]),.writeEn(~executestall),.outData(errOut[1]));

   assign IDEXrsOut2 = EXtoEX_forwardRs_logic ? EXMEMaluresOut : (MEMtoEX_forwardRs_logic ? MEMWBwritedataOut : IDEXrsOut);
   assign IDEXrtOut2 = EXtoEX_forwardRt_logic ? EXMEMaluresOut : (MEMtoEX_forwardRt_logic ? MEMWBwritedataOut : IDEXrtOut);

   
   //EX-MEM Pipeline  
   assign EXMEMregwriteIn = executestall_logic ? 1'b0 : EXMEMregwrite;
   assign EXMEMdmemwriteIn = executestall_logic ? 1'b0 : EXMEMdmemwrite;
   assign EXMEMdmemenIn = executestall_logic ? 1'b0 : EXMEMdmemen;
   assign EXMEMdmemdumpIn = executestall_logic ? 1'b0 : EXMEMdmemdump;
   assign errLogic[2] = 1'b0;
   assign errIn[2] = executestall_logic ? 1'b0 : (errLogic[2] | errOut[1]);
   assign EXMEMrtinIn = WBtoMEM_forwardRt_logic ? MEMWBwritedataOut : EXMEMrtin;

   reg_16b exmemalures(.clk(clk), .rst(rst),.inData(EXMEMalures),.writeEn(~memorystall),.outData(EXMEMaluresOut));
   reg_16b exmemrtin(.clk(clk), .rst(rst),.inData(EXMEMrtinIn),.writeEn(EXMEMrtwriteen),.outData(EXMEMrtinOut));

   reg_1b exmemregwrite(.clk(clk), .rst(rst),.inData(EXMEMregwriteIn),.writeEn(~memorystall),.outData(EXMEMregwriteOut));
   reg_1b exmemdmemwrite(.clk(clk), .rst(rst),.inData(EXMEMdmemwriteIn),.writeEn(~memorystall),.outData(EXMEMdmemwriteOut));
   reg_1b exmemdmemen(.clk(clk), .rst(rst),.inData(EXMEMdmemenIn),.writeEn(~memorystall),.outData(EXMEMdmemenOut));
   reg_1b exmemmemtoreg(.clk(clk), .rst(rst),.inData(EXMEMmemtoreg),.writeEn(~memorystall),.outData(EXMEMmemtoregOut));
   reg_1b exmemdmemdump(.clk(clk), .rst(rst),.inData(EXMEMdmemdumpIn),.writeEn(~memorystall),.outData(EXMEMdmemdumpOut));

   reg_3b exmemrsaddr(.clk(clk), .rst(rst),.inData(EXMEMrsaddr),.writeEn(~memorystall),.outData(EXMEMrsaddrOut));
   reg_3b exmemrtaddr(.clk(clk), .rst(rst),.inData(EXMEMrtaddr),.writeEn(~memorystall),.outData(EXMEMrtaddrOut));
   reg_3b exmemrdaddr(.clk(clk), .rst(rst),.inData(EXMEMrdaddr),.writeEn(~memorystall),.outData(EXMEMrdaddrOut));

   reg_1b exmemerr(.clk(clk), .rst(rst),.inData(errIn[2]),.writeEn(~memorystall),.outData(errOut[2]));

   assign EXMEMrtinOut2 = MEMtoMEM_forwardRt_logic ? MEMWBwritedataOut : EXMEMrtinOut;
   assign EXMEMdmemenOut2 = ~halt & EXMEMdmemenOut & ~err;
   assign EXMEMdmemwriteOut2 = ~halt & EXMEMdmemwriteOut & ~err;
   
   //MEM-WB Pipeline
   assign MEMWBregwriteIn = memorystall_logic ? 1'b0 : (~err_next & ~err & MEMWBregwrite);
   assign MEMWBdmemdumpIn = memorystall_logic ? 1'b0 : MEMWBdmemdump;

   reg_16b memwbwritedata(.clk(clk), .rst(rst),.inData(MEMWBwritedata),.writeEn(1'b1),.outData(MEMWBwritedataOut));

   reg_1b memwbregwrite(.clk(clk), .rst(rst),.inData(MEMWBregwriteIn),.writeEn(1'b1),.outData(MEMWBregwriteOut));
   reg_1b memwbdmemdump(.clk(clk), .rst(rst),.inData(MEMWBdmemdumpIn),.writeEn(1'b1),.outData(MEMWBdmemdumpOut));

   reg_3b memwbrdaddr(.clk(clk), .rst(rst),.inData(MEMWBrdaddr),.writeEn(1'b1),.outData(MEMWBrdaddrOut));

    
endmodule

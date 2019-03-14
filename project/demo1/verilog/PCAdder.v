module PCAdder(/*AUTOARG*/
   // Outputs
   pc, pc_plus2, //err,
   // Inputs
   basePC, I, D, SESel, Jump, branchFlag, get02, getEpc, jumpValue, epcValue
   );
   //Outputs

//   parameter N =16;
   output [15:0] pc; 
   output [15:0] pc_plus2; //need this to give to the ALU or register file
   //output        err;

   // 00 : pc + 2 + I(sign extend)
   // 01   pc + 2 + D(sign extend)
   // 02 : rs + I(sign extend)

   //Inputs
   input [15:0] basePC;
   input [7:0] 	I;
   input [10:0] D;
   input        SESel;
   input        Jump;
   input        branchFlag; //which is (aluFlag and PCSrc)?
   input        get02;
   input        getEpc;
   input [15:0] jumpValue;
   input [15:0] epcValue;


   //wire [1:0] 	ofl;
   // assign err = (ofl[1] | (ofl[0] & branchFlag)) | 
   // 		(^{basePC, I, D, SESel, Jump,
   // 		   branchFlag, get02, getEpc,
   // 		   jumpValue, epcValue} === 1'bX);
   
   wire [15:0]          iSign,dSign, pc_plusExt, extension, pcRelative, pcNoException, pcWithSiic;
   assign iSign = {{8{I[7]}},I};
   assign dSign = {{5{D[10]}},D};
   
   rca_16b pc_plus_2(
                     // Outputs
                     .S                 (pc_plus2),
                     //.C_out             (ofl[1]),
                     .C_out             (),
                     // Inputs
                     .A                 (basePC[15:0]),
                     .B                 (16'b0000_0000_0000_0010),
                     .C_in              (1'b0));

   //wire                 dSig, bsig, registerJump;
   //wire [15:0]          extension;
   
   //you could use SESel[1] for this one
   //d_iSig dsig(.opcode(OpCode), .out(dsig));

   mux2_1_16b muxImm (.InA(iSign), .InB(dSign), .S(SESel), .Out(extension));

   rca_16b pc_plus_ext(
                       // Outputs
                       .S               (pc_plusExt),
                       //.C_out           (ofl[0]),
                       .C_out             (),
                       // Inputs
                       .A               (pc_plus2[15:0]),
                       .B               (extension),
                       .C_in            (1'b0));
                       
   //this is just Jump signal from control
   //regJump regjump (.opcode(OpCode), .out(registerJump));
   
   //branchFlag is actually (PCImm | (PCSrc & branchFlagFromAlu))
   mux2_1_16b muxBranch (.InA(pc_plus2), .InB(pc_plusExt), .S(branchFlag), .Out(pcRelative));
   mux2_1_16b pcFinalNoException (.InA(pcRelative), .InB(jumpValue), .S(Jump), .Out(pcNoException));
   mux2_1_16b muxEpc (.InA(pcNoException), .InB(16'h0002), .S(get02), .Out(pcWithSiic));
   mux2_1_16b pcFinalWithException (.InA(pcWithSiic), .InB(epcValue), .S(getEpc), .Out(pc));
endmodule // PCAdder

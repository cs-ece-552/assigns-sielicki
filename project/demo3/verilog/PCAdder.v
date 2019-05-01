module PCAdder(/*AUTOARG*/
   // Outputs
   nextpc, //err,
   // Inputs
   pc_plus2,  I, D, SESel, Jump, get02, getEpc, Rs, epcValue
   );
   
   //Outputs

//   parameter N =16;
   output [15:0] nextpc; //need this to give to the ALU or register file
   //output        err;

   // 00 : pc + 2 + I(sign extend)
   // 01   pc + 2 + D(sign extend)
   // 02 : rs + I(sign extend)

   //Inputs
   input [15:0] pc_plus2;
   input [7:0] 	I;
   input [10:0] D;
   input        SESel;
   input        Jump;
   input        get02;
   input        getEpc;
   input [15:0] Rs;
   input [15:0] epcValue;


   //wire [1:0] 	ofl;
   // assign err = (ofl[1] | (ofl[0] & branchFlag)) | 
   // 		(^{basePC, I, D, SESel, Jump,
   // 		   branchFlag, get02, getEpc,
   // 		   jumpValue, epcValue} === 1'bX);

   wire [15:0]          iSign,dSign, pc_plusExt, extension, pcWithSiic, base;
   assign iSign = {{8{I[7]}},I};
   assign dSign = {{5{D[10]}},D};

   //wire                 dSig, bsig, registerJump;
   //wire [15:0]          extension;
   
   //you could use SESel[1] for this one
   //d_iSig dsig(.opcode(OpCode), .out(dsig));

   mux2_1_16b muxImm (.InA(iSign), .InB(dSign), .S(SESel), .Out(extension));
   mux2_1_16b muxBas (.InA(pc_plus2[15:0]), .InB(Rs), .S(Jump), .Out(base));

   rca_16b pc_plus_ext(
                       // Outputs
                       .S               (pc_plusExt),
                       //.C_out           (ofl[0]),
                       .C_out             (),
                       // Inputs
                       .A               (base),
                       .B               (extension),
                       .C_in            (1'b0));

   //this is just Jump signal from control
   //regJump regjump (.opcode(OpCode), .out(registerJump));

   mux2_1_16b muxEpc (.InA(pc_plusExt), .InB(16'h0002), .S(get02), .Out(pcWithSiic));
   mux2_1_16b pcFinalWithException (.InA(pcWithSiic), .InB(epcValue), .S(getEpc), .Out(nextpc));

endmodule // PCAdder

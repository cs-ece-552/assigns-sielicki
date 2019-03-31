module decode(
    //Output
    InstOut, pcplus2Out, Rs, Rt,
    RegWrite, DMemWrite, DMemEn, MemToReg, DMemDump,
    RdAddr,
    pcbranch, branch,
    err,
    //Input
    InstIn, pcplus2In,
    wbwriteData,
    wbRegWrite,
    wbRdAddr,
    clk, rst
    );

    output [15:0] InstOut;
    output [15:0] pcplus2Out;
    output [15:0] Rs;
    output [15:0] Rt;

    output RegWrite;
    output DMemWrite;
    output DMemEn;
    output MemToReg;
    output DMemDump;

    output [2:0] RdAddr;

    output [15:0] pcbranch;
    output branch;

    output err;

    input [15:0] InstIn;
    input [15:0] pcplus2In;

    input [15:0] wbwriteData;
    input wbRegWrite;
    input [2:0] wbRdAddr;

    input clk;
    input rst;

    wire ALUSrc2;
    wire PCSrc;
    wire PCImm;
    wire Jump;
    wire [1:0] RegDst;
    wire [2:0] SESel;

    wire nz;
    wire lt ;
    wire branchflag;

    wire illegalOp;
    wire rti;
    wire [15:0] epc;

    wire [1:0]           errTemp;

    assign err = |errTemp;

    assign InstOut = InstIn;
    assign pcplus2Out = pcplus2In;
    
    control control(/*AUTOINST*/
                    // Outputs
                    .err                (errTemp[0]),
                    .RegWrite           (RegWrite),
                    .DMemWrite          (DMemWrite),
                    .DMemEn             (DMemEn),
                    .ALUSrc2            (ALUSrc2),
                    .PCSrc              (PCSrc),
                    .PCImm              (PCImm),
                    .MemToReg           (MemToReg),
                    .DMemDump           (DMemDump),
                    .Jump               (Jump),
                    .RegDst             (RegDst[1:0]),
                    .SESel              (SESel[2:0]),
                    .illegalOp          (illegalOp),
                    .rti                (rti),
                    // Inputs
                    .OpCode             (InstIn[15:11]),
                    .Funct              (InstIn[1:0]));

    rf      rf_bypass(/*AUTOINST*/
                      // Outputs
                    .readData1        (Rs),
                    .readData2        (Rt),
                    .err              (errTemp[1]),
                    // Inputs
                    .clk              (clk),
                    .rst              (rst),
                    .readReg1Sel      (InstIn[10:8]),
                    .readReg2Sel      (InstIn[7:5]),
                    .writeRegSel      (wbRdAddr),
                    .writeData        (wbwriteData),
                    .writeEn          (wbRegWrite));

    assign RdAddr = RegDst[1] ? 
                             (RegDst[0] ? 3'b111 : InstIn[10:8]) :
                             (RegDst[0] ? InstIn[7:5] : InstIn[4:2]);
                      
    PCAdder pc_adder(
                    // Outputs
                    .nextpc(pcbranch), 
                    // Inputs
                    .pc_plus2(pcplus2In), 
                    .I(InstIn[7:0]), 
                    .D(InstIn[10:0]), 
                    .SESel(SESel[1]),
                    .Jump(Jump),
                    .get02(illegalOp),
                    .getEpc(rti), 
                    .Rs(Rs),
                    .epcValue(epc));

    assign nz = |Rs;
    assign lt  = Rs[15];
    assign branchflag = (InstIn[12] == 1'b1) ?
                            ((InstIn[11] == 1'b1) ? ~lt : lt  ):
                            ((InstIn[11] == 1'b1) ? ~nz : nz);                
    
    assign branch = Jump | PCImm | illegalOp | rti | (PCSrc & branchflag);
    
    reg_16b ePC(
	        // Outputs
	        .outData                (epc),
            // Inputs
            .clk                    (clk),
            .rst                    (rst),
            .inData                 (pcplus2In),
            .writeEn                (illegalOp));
    
endmodule

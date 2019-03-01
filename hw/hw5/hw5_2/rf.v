/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1
  
   This module creates a 16-bit register.  It has 1 write port, 2 read
   ports, 3 register select inputs, a write enable, a reset, and a clock
   input.  All register state changes occur on the rising edge of the
   clock. 
*/
module rf (
           // Outputs
           readData1, readData2, err,
           // Inputs
           clk, rst, readReg1Sel, readReg2Sel, writeRegSel, writeData, writeEn
           );
   
   input        clk, rst;
   input [2:0]  readReg1Sel;
   input [2:0]  readReg2Sel;
   input [2:0]  writeRegSel;
   input [15:0] writeData;
   input        writeEn;

   output [15:0] readData1;
   output [15:0] readData2;
   output        err;

   wire [15:0] 	 regs[7:0];
   wire [7:0] 	 writeReg;
   wire [15:0] 	 writeDataReset;

   // Poor man's decoder
   // Would love to just write
   // assign writeReg = (writeEn) ? (1 << writeRegSel) : 8'b0;
   assign writeReg[0] = (~writeRegSel[0] & ~writeRegSel[1] & ~writeRegSel[2] & writeEn) | rst;
   assign writeReg[1] = ( writeRegSel[0] & ~writeRegSel[1] & ~writeRegSel[2] & writeEn)	| rst;
   assign writeReg[2] = (~writeRegSel[0] &  writeRegSel[1] & ~writeRegSel[2] & writeEn) | rst;
   assign writeReg[3] = ( writeRegSel[0] &  writeRegSel[1] & ~writeRegSel[2] & writeEn)	| rst;
   assign writeReg[4] = (~writeRegSel[0] & ~writeRegSel[1] &  writeRegSel[2] & writeEn) | rst;
   assign writeReg[5] = ( writeRegSel[0] & ~writeRegSel[1] &  writeRegSel[2] & writeEn)	| rst;
   assign writeReg[6] = (~writeRegSel[0] &  writeRegSel[1] &  writeRegSel[2] & writeEn) | rst;
   assign writeReg[7] = ( writeRegSel[0] &  writeRegSel[1] &  writeRegSel[2] & writeEn)	| rst;

   assign writeDataReset = ~rst ? writeData : 16'b0;

   mux8_1_16b rd1(
		   // Outputs
		   .Out			(readData1),
		   // Inputs
		   .In			(regs),
		   .S			(readReg1Sel));

   mux8_1_16b rd2(
		  // Outputs
		  .Out			(readData2),
		  // Inputs
		  .In			(regs),
		  .S			(readReg2Sel));

   reg_16b reg0(
		// Outputs
		.outData		(regs[0]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[0]));

   reg_16b reg1(
		// Outputs
		.outData		(regs[1]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[1]));

   reg_16b reg2(
		// Outputs
		.outData		(regs[2]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[2]));

   reg_16b reg3(
		// Outputs
		.outData		(regs[3]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[3]));

   reg_16b reg4(
		// Outputs
		.outData		(regs[4]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[4]));
   
   reg_16b reg5(
		// Outputs
		.outData		(regs[5]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[5]));

   reg_16b reg6(
		// Outputs
		.outData		(regs[6]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[6]));

   reg_16b reg7(
		// Outputs
		.outData		(regs[7]),
		// Inputs
		.clk			(clk),
		.rst			(rst),
		.inData			(writeDataReset),
		.writeEn		(writeReg[7]));
   

endmodule

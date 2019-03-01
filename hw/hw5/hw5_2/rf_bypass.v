/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #2
  
   This module creates a wrapper around the 8x16b register file, to do
   do the bypassing logic for RF bypassing.
*/
module rf_bypass (
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

   
   wire [15:0] 	 rfout[1:0];


   assign readData1 = rst ? 16'b0 
		          : writeEn & (readReg1Sel == writeRegSel) ? writeData 
                                                                   : rfout[0];
   
   assign readData2 = rst ? 16'b0 
		          : writeEn & (readReg2Sel == writeRegSel) ? writeData 
		                                                   : rfout[1];
   
   rf bypassable(
		 // Outputs
		 .readData1		(rfout[0]),
		 .readData2		(rfout[1]),
		 .err			(err),
		 // Inputs
		 .clk			(clk),
		 .rst			(rst),
		 .readReg1Sel		(readReg1Sel[2:0]),
		 .readReg2Sel		(readReg2Sel[2:0]),
		 .writeRegSel		(writeRegSel[2:0]),
		 .writeData		(writeData[15:0]),
		 .writeEn		(writeEn));
   

endmodule

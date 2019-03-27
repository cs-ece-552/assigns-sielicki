/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1
  
   This module creates a 16-bit register.  It has an input port
   and an output port. a write enable, a reset, and a clock
   input.  All register state changes occur on the rising edge of the
   clock.
*/
module reg_16b (
           // Outputs
		outData,
           // Inputs
           clk, rst, inData, writeEn
           );
   
   input         clk;
   input         rst;
   input         inData;
   input 	 writeEn;
   
   input [15:0]  inData;
   output [15:0] outData;
   wire [15:0] 	 dEnabled;
   wire [15:0] 	 qReturn;


   assign outData[15:0] = qReturn[15:0];
   assign dEnabled[15:0] = writeEn ? inData[15:0] : qReturn[15:0];
   

   dff bit0(
	    // Outputs
	    .q				(qReturn[0]),
	    // Inputs
	    .d				(dEnabled[0]),
	    .clk			(clk),
	    .rst			(rst));

   dff bit1(
	    // Outputs
	    .q				(qReturn[1]),
	    // Inputs
	    .d				(dEnabled[1]),
	    .clk			(clk),
	    .rst			(rst));


   dff bit2(
	    // Outputs
	    .q				(qReturn[2]),
	    // Inputs
	    .d				(dEnabled[2]),
	    .clk			(clk),
	    .rst			(rst));

   dff bit3(
	    // Outputs
	    .q				(qReturn[3]),
	    // Inputs
	    .d				(dEnabled[3]),
	    .clk			(clk),
	    .rst			(rst));   

   dff bit4(
	    // Outputs
	    .q				(qReturn[4]),
	    // Inputs
	    .d				(dEnabled[4]),
	    .clk			(clk),
	    .rst			(rst));
   
   dff bit5(
	    // Outputs
	    .q				(qReturn[5]),
	    // Inputs
	    .d				(dEnabled[5]),
	    .clk			(clk),
	    .rst			(rst));


   dff bit6(
	    // Outputs
	    .q				(qReturn[6]),
	    // Inputs
	    .d				(dEnabled[6]),
	    .clk			(clk),
	    .rst			(rst));

   dff bit7(
	    // Outputs
	    .q				(qReturn[7]),
	    // Inputs
	    .d				(dEnabled[7]),
	    .clk			(clk),
	    .rst			(rst));

   dff bit8(
	    // Outputs
	    .q				(qReturn[8]),
	    // Inputs
	    .d				(dEnabled[8]),
	    .clk			(clk),
	    .rst			(rst));

   dff bit9(
	    // Outputs
	    .q				(qReturn[9]),
	    // Inputs
	    .d				(dEnabled[9]),
	    .clk			(clk),
	    .rst			(rst));

   dff bit10(
	     // Outputs
	     .q				(qReturn[10]),
	     // Inputs
	     .d				(dEnabled[10]),
	     .clk			(clk),
	     .rst			(rst));

   dff bit11(
	     // Outputs
	     .q				(qReturn[11]),
	     // Inputs
	     .d				(dEnabled[11]),
	     .clk			(clk),
	     .rst			(rst));

   dff bit12(
	     // Outputs
	     .q				(qReturn[12]),
	     // Inputs
	     .d				(dEnabled[12]),
	     .clk			(clk),
	     .rst			(rst));

   dff bit13(
	     // Outputs
	     .q				(qReturn[13]),
	     // Inputs
	     .d				(dEnabled[13]),
	     .clk			(clk),
	     .rst			(rst));

   dff bit14(
	     // Outputs
	     .q				(qReturn[14]),
	     // Inputs
	     .d				(dEnabled[14]),
	     .clk			(clk),
	     .rst			(rst));

   dff bit15(
	     // Outputs
	     .q				(qReturn[15]),
	     // Inputs
	     .d				(dEnabled[15]),
	     .clk			(clk),
	     .rst			(rst));   

   
   
endmodule

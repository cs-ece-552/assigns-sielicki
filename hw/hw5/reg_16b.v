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
   input  [15:0] inData;
   output [15:0] outData;

   dff bit1(/*AUTOINST*/)


endmodule

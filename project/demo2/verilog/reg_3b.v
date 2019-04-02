module reg_3b (
               // Outputs
		           outData,
               // Inputs
               clk, rst, inData, writeEn
               );
   
   input         clk;
   input         rst;
   input         writeEn;
   
   input   [2:0]      inData;
   output  [2:0]      outData;
   wire    [2:0]      dEnabled;
   wire    [2:0]      qReturn;


   assign outData= qReturn;
   assign dEnabled = writeEn ? inData : qReturn;
   

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

endmodule

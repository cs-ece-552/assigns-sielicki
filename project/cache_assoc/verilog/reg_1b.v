module reg_1b (
                // Outputs
		            outData,
                // Inputs
                clk, rst, inData, writeEn
                );
   
   input         clk;
   input         rst;
   input         writeEn;
   
   input         inData;
   output        outData;
   wire          dEnabled;
   wire          qReturn;


   assign outData= qReturn;
   assign dEnabled = writeEn ? inData : qReturn;
   

   dff bit0(
	          // Outputs
	          .q				(qReturn),
	          // Inputs
	          .d				(dEnabled),
	          .clk			(clk),
	          .rst			(rst));

endmodule

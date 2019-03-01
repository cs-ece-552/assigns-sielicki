/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 2

    A 16-bit ALU module.  It is designed to choose
    the correct operation to perform on 2 16-bit numbers from rotate
    left, shift left, shift right arithmetic, shift right logical, add,
    or, xor, & and.  Upon doing this, it should output the 16-bit result
    of the operation, as well as output a Zero bit and an Overflow
    (OFL) bit.
*/
module alu (A, B, Cin, Op, invA, invB, sign, Out, Zero, Ofl);

   // declare constant for size of inputs, outputs (N),
   // and operations (O)
   parameter    N = 16;
   parameter    O = 3;

   //# {{data|Operands}}
   input [N-1:0] A;
   //# {{data|Operands}}   
   input [N-1:0] B;
   //# {{data|Operands}}      
   input         Cin;
   //# {{control|Inversion}}
   input         invA;
   //# {{control|Inversion}}
   input         invB;
   //# {{control|OpCode}}
   input [O-1:0] Op;
   //# {{control|Signed}}   
   input         sign;
   //# {{data| Data Out}}
   output [N-1:0] Out;
   //# {{control|Overflow}}   
   output         Ofl;
   //# {{control|ZeroResult}}      
   output         Zero;



   
   wire [N-1:0]  maybeComplementedA;
   wire [N-1:0]  maybeComplementedB;
   assign maybeComplementedA = invA ? ~A : A;
   assign maybeComplementedB = invB ? ~B : B;

   wire [N-1:0]  upperOut;
   wire [N-1:0]  bitwiseand;
   assign bitwiseand = maybeComplementedA & maybeComplementedB;
   wire [N-1:0]  bitwiseor = maybeComplementedA | maybeComplementedB;
   wire [N-1:0]  bitwisexor = maybeComplementedA ^ maybeComplementedB;
   
   wire [N-1:0]  barrelOut;
   wire [N-1:0]  rcaOut;
   wire 	 rcaCOut;

   assign Ofl = Op[2] & 
		(~sign ?
		 rcaCOut : 
		 (maybeComplementedA[N-1] != maybeComplementedB[N-1]) & 
		   ((rcaOut[N-1] != maybeComplementedA[N-1]) || 
		    (rcaOut[N-1] != maybeComplementedB[N-1])));
   
   assign Zero = (Out[N-1:0] & 0) == Out[N-1:0];
   
   
   // Op[2] determines the output of the ALU as a whole.
   mux2_1_16b distributor(
			  // Outputs
			  .Out			(Out[N-1:0]),
			  // Inputs
			  .InA			(barrelOut),
			  .InB			(upperOut),
			  .S			(Op[O-1]));


   mux4_1_16b upperbit(
		       // Outputs
		       .Out		(upperOut),
		       // Inputs
		       .InA		(rcaOut),
		       .InB		(bitwiseand),
		       .InC		(bitwiseor),
		       .InD		(bitwisexor),
		       .S		(Op[1:0]));


   // RCA
   rca_16b adder(
		 // Outputs
		 .S			(rcaOut),
		 .C_out			(rcaCOut),
		 // Inputs
		 .A			(maybeComplementedA),
		 .B			(maybeComplementedB),
		 .C_in			(Cin));
   

   barrelShifter shifter(
			 // Outputs
			 .Out			(barrelOut),
			 // Inputs
			 .In			(maybeComplementedA),
			 .Cnt			(maybeComplementedB[3:0]),
			 .Op			(Op[O-2:0]));
   



    
endmodule

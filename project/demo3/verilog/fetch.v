module fetch(
    //Outputs
    Inst,
    pcplus2,
    err, stall,
    //Inputs
    pcbranch, branch, stallPc,
    clk, rst
    );
    
    output [15:0] Inst;
    output [15:0] pcplus2;
    output err;
    output stall;

    input [15:0] pcbranch;
    input branch;
    input stallPc;
    input clk;
    input rst;
    
    wire [15:0] currPC;         
    wire [15:0] newPC;
    
    assign newPC = branch ? pcbranch : pcplus2;
    //assign stall = 1'b0;
    
    reg_16b  pc(/*AUTOINST*/
               // Outputs
               .outData                 (currPC),
               // Inputs
               .clk                     (clk),
               .rst                     (rst),
               .inData                  (newPC),
               .writeEn                 (~stallPc));//(~DMemDump));
    
    rca_16b pc_plus_2(
                     // Outputs
                     .S                 (pcplus2),
                     //.C_out             (ofl[1]),
                     .C_out             (),
                     // Inputs
                     .A                 (currPC),
                     .B                 (16'b0000_0000_0000_0010),
                     .C_in              (1'b0));
   
    stallmem instructionmem(
                           //Outputs
                           .DataOut             (Inst), 
                           .Done                (), 
                           .Stall               (stall), 
                           .CacheHit            (), 
                           .err                 (err),
                           //Inputs
                           .Addr                (currPC), 
                           .DataIn              (16'b0000_0000_0000_0000), 
                           .Rd                  (1'b1), 
                           .Wr                  (1'b0),
                           .createdump          (1'b0),
                           .clk                 (clk),
                           .rst                 (rst)); 
    //memory2c_align instructionmem(/*AUTOINST*/
    //                       // Outputs
    //                       .data_out            (Inst),
    //                       .err                 (err),
    //                       // Inputs
    //                       .data_in             (16'b0000_0000_0000_0000),
    //                       .addr                (currPC),
    //                       .enable              (1'b1),
    //                       .wr                  (1'b0),
    //                       .createdump          (1'b0),
    //                       .clk                 (clk),
    //                       .rst                 (rst));
                           
endmodule

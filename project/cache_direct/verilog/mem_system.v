/* $Author: karu $ */
/* $LastChangedDate: 2009-04-24 09:28:13 -0500 (Fri, 24 Apr 2009) $ */
/* $Rev: 77 $ */

module mem_system(/*AUTOARG*/
   // Outputs
   DataOut, Done, Stall, CacheHit, err,
   // Inputs
   Addr, DataIn, Rd, Wr, createdump, clk, rst
   );
   
   input [15:0] Addr;
   input [15:0] DataIn;
   input        Rd;
   input        Wr;
   input        createdump;
   input        clk;
   input        rst;
   
   output [15:0] DataOut;
   output Done;
   output Stall;
   output CacheHit;
   output err;

   wire cache_rd;
   wire cache_wr;
   wire cache_en;
   wire [4:0] cache_tag;
   wire [7:0] cache_index;
   wire [2:0] cache_offset;
   wire [15:0] cache_data_in;
   wire cache_comp;

   wire [4:0] cache_tag_out;
   wire [15:0] cache_data_out;
   wire cache_hit;
   wire cache_dirty;
   wire cache_valid;
   wire cache_err;

   wire [15:0] mem_addr;
   wire [15:0] mem_data_in;
   wire mem_rd;
   wire mem_wr;

   wire [15:0] mem_data_out;
   wire mem_err;
   
   assign cache_en = cache_wr | cache_rd;
   assign err = cache_err |mem_err;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter memtype = 0;
   cache #(0 + memtype) c0(// Outputs
                          .tag_out              (cache_tag_out),
                          .data_out             (cache_data_out),
                          .hit                  (cache_hit),
                          .dirty                (cache_dirty),
                          .valid                (cache_valid),
                          .err                  (cache_err),
                          // Inputs
                          .enable               (cache_en),
                          .clk                  (clk),
                          .rst                  (rst),
                          .createdump           (createdump),
                          .tag_in               (cache_tag),
                          .index                (cache_index),
                          .offset               (cache_offset),
                          .data_in              (cache_data_in),
                          .comp                 (cache_comp),
                          .write                (cache_wr),
                          .valid_in             (1'b1));

   four_bank_mem mem(// Outputs
                     .data_out          (mem_data_out),
                     .stall             (),
                     .busy              (),
                     .err               (mem_err),
                     // Inputs
                     .clk               (clk),
                     .rst               (rst),
                     .createdump        (createdump),
                     .addr              (mem_addr),
                     .data_in           (mem_data_in),
                     .wr                (mem_wr),
                     .rd                (mem_rd));

   
   // your code here
   fsm fsm(
           //input
           .data_in(DataIn), .memory_out(mem_data_out), .cache_out(cache_data_out), .addr_in(Addr), .miss_tag(cache_tag_out), 
           .miss_index(Addr[10:3]), .miss_offset(Addr[2:0]), .hit(cache_hit), .valid(cache_valid), .dirty(cache_dirty), .rd(Rd), .wr(Wr), 
           //output
           .cache_tag(cache_tag), .cache_index(cache_index), .cache_offset(cache_offset), 
           .memory_addr(mem_addr), .memory_in(mem_data_in), .cache_in(cache_data_in), .data_out(DataOut), 
           //output signals
           .cache_rd(cache_rd), .cache_wr(cache_wr), .comp(cache_comp), .cache_hit (CacheHit),
           .mem_rd(mem_rd), .mem_wr(mem_wr), .stall(Stall), .done(Done),
           .clk(clk), .rst(rst));


   
endmodule // mem_system

// DUMMY LINE FOR REV CONTROL :9:

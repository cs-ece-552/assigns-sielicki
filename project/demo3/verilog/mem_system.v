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
   wire cache_en_0;
   wire cache_en_1;
   wire [4:0] cache_tag;
   wire [7:0] cache_index;
   wire [2:0] cache_offset;
   wire [15:0] cache_data_in;
   wire cache_comp;

   wire [4:0] cache_tag_out;
   wire [4:0] cache_tag_out_0;
   wire [4:0] cache_tag_out_1;
   wire [15:0] cache_data_out;
   wire [15:0] cache_data_out_0;
   wire [15:0] cache_data_out_1;
   wire cache_hit;
   wire cache_hit_0;
   wire cache_hit_1;
   wire cache_dirty;
   wire cache_dirty_0;
   wire cache_dirty_1;
   wire cache_valid;
   wire cache_valid_0;
   wire cache_valid_1;
   wire [1:0] cache_err;


   wire [3:0] fbm_busy_out;
   wire       fbm_stall_out;
   wire [15:0] mem_addr;
   wire [15:0] mem_data_in;
   wire mem_rd;
   wire mem_wr;

   wire [15:0] mem_data_out;
   wire mem_err;

   wire cache_pick_ws;
   wire cache_pick_reg;
   wire cache_pick;
   wire vway;
   wire ws;
   wire newrw;

   assign cache_en = cache_wr | cache_rd;
   assign err = cache_err[0] | cache_err[1] | mem_err;
   assign cache_tag_out = cache_pick ? cache_tag_out_1 : cache_tag_out_0;
   assign cache_data_out = cache_pick ? cache_data_out_1 : cache_data_out_0;
   assign cache_hit = cache_pick ? cache_hit_1 : cache_hit_0;
   assign cache_dirty = cache_pick ? cache_dirty_1 : cache_dirty_0;
   assign cache_valid = cache_pick ? cache_valid_1 : cache_valid_0;
   assign cache_en_0 = ws | (~cache_pick_reg);
   assign cache_en_1 = ws | (cache_pick_reg);
   assign newrw = ws & (Rd | Wr);
   
   reg_1b victimway(.clk(clk), .rst(rst), .inData(~vway), .writeEn(newrw), .outData(vway));
   reg_1b pickway(.clk(clk), .rst(rst), .inData(cache_pick_ws), .writeEn(ws), .outData(cache_pick_reg));

   assign cache_pick_ws = (cache_hit_0 & cache_valid_0) ? 1'b0 : (
                          (cache_hit_1 & cache_valid_1) ? 1'b1 : (
                          (~cache_valid_0) ? 1'b0 : (
                          (~cache_valid_1) ? 1'b1 : (
                          ~vway))));

   assign cache_pick = ws ? cache_pick_ws : cache_pick_reg;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter memtype = 0;
   cache #(0 + memtype) c0(// Outputs
                          .tag_out              (cache_tag_out_0),
                          .data_out             (cache_data_out_0),
                          .hit                  (cache_hit_0),
                          .dirty                (cache_dirty_0),
                          .valid                (cache_valid_0),
                          .err                  (cache_err[0]),
                          // Inputs
                          .enable               (cache_en_0),
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
   cache #(2 + memtype) c1(// Outputs
                          .tag_out              (cache_tag_out_1),
                          .data_out             (cache_data_out_1),
                          .hit                  (cache_hit_1),
                          .dirty                (cache_dirty_1),
                          .valid                (cache_valid_1),
                          .err                  (cache_err[1]),
                          // Inputs
                          .enable               (cache_en_1),
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
                     .stall             (fbm_stall_out),
                     .busy              (fbm_busy_out),
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
           .clk(clk), .rst(rst), .ws(ws));



   wire _unused_ok = &{1'b0,
		       fbm_stall_out,
		       fbm_busy_out[3:0]
		       };
   
   
endmodule // mem_system

   


// DUMMY LINE FOR REV CONTROL :9:

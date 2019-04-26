module fsm(
           //input
           data_in, memory_out, cache_out, addr_in, miss_tag, miss_index, miss_offset, hit, valid, dirty, rd, wr, 
           clk, rst,
           //output
           cache_tag, cache_index, cache_offset, memory_addr, memory_in, cache_in, data_out, 
           //output signals
           cache_rd, cache_wr, comp, cache_hit, mem_rd, mem_wr, stall, done, ws);

    input[15:0] data_in;
    input[15:0] memory_out;
    input[15:0] cache_out;
    input[15:0] addr_in;

    input[4:0] miss_tag;
    input[7:0] miss_index;
    input[2:0] miss_offset;

    input hit; //cache hit & cache valid
    input valid;
    input dirty; //cache dirty & ~ cache valid
    input rd;
    input wr;

    input clk;
    input rst;

    //addr output
    output[4:0] cache_tag;
    output[7:0] cache_index;
    output[2:0] cache_offset;
    output[15:0] memory_addr;

    //data output
    output [15:0] memory_in;
    output [15:0] cache_in;
    output [15:0] data_out;

    //signal output
    output cache_rd;
    output cache_wr;
    output comp;
    output cache_hit;
    output mem_rd;
    output mem_wr;
    output stall;
    output done;
    output ws;

    wire [15:0] addr_reg;
    wire wr_reg;
    wire rd_reg;
    wire [15:0] data_reg;

    //states
    wire [3:0] curr_state;
    wire [3:0] next_state;

    reg_4b state_reg(.clk(clk), .rst(rst), .inData(next_state),.writeEn(1'b1), .outData(curr_state));

    assign ws = (curr_state == 4'b0000);

    //buffers and data outputs
    wire write_buff_0_en;
    wire [15:0] write_buff_0;
    wire buff_0_to_mem;
    reg_16b write_buffer_0_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(write_buff_0_en), .outData(write_buff_0));

    wire write_buff_1_en;
    wire [15:0] write_buff_1;
    wire buff_1_to_mem;
    reg_16b write_buffer_1_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(write_buff_1_en), .outData(write_buff_1));

    wire write_buff_2_en;
    wire [15:0] write_buff_2;
    wire buff_2_to_mem;
    reg_16b write_buffer_2_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(write_buff_2_en), .outData(write_buff_2));

    wire write_buff_3_en;
    wire [15:0] write_buff_3;
    wire buff_3_to_mem;
    reg_16b write_buffer_3_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(write_buff_3_en), .outData(write_buff_3));

    wire read_buff_0_en;
    wire [15:0] read_buff_0;
    wire buff_0_to_cache;
    reg_16b read_buffer_0_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(read_buff_0_en), .outData(read_buff_0));

    wire read_buff_1_en;
    wire [15:0] read_buff_1;
    wire buff_1_to_cache;
    reg_16b read_buffer_1_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(read_buff_1_en), .outData(read_buff_1));

    wire out_buffer_en;
    wire [15:0] out_buffer;
    wire buff_to_out;
    reg_16b out_buffer_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(out_buffer_en), .outData(out_buffer));

    wire mem_to_cache;
    wire mem_to_out;
    wire data_reg_to_cache;

    assign memory_in = buff_0_to_mem ? write_buff_0 : (
                buff_1_to_mem ? write_buff_1 : (
                buff_2_to_mem ? write_buff_2 : (
                buff_3_to_mem ? write_buff_3 : (
                data_in))));

    assign cache_in  = buff_0_to_cache ? read_buff_0 : (
                buff_1_to_cache ? read_buff_1 : (
                mem_to_cache ? memory_out : (
                data_reg_to_cache ? data_reg : data_in)));

    assign data_out  = mem_to_out ? memory_out : (
                buff_to_out? out_buffer : (
                cache_out));

    //TODODONE when should buffer take from memory/cache?
    assign write_buff_0_en = (curr_state == 4'b1000);
    assign write_buff_1_en = (curr_state == 4'b1001);
    assign write_buff_2_en = (curr_state == 4'b1010);
    assign write_buff_3_en = (curr_state == 4'b1011);
    assign read_buff_0_en = (curr_state == 4'b1010);
    assign read_buff_1_en = (curr_state == 4'b1011);
    assign out_buffer_en  = (((curr_state == 4'b0011) | (curr_state == 4'b1010)) & (addr_reg[2:1] == 2'b00)) |
                            (((curr_state == 4'b0100) | (curr_state == 4'b1011)) & (addr_reg[2:1] == 2'b01)) |
                            (((curr_state == 4'b0101) | (curr_state == 4'b1100)) & (addr_reg[2:1] == 2'b10)) |
                            ((curr_state == 4'b1101) & (addr_reg[2:1] == 2'b11));

    //TODO?
    assign mem_to_cache = ((curr_state == 4'b0011) & (~wr_reg | ~(addr_reg[2:1] == 2'b00))) |
                          ((curr_state == 4'b0100) & (~wr_reg | ~(addr_reg[2:1] == 2'b01))) |
                          ((curr_state == 4'b0101) & (~wr_reg | ~(addr_reg[2:1] == 2'b10))) |
                          ((curr_state == 4'b0110) & (~wr_reg | ~(addr_reg[2:1] == 2'b11))) |
                          ((curr_state == 4'b1100) & (~wr_reg | ~(addr_reg[2:1] == 2'b10))) |
                          ((curr_state == 4'b1101) & (~wr_reg | ~(addr_reg[2:1] == 2'b11)));
                          //((curr_state == 4'b1110) & (~wr_reg | ~(addr_reg[2:1] == 2'b00))) |
                          //((curr_state == 4'b1111) & (~wr_reg | ~(addr_reg[2:1] == 2'b01)));

    assign buff_0_to_mem = (curr_state == 4'b1100);
    assign buff_1_to_mem = (curr_state == 4'b1101);
    assign buff_2_to_mem = (curr_state == 4'b1110);
    assign buff_3_to_mem = (curr_state == 4'b1111);
    assign buff_0_to_cache = ((curr_state == 4'b1110) & (~wr_reg | ~(addr_reg[2:1] == 2'b00)));
    assign buff_1_to_cache = ((curr_state == 4'b1111) & (~wr_reg | ~(addr_reg[2:1] == 2'b01)));
    assign mem_to_out = (curr_state == 4'b0110) & rd_reg & (addr_reg[2:1] == 2'b11);
    assign buff_to_out = rd_reg & (((curr_state == 4'b0110) & ~(addr_reg[2:1] == 2'b11)) | (curr_state == 4'b1111));
    assign data_reg_to_cache = ~(curr_state == 4'b0000);

    //address
    wire [1:0] mem_bank;
    //wire [1:0] cache_bank;
    wire [15:0] miss_addr;
    wire [15:0] miss_reg;
    wire new_addr_en;
    wire miss_addr_en;
    wire addr_in_to_cache;
    wire miss_addr_to_mem;
    wire addr_in_to_mem;

    reg_16b addr_wait_reg(.clk(clk), .rst(rst), .inData(addr_in), .writeEn(new_addr_en), .outData(addr_reg));
    reg_16b miss_wait_reg(.clk(clk), .rst(rst), .inData(miss_addr), .writeEn(miss_addr_en), .outData(miss_reg));
    reg_1b read_reg(.clk(clk), .rst(rst), .inData(rd), .writeEn(new_addr_en), .outData(rd_reg));
    reg_1b write_reg(.clk(clk), .rst(rst), .inData(wr), .writeEn(new_addr_en), .outData(wr_reg));
    reg_16b data_in_reg(.clk(clk), .rst(rst), .inData(data_in), .writeEn(new_addr_en), .outData(data_reg));

    assign miss_addr = {miss_tag, miss_index, miss_offset};

    assign cache_tag = addr_in_to_cache ? addr_in[15:11] : addr_reg[15:11];
    assign cache_index = addr_in_to_cache ? addr_in[10:3] : addr_reg[10:3];
    //TODODONE complete the conditions of the ternary
    assign cache_offset = addr_in_to_cache ? addr_in[2:0] : (
                          ((curr_state == 4'b0011) | (curr_state == 4'b1000) | (curr_state == 4'b1110)) ? {2'b00, addr_reg[0]} : (
                          ((curr_state == 4'b0100) | (curr_state == 4'b1001) | (curr_state == 4'b1111)) ? {2'b01, addr_reg[0]} : (
                          ((curr_state == 4'b0101) | (curr_state == 4'b1010) | (curr_state == 4'b1100)) ? {2'b10, addr_reg[0]} : (
                          ((curr_state == 4'b0110) | (curr_state == 4'b1011) | (curr_state == 4'b1101)) ? {2'b11, addr_reg[0]} : (
                          addr_reg[2:0])))));
    //TODODONE complete the defintions of the terneary
    assign mem_bank =  ((curr_state == 4'b0001) | (curr_state[3] & (curr_state[1:0] == 2'b00))) ? 2'b00 : (
                       ((curr_state == 4'b0010)  | (curr_state[3] & (curr_state[1:0] == 2'b01))) ? 2'b01 : (
                       ((curr_state == 4'b0011)  | (curr_state[3] & (curr_state[1:0] == 2'b10))) ? 2'b10 : (
                       ((curr_state == 4'b0100)  | (curr_state[3] & (curr_state[1:0] == 2'b11))) ? 2'b11 : (
                       miss_addr_to_mem ? miss_reg[2:1] : (
                       addr_in_to_mem ? addr_in[2:1] : (
                       addr_reg[2:1] ))))));
    assign memory_addr = miss_addr_to_mem ? {miss_reg[15:3], mem_bank, miss_reg[0]} : (
                      addr_in_to_mem ? {addr_in[15:3], mem_bank, addr_in[0]} : (
                      {addr_reg[15:3], mem_bank, addr_reg[0]}));


    //TODODONE these two signals should be 1 when we're at wait state, 0 otherwise
    assign new_addr_en = (curr_state == 4'b0000);
    assign addr_in_to_cache = (curr_state == 4'b0000);

    //TODODONE when should this signal be active?
    assign miss_addr_en = (curr_state[3:2] == 2'b10);
    assign miss_addr_to_mem = (curr_state[3:2] == 2'b11);
    assign addr_in_to_mem = 1'b0; //pretty sure this is always 0

    //the fsm logic 
                        //wait_state
    assign next_state = (curr_state == 4'b0000) ? (
                            ((~rd & ~wr) | (hit & valid)) ? 4'b0000 : (
                            dirty ? 4'b1000 : 4'b0001)) : (
                        //clean reads or writes
                        (curr_state == 4'b0001) ? 4'b0010 : (
                        (curr_state == 4'b0010) ? 4'b0011 : (
                        (curr_state == 4'b0011) ? 4'b0100 : (
                        (curr_state == 4'b0100) ? 4'b0101 : (
                        (curr_state == 4'b0101) ? 4'b0110 : (
                        (curr_state == 4'b0110) ? 4'b0000 : (
                        //dirty reads or writes
                        (curr_state == 4'b1000) ? 4'b1001 : (
                        (curr_state == 4'b1001) ? 4'b1010 : (
                        (curr_state == 4'b1010) ? 4'b1011 : (
                        (curr_state == 4'b1011) ? 4'b1100 : (
                        (curr_state == 4'b1100) ? 4'b1101 : (
                        (curr_state == 4'b1101) ? 4'b1110 : (
                        (curr_state == 4'b1110) ? 4'b1111 : (
                        (curr_state == 4'b1111) ? 4'b0000 : ( 
                        //err state
                        4'b0111)))))))))))))));

    //TODODONE when should (at what state) this signals be 1 or 0
    assign cache_rd = ((curr_state == 4'b0000) & rd) |
                      (curr_state[3:2] == 2'b10);
    assign cache_wr = ((curr_state == 4'b0000) & wr) |
                      (curr_state == 4'b0011) |
                      (curr_state[3:2] == 2'b01) |
                      (curr_state[3:2] == 2'b11);
    assign comp = (curr_state == 4'b0000) | ((curr_state == 4'b1111) & wr_reg) | ((curr_state == 4'b0110) & wr_reg);
    assign mem_rd = (curr_state == 4'b0001) |
                    (curr_state[3:1] == 3'b001) |
                    (curr_state == 4'b0100) |
                    (curr_state[3:2] == 2'b10);
    assign mem_wr = (curr_state[3:2] == 2'b11);
    assign stall = ~((curr_state == 4'b0000) & ((~rd & ~wr) | (hit & valid)));
    assign done = ((curr_state == 4'b0000) & ((rd | wr) & (hit & valid))) |
                  //((curr_state == 4'b0011) & (cache_offset[2:1] == addr_reg[2:1])) |
                  //((curr_state[3:2] == 2'b01) & (cache_offset[2:1] == addr_reg[2:1])) |
                  (curr_state == 4'b0110) |
                  //((curr_state[3:1] == 3'b101) & (cache_offset[2:1] == addr_reg[2:1])) |
                  //((curr_state[3:1] == 3'b110) & (cache_offset[2:1] == addr_reg[2:1]));
                  (curr_state == 4'b1111);
    assign cache_hit = (rd | wr) & (hit & valid) & (curr_state == 4'b0000);

endmodule

input[15:0] data_in;
input[15:0] memory_out;
input[15:0] cache_out;
input[15:0] addr_in;

input[4:0} miss_tag;
input[7:0] miss_index;
input[2:0] miss_offset;

input hit; //cache hit & cache valid
input dirty; //cache dirty & ~ cache valid

//addr output
output[4:0] cache_tag;
output[7:0] cache_index;
output[2:0] cache_offset;
output[15:0] memory_addr;

//data output
output [15:0] memory_in;
output [15:0] cache_in;

//signal output
output cache_rd;
output cache_wr;
output comp;
output mem_rd;
output mem_wr;

//states
wire [3:0] curr_state;
wire [3:0] next_state;

reg_4b state_reg(.clk(clk), .rst(rst), .inData(next_state),.writeEn(1'b1), .outData(curr_state));

//buffers and data outputs
wire write_buff_0_en;
wire [15:0] write_buff_0;
wire buff_0_to_mem;
reg_16b write_buffer_0_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(write_buff_0_en), .outData(write_buff_0));

wire write_buff_1_en;
wire [15:0] write_buff_1;
wire buff_1_to_mem;
reg_16b write_buffer_1_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(write_buff_1_en), .outData(write_buff_1));

wire write_buff_2_en;
wire [15:0] write_buff_2;
wire buff_2_to_mem;
reg_16b write_buffer_2_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(write_buff_2_en), .outData(write_buff_2));

wire write_buff_3_en;
wire [15:0] write_buff_3;
wire buff_3_to_mem;
reg_16b write_buffer_3_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(write_buff_3_en), .outData(write_buff_3));

wire read_buff_0_en;
wire [15:0] read_buff_0;
wire buff_0_to_cache;
reg_16b read_buffer_0_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(read_buff_0_en), .outData(read_buff_0));

wire read_buff_1_en;
wire [15:0] read_buff_1;
wire buff_1_to_cache;
reg_16b read_buffer_1_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(read_buff_1_en), .outData(read_buff_1));

wire mem_to_cache;

memory_in = buff_0_to_mem ? write_buff_0 : (
            buff_1_to_mem ? write_buff_1 : (
            buff_2_to_mem ? write_buff_2 : (
            buff_3_to_mem ? write_buff_3 : (
            data_in))))

cache_in  = buff_0_to_cache ? read_buff_0 : (
            buff_1_to_cache ? read_buff_1 : (
            mem_to_cache ? memory_out : (
            data_in)))

//TODO when should buffer take from memory/cache?
assign write_buff_0_en = 
assign write_buff_1_en =
assign write_buff_2_en =
assign write_buff_3_en =
assign read_buff_0_en =
assign read_buff_1_en =

//TODO when should memory write to cache directly?
assign mem_to_cache =

//addresses
wire [1:0] mem_bank;
//wire [1:0] cache_bank;
wire [15:0] addr_reg;
wire [15:0] miss_addr;
wire [15:0] miss_reg;
wire new_addr_en;
wire miss_addr_en;
wire addr_in_to_cache;
wire miss_addr_to_mem;
wire addr_in_to_mem;

reg_16b addr_wait_reg(.clk(clk), .rst(rst), .inData(addr_in), .writeEn(new_addr_en), .outData(addr_reg));
reg_16b miss_wait_reg(.clk(clk), .rst(rst), .inData(miss_adr), .writeEn(miss_addr_en), .outData(miss_reg));


assign miss_addr = {miss_tag, miss_index, miss_offset};

assign cache_tag = addr_in_to_cache ? addr_in[15:11] : addr_reg[15:11];
assign cache_index = addr_in_to_cache ? addr_in[10:3] : addr_reg[10:3];
//TODO complete the conditions of the ternary
assign cache_offset = addr_in_to_cache ? addr_in[2:0] : (
                      states when we use cache_bank 0     ? {2'b00, addr_reg[2:0]} : (
                      states when we use cache_bank 1     ? {2'b01, addr_reg[2:0]} : (
                      states when we use cache_bank 2     ? {2'b10, addr_reg[2:0]} : (
                      states when we use cache_bank 3     ? {2'b11, addr_reg[2:0]}:: (
                      addr_reg{2:0])))));
//TODO complete the defintions of the terneary
assign mem_bank =  states we use mem_bank 0 ? 2'b00 : (
                   states we use mem_bank 1 ? 2'b00 : (
                   states we use mem_bank 2 ? 2'b00 : (
                   states we use mem_bank 3 ? 2'b00 : (
                   miss_addr_in_to_mem ? miss_reg[2:1] : (
                   addr_in_to_mem ? addr_in[2:1] : (
                   addr_reg[2:1] ))))));
assign mem_addr = miss_addr_in_to_mem ? {miss_reg[15:3], mem_bank, miss_reg[0]} : (
                  addr_in_to_mem ? {addr_in{15:3], mem_bank, addr_in[0]} : (
                  {addr_reg[15:3], mem_bank, addr_reg[0]}));


//TODO these two signals should be 1 when we're at wait state, 0 otherwise
assign new_addr_en = (1 when it's wait state);
assign addr_in_to_cache = (1 when it's wait state);

//TODO when should this signal be active?
assign miss_addr_en = 
assign miss_addr_to_mem = 
assign addr_in_to_mem = 1'b0; //pretty sure this is always 0

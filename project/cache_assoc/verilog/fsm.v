
input[15:0] data_in;
input[15:0] memory_out;
input[15:0] cache_out;

output[4:0] cache_tag;
output[7:0] cache_index;
output[2:0] cache_offset;
output[15:0] memory_addr;

output [15:0] memory_in;
output [15:0] cache_in;

wire [3:0] curr_state;
wire [3:0] next_state;

reg_4b rstreg(.clk(clk), .rst(rst), .inData(next_state),.writeEn(1'b1), .outData(curr_state));

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

wire write_buff_4_en;
wire [15:0] write_buff_4;
wire buff_4_to_mem;
reg_16b write_buffer_4_reg(.clk(clk), .rst(rst), .inData(memory_out),.writeEn(write_buff_4_en), .outData(write_buff_4));

wire read_buff_1_en;
wire [15:0] read_buff_1;
wire buff_1_to_cache;
reg_16b read_buffer_1_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(read_buff_1_en), .outData(read_buff_1));

wire read_buff_2_en;
wire [15:0] read_buff_2;
wire buff_2_to_cache;
reg_16b read_buffer_2_reg(.clk(clk), .rst(rst), .inData(cache_out),.writeEn(read_buff_2_en), .outData(read_buff_2));

wire mem_to_cache;

memory_in = buff_0_to_mem ? write_buff_0 : (
            buff_1_to_mem ? write_buff_1 : (
            buff_2_to_mem ? write_buff_2 : (
            buff_3_to_mem ? write_buff_3 : (
            something_else))))

cache_in  = buff_0_to_cache ? read_buff_0 : (
            buff_1_to_cache ? read_buff_1 : (
            mem_to_cache ? memory_out : (
            data_in)))




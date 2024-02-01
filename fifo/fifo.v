module fifo(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
 input clk, reset_n, rd_en, wr_en;
 input [31:0] d_in;
 
 output [31:0] d_out;
 output full, empty, wr_ack, wr_err, rd_ack, rd_err;
 output [3:0] data_count;
 
 wire [2:0] next_state;
 wire [2:0] state;
 wire [2:0] head, tail;
 wire we, re;
 
 wire [2:0] next_head, next_tail;
 wire [3:0] next_data_count;
 wire [31:0] w_d_out1;
 wire [31:0] w_d_out2;
 
 //next state logic
 fifo_ns ns_0(.wr_en(wr_en), .rd_en(rd_en), .state(state), .data_count(data_count), .next_state(next_state));
 
 //calculate address logic
 fifo_cal cal_0(.state(next_state), .head(head), .tail(tail), .data_count(data_count), .we(we), .re(re), .next_head(next_head), .next_tail(next_tail), .next_data_count(next_data_count));

 
 //state register
 _register3_r r_state(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
 
 //data_count register
 _register4_r r_count(.clk(clk), .reset_n(reset_n), .d(next_data_count), .q(data_count));
 
 //head register
 _register3_r r_head(.clk(clk), .reset_n(reset_n), .d(next_head), .q(head));
 
 //tail register
 _register3_r r_tail(.clk(clk), .reset_n(reset_n), .d(next_tail), .q(tail));
 
 
 //register logic
 Register_file RF_0(.clk(clk), .reset_n(reset_n), .wAddr(tail), .wData(d_in), .we(we), .rAddr(head), .rData(w_d_out1));
 _2_to_1_MUX mx2_0(.a(w_d_out1), .b(32'h0), .s(re), .y(w_d_out2));
 register32 re32_0(.clk(clk), .reset_n(reset_n), .d(w_d_out2), .q(d_out));
 
 //output file
 fifo_out out_0(.state(state), .data_count(data_count), .full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err));
 
endmodule

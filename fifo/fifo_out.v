module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err); //Output logic module
  input [2:0] state;
  input [3:0] data_count;
  output full, empty, wr_ack, wr_err, rd_ack, rd_err;
  reg full, empty, wr_ack, wr_err, rd_ack, rd_err;
  
  parameter INIT=3'b000;
  parameter WRITE=3'b001;
  parameter READ=3'b010;
  parameter NO_OP=3'b011;
  parameter WR_ERR=3'b101;
  parameter RD_ERR=3'b110;
  
  always@(state, data_count) begin
  casex({state, data_count})
    {INIT, 4'bx}: begin full<=0; empty<=1; wr_ack<=0; wr_err<=0; rd_ack<=0; rd_err<=0; end
	 {WRITE, 4'b0XXX}: begin full<=0; empty<=0; wr_ack<=1; wr_err<=0; rd_ack<=0; rd_err<=0; end
	 {WRITE, 4'b1000}: begin full<=1; empty<=0; wr_ack<=0; wr_err<=1; rd_ack<=0; rd_err<=0; end
    {READ, 4'bXXX1}: begin full<=0; empty<=0; wr_ack<=0; wr_err<=0; rd_ack<=1; rd_err<=0; end
	 {READ, 4'b0000}: begin full<=0; empty<=1; wr_ack<=0; wr_err<=0; rd_ack<=0; rd_err<=1; end
    {NO_OP, 4'b0000}: begin full<=0; empty<=1; wr_ack<=0; wr_err<=0; rd_ack<=0; rd_err<=0; end
	 {NO_OP, 4'b1000}: begin full<=1; empty<=0; wr_ack<=0; wr_err<=0; rd_ack<=0; rd_err<=0; end
	 {WR_ERR, 4'b1000}: begin full<=1; empty<=0; wr_ack<=0; wr_err<=1; rd_ack<=0; rd_err<=0; end
	 {RD_ERR, 4'b0000}: begin full<=0; empty<=1; wr_ack<=0; wr_err<=0; rd_ack<=0; rd_err<=1; end
  endcase
  end
  
endmodule

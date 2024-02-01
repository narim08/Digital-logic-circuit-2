module fifo_ns(wr_en, rd_en, state, data_count, next_state); //next state module
  input wr_en, rd_en;
  input [2:0] state;
  input [3:0] data_count;
  output [2:0] next_state;
  reg [2:0] next_state;
 
  parameter INIT=3'b000;
  parameter WRITE=3'b001;
  parameter READ=3'b010;
  parameter NO_OP=3'b011;
  parameter WR_ERR=3'b101;
  parameter RD_ERR=3'b110;
 
  always@(wr_en, rd_en, state, data_count)
  begin
  case(state)
  INIT: begin
    if(rd_en) begin next_state = RD_ERR; end
	 else if(wr_en) begin next_state = WRITE; end
	 else begin next_state = INIT; end
  end
  WRITE: begin
    if(wr_en) begin
      if(data_count==4'b1000) begin next_state = WR_ERR; end
      else begin next_state = WRITE; end
	 end
	 else if(rd_en) begin next_state = READ; end
	 else begin next_state = NO_OP; end
  end
  READ: begin
    if(rd_en) begin
	   if(data_count==4'b0000) begin next_state = RD_ERR; end
	   else begin next_state = READ; end
	 end
	 else if(wr_en) begin next_state = WRITE; end
	 else begin next_state = NO_OP; end
  end
  NO_OP: begin
    if(wr_en) begin next_state = WRITE; end
    if(rd_en) begin next_state = READ; end
  end
  WR_ERR: begin
    if(wr_en==0) begin
      if(rd_en) begin next_state = READ; end
    end
	 if(wr_en) begin next_state = WR_ERR; end
  end
  RD_ERR: begin
    if(rd_en==0) begin
	   if(wr_en) begin next_state = WRITE; end
	 end
	 if(rd_en) begin next_state = RD_ERR; end
  end
  default: next_state = 3'bx;
  endcase
  end
 
endmodule

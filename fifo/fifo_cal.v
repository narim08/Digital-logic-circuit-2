module fifo_cal(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count); //Calculate address module
  input [2:0] state, head, tail;
  input [3:0] data_count;
  output we, re;
  output [2:0] next_head, next_tail;
  output [3:0] next_data_count;
  
  reg we, re;
  reg [2:0] next_head, next_tail;
  reg [3:0] next_data_count;
  
  parameter INIT=3'b000;
  parameter WRITE=3'b001;
  parameter READ=3'b010;
  parameter NO_OP=3'b011;
  parameter WR_ERR=3'b101;
  parameter RD_ERR=3'b110;
  
  
  always@(state, head, tail, data_count) begin
  case(state)
  INIT: begin next_head<=3'b0; next_tail<=3'b0; next_data_count<=4'b0; we<=0; re<=0; end
  WRITE: begin next_head<=head; next_tail<=(tail+1); next_data_count<=(data_count+1); we<=1; re<=0; end 
  READ: begin next_head<=(head+1); next_tail<=tail; next_data_count<=(data_count-1); we<=0; re<=1; end
  NO_OP: begin next_head<=head; next_tail<=tail; next_data_count<=data_count; we<=0; re<=0; end
  WR_ERR: begin next_head<=head; next_tail<=tail; next_data_count<=data_count; we<=0; re<=0; end
  RD_ERR: begin next_head<=head; next_tail<=tail; next_data_count<=data_count; we<=0; re<=0; end 
  endcase
  end
  
endmodule

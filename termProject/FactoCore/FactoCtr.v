module FactoCtr(clk, reset_n, op_start, op_clear, oper, op_done, result);
  input clk, reset_n;
  input op_start, op_clear;
  input signed [63:0] oper;
  output op_done;
  output signed [127:0] result;
  
  reg [1:0] state, next_state;
  reg signed [63:0] operand, next_operand;
  reg signed [63:0] sub_operand, next_sub_operand;
  reg signed [127:0] result, next_result;
  reg signed [63:0] sel_result, next_sel_result;
  reg op_done, next_op_done;
  reg clear, next_clear;
  
  wire mul_done;
  wire signed [127:0] m_result;
  
  
  //Encoded state
  parameter IDLE = 2'b00;
  parameter START = 2'b01;
  parameter DONE = 2'b10;
  
  //instance
  multiplier Bmul(.clk(clk),.reset_n(reset_n),.op_start(op_start),.op_clear(clear),.multiplicand(operand),.multiplier(sel_result),.op_done(mul_done),.result(m_result));
  
  
  //Sequential circuit part
  always @ (posedge clk or negedge reset_n or posedge op_clear) 
  begin
  if(!reset_n || op_clear)
  begin
    state <= IDLE;
    operand <= 64'd0;
	 result <= 128'd0;
	 sel_result <= 64'd0;
	 op_done <= 1'b0;
	 clear <= 1'b1;
	 sub_operand <= 64'd0;
  end
  else
  begin
    state <= next_state;
    operand <= next_operand;
	 result <= next_result;
	 sel_result <= next_sel_result;
	 op_done <= next_op_done;
	 clear <= next_clear;
	 sub_operand <= next_sub_operand;
  end
  end
  
  
  //combinational circuit part
  always @ (*) //state output generation
  begin 
  case(state)
  IDLE:
  begin
    next_op_done = 1'b0;
    if(op_start) begin //state transition
      next_state = START;
      next_sel_result = (operand-1);
		next_result = m_result;
		next_sub_operand = sub_operand;
		next_clear = 1'b0;
    end
    else begin
      next_state = IDLE;
      next_result = 128'd0;
		next_operand = oper;
		next_sub_operand = (oper-1);
		next_clear = 1'b1;
    end
  end
  
  START:
  begin
    if(operand==64'd1) begin //factorial end
	   next_state = DONE;
		next_result = result;
		next_operand = operand;
		next_sub_operand = sub_operand;
		next_sel_result = sel_result;
		next_op_done = 1'b1;
		next_clear = 1'b0;
	 end
	 
	 else if(mul_done==1'b1) begin //1 mul end
	   next_op_done = 1'b0;
	   next_state = state;
		next_operand = (sub_operand-1);
	   next_result = m_result;
		next_sub_operand = (sub_operand-1);
		if(next_result[63:0] == 64'd0) begin
		  next_sel_result = m_result[127:64]; //operand x result_h
		end
		else begin
		  next_sel_result = m_result[63:0]; //operand x result_l
		end
		
		if(next_operand==64'd1) begin
		  next_clear = 1'b0;
		end
		else begin
		next_clear = 1'b1;
		end
	 end
		
	 else begin
	   next_op_done = 1'b0;
		next_state = state;
		next_clear = 1'b0;
		next_operand = operand;
		next_sub_operand = sub_operand;
	   next_result = result;
		next_sel_result = sel_result;
    end
  end
	 
  DONE: //factorial end
  begin
    next_state = state;
	 next_operand = operand;
	 next_sub_operand = sub_operand;
	 next_result = result;
	 next_sel_result = sel_result;
	 next_op_done = op_done;
	 next_clear = clear;
  end
  
  endcase
  end

endmodule
  
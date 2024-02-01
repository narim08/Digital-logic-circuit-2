module multiplier(clk,reset_n,op_start,op_clear,multiplicand,multiplier,op_done,result);
  input clk, reset_n;
  input op_start, op_clear;
  input signed [63:0] multiplicand, multiplier;
  output signed [127:0] result;
  output op_done;

  reg [127:0] result,next_result,result_temp;
  reg [1:0] temp,next_temp;
  reg signed [7:0] count,next_count;
  reg [1:0] next_state, state;
  reg op_done, next_op_done;

  wire [63:0] addRes, subRes;
  
  
  //Encoded state
  parameter IDLE = 2'b00;
  parameter START = 2'b01;
  parameter DONE = 2'b10;
  
  
  //CLA instance
  cla64 add_cla(.a(result[127:64]), .b(multiplicand), .ci(1'b0), .s(addRes), .co());
  cla64 sub_cla(.a(result[127:64]), .b(~multiplicand), .ci(1'b1), .s(subRes), .co());

	
  //Sequential circuit part
  always @ (posedge clk or negedge reset_n or posedge op_clear) 
  begin
  if(!reset_n || op_clear)
  begin
    result <= 128'd0;
    op_done <= 1'b0;
    state <= IDLE;
    temp <= 2'b0;
    count <= 8'd0;
  end
  else
  begin
    result <= next_result;
    op_done <= next_op_done;
    state <= next_state;
    temp <= next_temp;
    count <= next_count;
  end
  end

  
  //combinational circuit part
  always @ (*) //state output generation
  begin 
  case(state)
  IDLE:
  begin
    next_count = 8'd0;
    next_op_done = 1'b0;
    if(op_start) begin //state transition
      next_state = START;
      next_temp  = {multiplier[0], 1'b0};
      next_result = {64'd0, multiplier};
    end
    else begin
      next_state = IDLE;
      next_temp  = 2'b0;
      next_result = 128'd0;
    end
  end

  START:
  begin
    case(temp)
    2'b10: result_temp = {subRes, result[63:0]};
    2'b01: result_temp = {addRes, result[63:0]};
    default: result_temp = {result[127:64], result[63:0]};
    endcase
    next_temp = {multiplier[count+1], multiplier[count]};
    next_count = count+1;
    next_result = result_temp >>> 1; //ASR
    next_op_done = (next_count[7:0]==8'b01000000) ? 1'b1 : 1'b0;
	 if(next_op_done == 1) begin next_state = DONE; end //state transition
    else begin next_state = state; end
  end
  
  DONE:
  begin
    next_temp = temp;
	 next_count = count;
	 next_result = result;
	 next_op_done = op_done;
	 next_state = state;
  end
  
  endcase
  end
  
  endmodule
  
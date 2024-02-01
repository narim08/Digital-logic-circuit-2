module ns_logic(load, inc, state, next_state); //next_state logic
  parameter IDLE_STATE = 3'b000;
  parameter LOAD_STATE = 3'b001;
  parameter INC_STATE = 3'b010;
  parameter INC2_STATE = 3'b011;
  parameter DEC_STATE = 3'b100;
  parameter DEC2_STATE = 3'b101;
  
  input load, inc;
  input [2:0] state;
  output [2:0] next_state;
  reg [2:0] next_state;
  
  always@(load, inc, state)
  begin
  case(state)
  IDLE_STATE: begin 
    if(load) begin next_state = LOAD_STATE; end
    else if(inc) begin next_state = INC_STATE; end
	 else begin next_state = DEC_STATE; end
  end
  LOAD_STATE: begin 
    if(load) begin next_state = LOAD_STATE; end
    else if(inc) begin next_state = INC_STATE; end
	 else begin next_state = DEC_STATE; end
  end
  INC_STATE: begin
    if(load) begin next_state = LOAD_STATE; end
    else if(inc) begin next_state = INC2_STATE; end
	 else begin next_state = DEC_STATE; end
  end
  INC2_STATE: begin
    if(load) begin next_state = LOAD_STATE; end
    else if(inc) begin next_state = INC_STATE; end
	 else begin next_state = DEC_STATE; end
  end
  DEC_STATE: begin
    if(load) begin next_state = LOAD_STATE; end
    else if(inc) begin next_state = INC_STATE; end
	 else begin next_state = DEC2_STATE; end
  end
  DEC2_STATE: begin
    if(load) begin next_state = LOAD_STATE; end
    else if(inc) begin next_state = INC_STATE; end
	 else begin next_state = DEC_STATE; end
  end
  default: next_state = 3'bx;
  endcase
  end
  
endmodule
  
module os_logic(state, d_in, d_out);
  parameter IDLE_STATE = 3'b000;
  parameter LOAD_STATE = 3'b001;
  parameter INC_STATE = 3'b010;
  parameter INC2_STATE = 3'b011;
  parameter DEC_STATE = 3'b100;
  parameter DEC2_STATE = 3'b101;
  
  input [2:0] state;
  input [7:0] d_in;
  output [7:0] d_out;
  reg [7:0] d_out;
  
  wire [7:0] d_inc;
  wire [7:0] d_dec;
  
  always@(state, d_in) begin
  case(state)
  IDLE_STATE: d_out<=8'h00;
  LOAD_STATE: d_out<=d_in;
  INC_STATE: d_out<=(d_inc+1);
  INC2_STATE: d_out<=(d_inc+1);
  DEC_STATE: d_out<=d_dec+1;
  DEC2_STATE: d_out<=d_dec+1;
  default: d_out<=8'hx;
  endcase
  end
  
  //instance
  cla8 c8_0(.a(d_in), .b(d_out), .ci(1'b0), .s(d_inc), .co());
  cla8 c8_1(.a(d_in), .b(d_out), .ci(1'b0), .s(d_dec), .co());
  
endmodule

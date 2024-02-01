module cntr8(clk, reset_n, load, inc, d_in, d_out, o_state); //8-bit loadable up/down counter
  input clk, reset_n, load, inc;
  input [7:0] d_in; //data in
  output [7:0] d_out; //data out
  output [2:0] o_state; //current state
  
  wire [2:0] next_state;
  wire [2:0] state;
  
  assign o_state = state;
  
  //instance of register, next_state logic, output logic
  ns_logic ns_0(.load(load), .inc(inc), .state(state), .next_state(next_state));
  _register3_r r3_0(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
  os_logic os_0(.state(state), .d_in(d_in), .d_out(d_out));
  
endmodule
  
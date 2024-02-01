module shifter8(clk, reset_n, op, shamt, d_in, d_out); //8-bit loadable shifter
  input clk, reset_n;
  input [2:0] op;
  input [1:0] shamt;
  input [7:0] d_in;
  output [7:0] d_out;
  wire [7:0] d_next;
  
  //8-bits register, combinational circuit instance
  cc_logic cl_0(.op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out), .d_next(d_next));
  _register8_r r8_0 (.clk(clk), .reset_n(reset_n), .d(d_next), .q(d_out));
  
endmodule

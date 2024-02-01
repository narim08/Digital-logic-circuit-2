`timescale 1ns/100ps

module tb_cntr8;
  reg clk, reset_n, load, inc;
  reg [7:0] d_in; //data in
  wire [7:0] d_out; //data out
  wire [2:0] o_state; //current state
  
  //instance
  cntr8 cn8_0(.clk(clk), .reset_n(reset_n), .load(load), .inc(inc), .d_in(d_in), .d_out(d_out), .o_state(o_state));
  
  //clock cycle
  always begin
  #5 clk = ~clk;
  end
  
  
  initial begin
  #6; clk=0; reset_n=0; load=0; d_in=8'h0; inc=0; //reset
  #10; reset_n=1; inc=1; //inc
  #30; inc=0; //dec
  #5; load=1; d_in=8'hfa;
  #10; load=0; inc=1; //inc
  #10; inc=0; reset_n=0; //reset, dec
  #10; reset_n=1;
  #30; $finish;
  end
  
endmodule

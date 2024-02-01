`timescale 1ns/100ps

module tb_multiplier;
  reg clk, reset_n;
  reg op_start, op_clear;
  reg signed [63:0] multiplicand, multiplier;
  wire signed [127:0] result;
  wire op_done;
  
  //instance
  multiplier mtp_0(.clk(clk),.reset_n(reset_n),.op_start(op_start),.op_clear(op_clear),.multiplicand(multiplicand),.multiplier(multiplier),.op_done(op_done),.result(result));
  
  //clock cycle
  always begin
   #5 clk = ~clk;
  end
  
  initial begin
  clk=0; reset_n=0; op_start=0; op_clear=0; multiplicand=64'd0; multiplier=64'd0;
  #11; reset_n=1; op_start=1; multiplicand=5; multiplier=-7;
  #660; op_start=0;
  #20; op_clear=1;
  #20; op_start=1; op_clear=0; multiplicand=10; multiplier=25;
  #30; op_start=0; op_clear=1;
  #10; op_start=1; op_clear=0;
  #660;
  #20; $finish;
  end
  
  
endmodule

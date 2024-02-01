`timescale 1ns/100ps

module tb_FactoCtr;
  reg clk, reset_n;
  reg op_start, op_clear;
  reg signed [63:0] oper;
  wire op_done;
  wire signed [127:0] result;
  
  //instance
  FactoCtr fctr_inst(.clk(clk), .reset_n(reset_n), .op_start(op_start), .op_clear(op_clear), .oper(oper), .op_done(op_done), .result(result));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  
  initial begin
  clk=0; reset_n=0; op_start=0; op_clear=0; oper=64'd0;
  #7; reset_n=1;
  #20; oper=64'd7; //7!
  #50; op_start=1;
  #3600; op_start=0;
  #20; op_clear=1;
  #20; $finish;
  
  
  end
  
  
endmodule

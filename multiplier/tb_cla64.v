`timescale 1ns/100ps

module tb_cla64;
  reg clk;
  reg signed [63:0] a, b;
  reg ci;
  wire signed [63:0] s;
  
  //instance
  cla64 c_inst(.a(a), .b(b), .ci(ci), .s(s));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; a=64'd0; b=64'd0; ci=0;
  #11; a=7; b=5; //add
  #10; b=~b; ci=1; //sub (7-5)
  #10; ci=0; a=814; b=1220; //add
  #10; b=~b; ci=1; //sub (814-1220)
  #10; ci=0; a=110080; b=20070; //add
  #10; b=~b; ci=1; //sub (110080-20070)
  #20; $finish;
  end
  
endmodule

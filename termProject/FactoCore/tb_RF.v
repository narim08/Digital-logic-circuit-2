`timescale 1ns/100ps

module tb_RF;
  reg clk, reset_n, we;
  reg [7:0] wAddr, rAddr;
  reg [63:0] wData;
  wire [63:0] rData;

  //instance
  RF rf_0(.clk(clk), .reset_n(reset_n), .wAddr(wAddr), .wData(wData), .we(we), .rAddr(rAddr), .rData(rData));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  
  initial begin
  clk=0; reset_n=0; we=0; wAddr=8'h0; rAddr=8'h0; wData=64'h0;
  #7; reset_n=1; we=1; wData=64'h0000_0000_0000_0001; //op_start
  #10; wAddr=8'h08; wData=64'h0000_0000_0000_0000; //opclear
  #10; wAddr=8'h10; wData=64'h0000_0000_0000_0000; //opdone
  
  #10; wAddr=8'h18; wData=64'h0000_0000_0000_0001; //intrEn
  
  #10; wAddr=8'h20; wData=64'd7; //operand
  #10; wAddr=8'h28; wData=64'd0; //result_h
  #10; wAddr=8'h30; wData=64'd42; //result_l
  
  #10; we=0; //Read
  #10; rAddr=8'h10; //opdone
  #10; rAddr=8'h18; //intrEn
  #10; rAddr=8'h20; //operand
  #10; rAddr=8'h30; //result_l
  #20; $finish;
  end
  
endmodule

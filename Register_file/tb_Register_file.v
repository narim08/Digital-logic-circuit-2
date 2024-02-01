`timescale 1ns/100ps

module tb_Register_file;
  reg clk, reset_n, we;
  reg [2:0] wAddr, rAddr;
  reg [31:0] wData;
  wire [31:0] rData;

  //instance
  Register_file RF_0(.clk(clk), .reset_n(reset_n), .wAddr(wAddr), .wData(wData), .we(we), .rAddr(rAddr), .rData(rData));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  
  initial begin
  clk=0; reset_n=0; we=0; wAddr=3'b000; rAddr=3'b000; wData=32'h0000_0000;
  #7; reset_n=1; we=1; wData=32'h1111_0000; 
  #10; wAddr=001; wData=32'habcd_1234;
  #10; wAddr=010; 
  #10; wAddr=011; wData=32'hffff_9999;
  #10; we=0;
  #10; rAddr=001;
  #10; rAddr=010;
  #10; rAddr=011;
  #20; $finish;
  end
  
endmodule

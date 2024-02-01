`timescale 1ns/100ps

module tb_bus_addr;
  reg clk, reset_n;
  reg [7:0] addr;
  wire s0_sel, s1_sel;
  
  //instance
  bus_addr br_0(.addr(addr), .s0_sel(s0_sel), .s1_sel(s1_sel));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; reset_n=0; addr=8'h0;
  #7; reset_n=1;   //s0_sel = 1
  #20; addr=8'h01;
  #10; addr=8'h02;
  #10; addr=8'h03;
  #10; addr=8'h10;
  #10; addr=8'h1F;
  
  #10; addr=8'h20; //s1_sel = 1
  #10; addr=8'h21;
  #10; addr=8'h23;
  #10; addr=8'h36;
  #10; addr=8'h3F;
  #10; addr=8'h40; //s0_sel, s1_sel = 0
  #10; $finish;
  end
  
endmodule
  
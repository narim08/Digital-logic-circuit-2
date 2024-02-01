`timescale 1ns/100ps

module tb_FactoCore;
  reg clk, reset_n;
  reg s_sel, s_wr;
  reg [15:0] s_addr;
  reg [63:0] s_din;
  
  wire [63:0] s_dout;
  wire interrupt;

  
  //instance
  FactoCore fcore_inst(clk,reset_n,s_sel,s_wr,s_addr,s_din,s_dout,interrupt);
  
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  
  initial begin
  clk=0; reset_n=0; s_sel=0; s_wr=0; s_addr=16'h0; s_din=64'h0;
  #11; s_addr=16'h7020; s_din=64'd7; //operand 7 write (7!)
  #20; s_addr=16'h7018; s_din=64'd1; //intrEn 1 write
  #20; reset_n=1; s_sel=1; s_addr=16'h7000; s_din=64'd1; s_wr=1; //opstart 1 write
  #4000; $finish;
  
  
  end
  
  
endmodule

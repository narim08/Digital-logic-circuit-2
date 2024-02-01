`timescale 1ns/100ps

module tb_bus;
  reg clk, reset_n;
  reg m0_req, m0_wr, m1_req, m1_wr;
  reg [7:0] m0_address, m1_address;
  reg [63:0] m0_dout, m1_dout, s0_dout, s1_dout;
  
  wire m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
  wire [7:0] s_address;
  wire [63:0] m_din, s_din;


  //instance
  bus bus_inst(clk,reset_n,m0_req,m0_wr,m0_address,m0_dout,m1_req,m1_wr,m1_address,m1_dout,s0_dout,s1_dout,m0_grant,m1_grant,m_din,s0_sel,s1_sel,s_address,s_wr,s_din);
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; reset_n=0; m0_req=0; m1_req=0; m0_wr=0; m1_wr=0; m0_address=8'h00; m1_address=8'h00; m0_dout=64'h0; m1_dout=64'h0; s0_dout=64'h0; s1_dout=64'h0;
  #17; reset_n=1;
  #10; m0_req=1; s0_dout=64'h0000_0000_0000_0001; s1_dout=64'h0000_0000_0000_0002;
  #10; m0_wr=1; 
  
  #10; m0_address=8'h01; m0_dout=64'h0000_0000_0000_0002;
  #10; m0_address=8'h02; m0_dout=64'h0000_0000_0000_0004;
  #10; m0_address=8'h03; m0_dout=64'h0000_0000_0000_0006;
  
  #10; m0_address=8'h20; m0_dout=64'h0000_0000_0000_0020;
  #10; m0_address=8'h21; m0_dout=64'h0000_0000_0000_0022;
  #10; m0_address=8'h22; m0_dout=64'h0000_0000_0000_0024;
  #10; m0_address=8'h23; m0_dout=64'h0000_0000_0000_0026;
  #10; m0_address=8'ha0; m0_dout=64'h0000_0000_0000_00ff;
  #20; $finish;
  end
  
  
  
endmodule
  
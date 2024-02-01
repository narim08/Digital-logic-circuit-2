`timescale 1ns/100ps

module tb_BUS;
  reg clk, reset_n;
  reg m_req, m_wr;
  reg [15:0] m_addr;
  reg signed [63:0] m_dout;
  reg signed [63:0] s0_dout;
  reg signed [63:0] s1_dout;
 
  wire m_grant;
  wire s0_sel, s1_sel, s_wr;
  wire signed [63:0] m_din;
  wire signed [63:0] s_din;
  wire [15:0] s_addr;

  //instance
  BUS BUS_inst(.clk(clk),.reset_n(reset_n),.m_req(m_req),.m_wr(m_wr),.m_addr(m_addr),.m_dout(m_dout),.s0_dout(s0_dout),.s1_dout(s1_dout),.m_grant(m_grant),.m_din(m_din),.s0_sel(s0_sel),.s1_sel(s1_sel),.s_addr(s_addr),.s_wr(s_wr),.s_din(s_din));
  
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; reset_n=0; m_req=0; m_wr=0; m_addr=16'h0; m_dout=64'h0; s0_dout=64'h0; s1_dout=64'h0;
  #17; reset_n=1;
  #10; m_req=1; s0_dout=64'h0000_0000_0000_0001; s1_dout=64'h0000_0000_0000_0002;
  #10; m_wr=1; 
  
  #10; m_addr=16'h0001; m_dout=64'h0000_0000_0000_0002;
  #10; m_addr=16'h0700; m_dout=64'h0000_0000_0000_0004;
  #10; m_addr=16'h07FF; m_dout=64'h0000_0000_0000_0006;
  
  #10; m_addr=16'h7000; m_dout=64'h0000_0000_0000_0020;
  #10; m_addr=16'h7001; m_dout=64'h0000_0000_0000_0022;
  #10; m_addr=16'h7100; m_dout=64'h0000_0000_0000_0024;
  #10; m_addr=16'h71ab; m_dout=64'h0000_0000_0000_0026;
  #10; m_addr=16'h71FF; m_dout=64'h0000_0000_0000_00ff;
  #20; $finish;
  end
  
  
  
endmodule
  
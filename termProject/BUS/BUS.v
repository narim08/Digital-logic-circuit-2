module BUS(clk,reset_n,m_req,m_wr,m_addr,m_dout,s0_dout,s1_dout,m_grant,m_din,s0_sel,s1_sel,s_addr,s_wr,s_din);
  input clk, reset_n;
  input m_req, m_wr;
  input [15:0] m_addr;
  input [63:0] m_dout;
  input [63:0] s0_dout;
  input [63:0] s1_dout;
 
  output m_grant;
  output s0_sel, s1_sel, s_wr;
  output [63:0] m_din;
  output [63:0] s_din;
  output [15:0] s_addr;

  wire [1:0] s_sel;
  wire m_grant;
  wire [15:0] s_addr;
 

  //instance
  //Arbiter
  BUS_arbit arbit_0(.clk(clk), .reset_n(reset_n), .m_req(m_req), .m_grant(m_grant));
 
  //s_wr
  mux2 m2_0(.a(m_wr), .b(1'b0), .s(m_grant), .y(s_wr));
  
  //s_address
  mux2_16bit m2_16_0(.a(m_addr), .b(16'b0), .s(m_grant), .y(s_addr));
  
  
  //Address decoder
  BUS_addr addr_0(.m_req(m_req), .addr(s_addr), .s0_sel(s0_sel), .s1_sel(s1_sel));
  
  //register, s_sel
  _dff_r dr_0(.clk(clk), .reset_n(reset_n), .d({s0_sel,s1_sel}), .q(s_sel));
  
  //m_din
  mux3_64bit m3_64_0(.a(64'h0), .b(s0_dout), .c(s1_dout), .s(s_sel), .y(m_din));
  
  //s_din
  mux2_64bit m2_64_0(.a(m_dout), .b(64'h0), .s(m_grant), .y(s_din));
  
endmodule

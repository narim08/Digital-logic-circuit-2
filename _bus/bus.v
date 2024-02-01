module bus(clk,reset_n,m0_req,m0_wr,m0_address,m0_dout,m1_req,m1_wr,m1_address,m1_dout,s0_dout,s1_dout,m0_grant,m1_grant,m_din,s0_sel,s1_sel,s_address,s_wr,s_din);
  input clk, reset_n;
  input m0_req, m0_wr, m1_req, m1_wr;
  input [7:0] m0_address, m1_address;
  input [63:0] m0_dout, m1_dout, s0_dout, s1_dout;
  
  output m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
  output [7:0] s_address;
  output [63:0] m_din, s_din;
  
  wire m0_grant, s0_sel;
  wire [1:0] s_sel;
  wire [7:0] s_address;
  
  
  //instance
  //Arbiter
  bus_arbit arbit_0(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant));
 
  //s_wr
  mx2 m2_0(.a(m0_wr), .b(m1_wr), .s(m0_grant), .y(s_wr));
  
  //s_address
  mux2_8bit m2_8_0(.a(m0_address), .b(m1_address), .s(m0_grant), .y(s_address));
  
  
  //Address decoder
  bus_addr addr_0(.addr(s_address), .s0_sel(s0_sel), .s1_sel(s1_sel));
  
  //register, s_sel
  _dff_r dr_0(.clk(clk), .reset_n(reset_n), .d({s0_sel,s1_sel}), .q(s_sel));
  
  //m_din
  mux3_32bit m3_32_0(.a(64'h00), .b(s0_dout), .c(s1_dout), .s(s_sel), .y(m_din));
  
  
  //s_din
  mux2_32bit m2_32_0(.a(m0_dout), .b(m1_dout), .s(m0_grant), .y(s_din));



endmodule

`timescale 1ns/100ps

module tb_bus_arbit;
  reg clk, reset_n;
  reg m0_req, m1_req;
  wire m0_grant, m1_grant;
  
  //instance
  bus_arbit ba_0(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; reset_n=0; m0_req=0; m1_req=0;
  #7; reset_n=1;
  #40; m0_req=1; m1_req=1; //m0_grant
  #40; m0_req=0; //m1_grant
  #40; m1_req=0; //m0_grant
  #40; m1_req=1; //m1_grant
  #40; m0_req=1; //m1_grant
  #40; m1_req=0; //m0_grant
  #40; m0_req=0; //m0_grant
  #40; $finish;
  end 
  
endmodule

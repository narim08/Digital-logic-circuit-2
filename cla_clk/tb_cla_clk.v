`timescale 1ns/100ps

module tb_cla_clk;
  reg clk;
  reg [31:0] tb_a, tb_b;
  reg tb_ci;
  
  wire [31:0] tb_s_cla;
  wire tb_co_cla;
  
  parameter STEP = 10;
  
  cla_clk cla_clk_0(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s_cla), .co(tb_co_cla));
  
  always # (STEP/2) clk = ~clk; //5ns clock repetition
  
  initial
  begin
    clk=1'b1; tb_a=32'h0; tb_b=32'h0; tb_ci=1'b0; 
	 #(STEP-2); tb_a=32'h0001_000F; tb_b=32'h0000_0001;
	 #(STEP); tb_a=32'hFFFF_FFFF; tb_b=32'h0000_0001; tb_ci=1'b1;
	 #(STEP); tb_a=32'hFFFF_0000; tb_b=32'h0000_FFFF; tb_ci=1'b0;
	 #(STEP); tb_a=32'h0814_d1a0; tb_b=32'h1220_7e0a;
	 #(STEP*2); $stop;
  end
endmodule

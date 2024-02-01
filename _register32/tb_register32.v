`timescale 1ns/100ps

module tb_register32;
  reg tb_clk;
  reg [31:0] tb_d;
  wire [31:0] tb_q;
  
  //instance
  _register32 r32(.clk(tb_clk), .d(tb_d), .q(tb_q));
  
  always begin
    #5 tb_clk = ~tb_clk;
  end
  
  initial begin
    tb_clk=0; tb_d=32'h0000_0001;
	 #7; tb_d=32'h1234_1234;
	 #10; tb_d=32'h5678_5678;
	 #10; tb_d=32'habcd_abcd;
	 #10; tb_d=32'hda08_712a;
	 #10; $finish;
  end
  
endmodule

`timescale 1ns/100ps

module tb_dff_en;
  reg tb_clk, tb_d, tb_en;
  wire tb_q;
  
  //instance
  _dff_en de(.clk(tb_clk), .en(tb_en), .d(tb_d), .q(tb_q));
  
  always begin
    #5 tb_clk = ~tb_clk; //clock cycle
  end
  
  initial begin
    tb_clk=0; tb_d=0; tb_en=1;
	 #11; tb_d=1;
	 #10; tb_d=0;
	 #10; tb_d=1; tb_en=0;
	 #10; tb_d=0;
	 #10; tb_d=1;
	 #10; $finish;
  end
endmodule

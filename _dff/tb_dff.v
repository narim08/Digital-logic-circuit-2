`timescale 1ns/100ps

module tb_dff;
  reg tb_clk,tb_d;
  wire tb_q,tb_q_bar;
  
  //instance
  _dff df0(.clk(tb_clk), .d(tb_d), .q(tb_q), .q_bar(tb_q_bar));
  
  always begin
    #5 tb_clk = ~tb_clk; //clock cycle
  end
  
  initial begin
    tb_clk=0; tb_d=0;
	 #10; tb_d=1;
	 #10; tb_d=0;
	 #10; tb_d=1;
	 #10; $finish;
  end
endmodule
	 
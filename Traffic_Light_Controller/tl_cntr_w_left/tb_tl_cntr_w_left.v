`timescale 1ns/100ps

module tb_tl_cntr_w_left;
  reg clk, reset_n, Ta, Tal, Tb, Tbl;
  wire [1:0] La, Lb;
  
  //instance
  tl_cntr_w_left tleft_inst(.clk(clk), .reset_n(reset_n), .Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .La(La), .Lb(Lb));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
    clk = 0; reset_n=0; Ta=0; Tal=0; Tb=0; Tbl=0;
	 #11; reset_n=1; Ta=1;
	 #10; Ta=0; Tal=1;
	 #20; Tal=0; Tb=1;
	 #20; Tb=0; Tbl=1;
	 #20; Tbl=0;
	 #20; $finish;
  end
  
endmodule

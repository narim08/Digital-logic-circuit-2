`timescale 1ns/100ps

module tb_tl_cntr_struct;
  reg clk, reset_n, Ta, Tb;
  wire [1:0] La, Lb;
  
  //instance
  tl_cntr_struct tl_inst(.clk(clk), .reset_n(reset_n), .Ta(Ta), .Tb(Tb), .La(La), .Lb(Lb));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
    clk=0; reset_n=0; Ta=0; Tb=0;
	 #11; reset_n=1; Ta=1;
	 #10; Ta=0; Tb=1;
	 #20; Ta=1;
	 #10; $finish;
  end
  
endmodule

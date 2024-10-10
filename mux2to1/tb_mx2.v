`timescale 1ns/100ps //Set time units for simulation

module tb_mx2; //testbench for mx2(MUX)
  reg tb_a, tb_b, tb_s;
  wire tb_y;
  
  mx2 _mx(.d0(tb_a), .d1(tb_b), .s(tb_s), .y(tb_y)); //mux module
  
  initial begin
         tb_a = 0; tb_b=1; tb_s=0; //output: 0
	 #10; tb_a = 0; tb_b=1; tb_s=1; //output: 1
	 #10; tb_a = 1; tb_b=0; tb_s=0; //output: 1
	 #10; tb_a = 1; tb_b=0; tb_s=1; //output: 0
	 #10;
	 end
endmodule

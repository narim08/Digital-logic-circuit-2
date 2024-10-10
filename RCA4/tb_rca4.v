`timescale 1ns/100ps

module tb_rca4; //4-bit RCA testbench module
  reg[3:0] tb_a, tb_b; //input
  reg tb_ci; //input
  wire[3:0] tb_s; //output
  wire tb_co; //output
  
  //4-bit RCA module instance
  rca4 rca(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
  
  initial
  begin
         tb_ci=0; tb_a=4'b0000; tb_b=4'b0000; //initialize
    #10; tb_a=4'b0001; tb_b=4'b0011; //sum: 0100, co: 0
    #10; tb_a=4'b1000; tb_b=4'b0111; //sum: 1111, co: 0
	 #10; tb_a=4'b1100; tb_b=4'b0101; //sum: 0001, co: 1
    #10; tb_a=4'b1111; tb_b=4'b1111; //sum: 1110, co: 1
	 #10; tb_ci=1; tb_a=4'b0001; tb_b=4'b0111; //sum: 1001, co: 0
	 #10; tb_a=4'b1000; tb_b=4'b0111; //sum: 0000, co: 1
    #10;
  end
endmodule

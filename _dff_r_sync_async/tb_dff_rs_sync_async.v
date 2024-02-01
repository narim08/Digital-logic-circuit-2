`timescale 1ns/100ps

module tb_dff_rs_sync_async;
  reg clk, reset_n, d;
  wire q_sync, q_async;
  
  //instance
  _dff_r_sync_async syasyDff(.clk(clk), .reset_n(reset_n), .d(d), .q_sync(q_sync), .q_async(q_async));

  always begin
    #5 clk=~clk; //clock cycle
  end
	
  initial begin
    clk=0; reset_n=0; d=0;
	 #11; reset_n=1;
	 #10; d=1;
	 #10; d=0;
	 #10; d=1; reset_n=0;
	 #10; d=0;
	 #10; d=1;
	 #10; reset_n=1;
	 #10; $finish;
  end
	
endmodule

	
module _dff_r_sync_async(clk, reset_n, d, q_sync, q_async); //synchronous and asynchronous
  input clk, reset_n, d;
  output q_sync, q_async;
  wire wq_sync, wq_async;
  
  //instance
  _dff_r_sync _dff_r_sync_0(.clk(clk), .reset_n(reset_n), .d(d), .q(wq_sync)); //synchronous
  _dff_r_async _dff_r_async_1(.clk(clk), .reset_n(reset_n), .d(d), .q(wq_async)); //asynchronous
  
  assign q_sync = wq_sync;
  assign q_async = wq_async;
  
endmodule

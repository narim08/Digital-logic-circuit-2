`timescale 1ns/100ps

module tb_fifo;
  reg clk, reset_n, rd_en, wr_en;
  reg [31:0] d_in;
  wire [31:0] d_out;
  wire full, empty, wr_ack, wr_err, rd_ack, rd_err;
  wire [3:0] data_count;

  //instance
  fifo u0(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
  
  //clock cycle
  always begin
   #5 clk = ~clk;
  end
  
  
  initial begin
  clk=0; reset_n=0; rd_en=0; wr_en=0; d_in=32'h0;
  #11; reset_n=1;  
  #10; rd_en=1;
  #10; rd_en=0; wr_en=1; d_in=32'h1100_0011;
  #10; d_in=32'h2200_0022;
  #10; d_in=32'h3300_0033;
  #10; d_in=32'h4400_0044;
  #10; d_in=32'h5500_0055;
  #10; d_in=32'h6600_0066;
  #10; d_in=32'h7700_0077;
  #10; d_in=32'h8800_0088;
  #10; d_in=32'h9900_0099;
  #10; d_in=32'haa00_00aa;
  #10; d_in=32'hbb00_00bb;
  #10; wr_en=0;
  #20; rd_en=1; 
  #20; rd_en=0; wr_en=1; 
  #10; d_in=32'hcc00_00CC;
  #10; wr_en=0; rd_en=1;
  #90; $finish;
  end
  
endmodule

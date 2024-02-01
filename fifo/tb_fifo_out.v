`timescale 1ns/100ps

module tb_fifo_out;
  reg clk;
  reg [2:0] state;
  reg [3:0] data_count;
  wire full, empty, wr_ack, wr_err, rd_ack, rd_err;

  //instance
  fifo_out fout(.state(state), .data_count(data_count), .full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err));
  
  //clock cycle
  always begin
  #5 clk = ~clk;
  end
  
  initial begin
  clk=0; state=3'b0; data_count=4'b0; //INIT
  #11; state=3'b001; data_count=4'b0001; //WRITE
  #10; state=3'b001; data_count=4'b1000;
  #10; state=3'b010; data_count=4'b1000; //READ
  #10; state=3'b010; data_count=4'b0000;
  #10; state=3'b011; data_count=4'b0000; //NO_OP
  #10; state=3'b011; data_count=4'b1000;
  #10; state=3'b101; data_count=4'b1000; //WR_ERR
  #10; state=3'b110; data_count=4'b0000; //RD_ERR
  #20; $finish;
  end

endmodule

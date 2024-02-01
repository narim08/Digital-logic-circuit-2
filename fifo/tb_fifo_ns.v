`timescale 1ns/100ps

module tb_fifo_ns;
  reg clk, wr_en, rd_en;
  reg [2:0] state;
  reg [3:0] data_count;
  wire [2:0] next_state;

  //instance
  fifo_ns fns(.wr_en(wr_en), .rd_en(rd_en), .state(state), .data_count(data_count), .next_state(next_state));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; wr_en=0; rd_en=0; state=3'b0; data_count=4'b0;
  #11; rd_en=1; state=3'b000;
  #10; rd_en=0; wr_en=1; data_count=4'b0001; state=3'b001;
  #10; data_count=4'b0010;
  #10; data_count=4'b0011;
  #10; data_count=4'b0100;
  #10; data_count=4'b0101;
  #10; data_count=4'b0110;
  #10; data_count=4'b0111;
  #10; data_count=4'b1000;
  #10; wr_en=0; rd_en=1; 
  #10; data_count=4'b0111; state=3'b101;
  #10; data_count=4'b0110;
  #10; data_count=4'b0101;
  #10; data_count=4'b0100;
  #10; data_count=4'b0011;
  #10; data_count=4'b0010;
  #10; data_count=4'b0001;
  #10; data_count=4'b0000; state=3'b110;
  #10; $finish;
  end
  
endmodule

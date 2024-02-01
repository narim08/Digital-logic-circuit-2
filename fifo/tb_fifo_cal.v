`timescale 1ns/100ps

module tb_fifo_cal;
  reg clk;
  reg [2:0] state, head, tail;
  reg [3:0] data_count;
  wire we, re;
  wire [2:0] next_head, next_tail;
  wire [3:0] next_data_count;

  //intance
  fifo_cal fcal(.state(state), .head(head), .tail(tail), .data_count(data_count), .we(we), .re(re), .next_head(next_head), .next_tail(next_tail), .next_data_count(next_data_count));
 
  //clock cycle
  always begin
   #5 clk = ~clk;
  end
  
  initial begin
  clk=0; state=3'b0; head=3'b0; tail=3'b0; data_count=4'b0;
  #11; state=3'b001; tail=3'b001; data_count=4'b0001; //WRITE
  #10; tail=3'b111; data_count=4'b0111; //7 data
  #10; state=3'b101; data_count=4'b1000; tail=3'b0; //WR_ERR
  #10; state=3'b010; data_count=4'b0111; head=3'b001; //READ
  #10; state=3'b110; data_count=4'b0; head=3'b111; //RD_ERR
  #20; $finish; 
  end
  
endmodule

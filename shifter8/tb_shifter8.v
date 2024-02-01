`timescale 1ns/100ps

module tb_shifter8;
  reg clk, reset_n;
  reg [2:0] op;
  reg [1:0] shamt;
  reg [7:0] d_in;
  wire [7:0] d_out;
  
  //instance
  shifter8 s8_0(.clk(clk), .reset_n(reset_n), .op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; reset_n=0; op=3'b000; d_in=8'b0; shamt=2'b0; 
  #11; reset_n=1;
  #10; op=3'b001; d_in=8'b01110111; //LOAD
  #20; op=3'b010; //LSL
  #10; shamt=2'b01;
  #20; op=3'b011; //LSR
  #20; op=3'b100; //ASR
  #30; $finish;
  end
  
endmodule

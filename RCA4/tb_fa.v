`timescale 1ns/100ps

module tb_fa; //Full adderr testbench module
  reg a,b,ci; //input
  wire s,co; //output
  
  //Full adder module instance
  fa fa_1(.a(a), .b(b), .ci(ci), .s(s), .co(co));
  
  initial
  begin
       ci=0; a=0; b=0; //initialize
  #10; a=0; b=1;
  #10; a=1; b=0;
  #10; a=1; b=1;
  #10; ci=1; a=0; b=0;
  #10; a=0; b=1;
  #10; a=1; b=0;
  #10; a=1; b=1;
  #10;
  end
  
endmodule

`timescale 1ns/100ps

module tb_ha; //Half adder testbench module
  reg a; //input
  reg b; //input
  wire s; //output
  wire co; //output
  
  //Half adder module instance
  ha haf(.a(a), .b(b), .s(s), .co(co));
  
  initial
  begin
       a=0; b=0; //initialize
  #10; a=0; b=1;
  #10; a=1; b=0;
  #10; a=1; b=1;
  #10;
  end
endmodule

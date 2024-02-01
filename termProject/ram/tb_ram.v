`timescale 1ns/100ps

module tb_ram;
  reg clk;
  reg cen,wen;
  reg [7:0] s_addr;
  reg [63:0] s_din;
  wire [63:0] s_dout;
  
  //instance
  ram inst_ram(.clk(clk), .cen(cen), .wen(wen), .s_addr(s_addr), .s_din(s_din), .s_dout(s_dout));
  
  //clock cycle
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
  clk=0; cen=0; wen=0; s_addr=8'h0; s_din=64'h0;
  #21; cen=1; wen=1; s_addr=8'h01; s_din=64'habcd__0000_0000_abcd; //write
  #20; s_addr=8'h02; s_din=64'h1234_0000_0000_1234;
  #20; s_addr=8'hab; s_din=64'hFFFF_0000_0814_FFFF;
  
  #20; wen=0; s_addr=8'h01; //read
  #20; s_addr=8'h02;
  #20; s_addr=8'hab;
  #20; $finish;
  end
  
  
endmodule

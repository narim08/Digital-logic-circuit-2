`timescale 1ns/100ps

module tb_alu32;
  reg [31:0] tb_a, tb_b;
  reg [2:0] tb_op;
  
  wire [31:0] tb_result;
  wire tb_c, tb_n, tb_z, tb_v;
  
  alu32 alu32_0 (.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));
  
  initial begin
       tb_a=32'h0; tb_b=32'h0; tb_op=3'b000; //op: NOT A
  #10; tb_a=32'h0; tb_b=32'h0; tb_op=3'b001; //op: NOT B
  
  #10; tb_a=32'h0000_1010; tb_b=32'h0000_0110; tb_op=3'b010; //op: AND
  #10; tb_op=3'b011; //op: OR
  #10; tb_op=3'b100; //op: XOR
  #10; tb_op=3'b101; //op: XNOR
  
  #10; tb_a=32'h0001_000F; tb_b=32'h0000_0001; tb_op=3'b110; //op: ADD
  #10; tb_a=32'hFFFF_FFFF; tb_b=32'h0000_0001;
  #10; tb_a=32'hFFFF_FFFF; tb_b=32'hFFFF_FFFF;
  
  #10; tb_a=32'h0001_000F; tb_b=32'h0000_0001; tb_op=3'b111; //op: SUB
  #10; tb_a=32'hFFFF_FFFF; tb_b=32'h0000_0001;
  #10; tb_a=32'hFFFF_FFFF; tb_b=32'hFFFF_FFFF;
  #10; $stop;
  
  end
  
endmodule

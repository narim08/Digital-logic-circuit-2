`timescale 1ns/100ps 

module tb_alu4;
  reg [3:0] tb_a, tb_b;
  reg [2:0] tb_op; //opcode
  
  wire [3:0] tb_result;
  wire tb_c,tb_n,tb_z,tb_v; //flag
  
  //alu4 module instance
  alu4 alu4_1(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));
  
  initial begin
       tb_a=4'b0000; tb_b=4'b0000; tb_op=3'b000; //op: NOT A
  #10; tb_a=4'b0000; tb_b=4'b1000; tb_op=3'b001; //op: NOT B
  
  #10; tb_a=4'b1010; tb_b=4'b0110; tb_op=3'b010; //op: AND
  #10; tb_op=3'b011; //op: OR
  
  #10; tb_op=3'b100; //op: XOR
  #10; tb_op=3'b101; //op: XNOR
  
  #10; tb_a=4'h3; tb_b=4'h5; tb_op=3'b110; //op: ADD
  #10; tb_a=4'h8; tb_b=4'hd;
  #10; tb_a=4'hf; tb_b=4'hf;
  
  #10; tb_a=4'ha; tb_b=4'ha; tb_op=3'b111; //op: SUB
  #10; tb_a=4'h3; tb_b=4'h9;
  #10; tb_a=4'h7; tb_b=4'h2;
  #10; $stop;
  end
  
endmodule


/*
module tb_alu4;
  reg  clk, reset; 
  reg [3:0] tb_a, tb_b, tb_resEx;
  reg [2:0] tb_op;
  
  wire [3:0] tb_result;
  wire tb_c,tb_n,tb_z,tb_v; //flag
  
  reg [31:0] vectornum, errors; //count
  reg [14:0] testvectors[100:0];
  
  
  //alu4 module instance
  alu4 alu4_1(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));
  
  always
  begin
    clk=1; #5; clk=0; #5;
  end
  
  initial
  begin
    $readmemb("test.tv", testvectors);
	 vectornum=0; errors=0;
	 reset=1; #27; reset=0;
  end
  
  always@(posedge clk)
  begin
    #1; {tb_a, tb_b, tb_op, tb_resEx} = testvectors[vectornum];
  end
  
  always@(negedge clk)
  if(~reset) begin
    if(tb_result !== tb_resEx) begin
	   $display("Error: input = %b", {tb_a, tb_b, tb_op});
		$display(" output = %b (%b expected)", tb_result, tb_resEx);
		errors = errors + 1;
    end
	 
	 vectornum = vectornum+1;
	 if(testvectors[vectornum]===15'bx) begin
	   $display("%d tests completed with %d errors", vectornum, errors);
		$finish;
    end
  end
  
endmodule
*/
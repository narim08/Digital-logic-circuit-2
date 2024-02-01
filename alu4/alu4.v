module alu4(a,b,op,result,c,n,z,v);
  input [3:0] a,b;
  input [2:0] op; //opcode
  
  output [3:0] result; 
  output c,n,z,v; //flag
  
  wire [3:0] w_add_b;
  wire [3:0] w_not_a,w_not_b,w_and,w_or,w_xor,w_xnor,w_add;
  wire c3_add,co_add;
  
  //NOT_A
  _inv_4bits inv_4b_1 (.a(a), .y(w_not_a));
  
  //NOT_B
  _inv_4bits inv_4b_2 (.a(b), .y(w_not_b));
  
  //AND
  _and2_4bits and2_4b (.a(a), .b(b), .y(w_and));
  
  //OR
  _or2_4bits or2_4b (.a(a), .b(b), .y(w_or));
  
  //XOR
  _xor2_4bits xor2_4b (.a(a), .b(b), .y(w_xor));
  
  //XNOR
  _xnor2_4bits xnor2_4b (.a(a), .b(b), .y(w_xnor));
  
  //ADD
  mx2_4bits mx2_4b (.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b));
  cla4_ov cla4_1 (.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .c3(c3_add), .co(co_add));
  
  
  //8-to-1 MUX
  mx8_4bits mx8_4b_0 (.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor), .g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result));
  
  //calculate flags
  cal_flags4 flag4 (.op(op), .result(result), .co_add(co_add), .c3_add(c3_add), .c(c), .n(n), .z(z), .v(v));
  
endmodule
  
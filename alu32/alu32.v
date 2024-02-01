module alu32(a,b,op,result,c,n,z,v); //32-bits ALU
  input [31:0] a,b;
  input [2:0] op;

  output [31:0] result;
  output c,n,z,v; //flags
 
  wire [31:0] w_add_b;
  wire [31:0] w_not_a,w_not_b,w_and,w_or,w_xor,w_xnor,w_add;
  wire co_prev,co_add;
  
  //gates instance
  _inv_32bits inv_32b_1 (.a(a), .y(w_not_a));
  _inv_32bits inv_32b_2 (.a(b), .y(w_not_b));
  _and2_32bits and2_32b (.a(a), .b(b), .y(w_and)); 
  _or2_32bits or2_32b (.a(a), .b(b), .y(w_or)); 
  _xor2_32bits xor2_32b (.a(a), .b(b), .y(w_xor)); 
  _xnor2_32bits xnor2_32b (.a(a), .b(b), .y(w_xnor));
  
  //mx2_32bits instance
  mx2_32bits mx2_32b (.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b));
  
  //cla32_ov instance
  cla32_ov cla32_ov_0 (.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .co_prev(co_prev), .co(co_add));
  
  //mx8_32bits instance
  mx8_32bits mx8_32b_0 (.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor), .g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result));
  
  //cla_flags32 instance
  cal_flags32 cal_flags32_0 (.op(op), .result(result), .co_add(co_add), .co_prev_add(co_prev), .c(c), .n(n), .z(z), .v(v));
  
endmodule

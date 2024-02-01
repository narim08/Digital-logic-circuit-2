module cal_flags32(op,result,co_add,co_prev_add,c,n,z,v); //calculation of 32-bits Flags
  input [2:0] op;
  input [31:0] result;
  input co_add,co_prev_add; 
  
  output c,n,z,v; //flags
  
  //c(carry): When Carry Occurs
  assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add;
  
  //n(negative): sign bit==1
  assign n = result[31];
  
  //z(zero): Operation result==0
  assign z = (result == 32'b0) ? 1'b1 : 1'b0;
  
  //v(overflow): carry[n-1] XOR carry[n-2]
  assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ co_prev_add;
  
endmodule

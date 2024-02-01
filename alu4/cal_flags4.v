module cal_flags4(op,result,co_add,c3_add,c,n,z,v);
  input [2:0] op; //opcode
  input [3:0] result;
  input co_add, c3_add;
  
  output c,n,z,v; //flag
  
  //conditional operator assign
  //c(carry): When Carry Occurs
  assign c=(op[2:1] != 2'b11) ? 1'b0 : co_add;
  
  //n(negative): sign bit==1
  assign n=result[3]; //MSB
  
  //z(zero): Operation result==0
  assign z=(result == 4'b0) ? 1'b1 : 1'b0;
  
  //v(overflow): carry[n-1] XOR carry[n-2]
  assign v=(op[2:1] != 2'b11) ? 1'b0 : co_add ^ c3_add;
  
endmodule

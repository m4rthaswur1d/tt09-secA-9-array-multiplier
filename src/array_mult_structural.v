`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 04:00:45 PM
// Design Name: 
// Module Name: array_mult_structural
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module array_mult_structural(
input [3:0] m, 
input [3:0] q, 
output [7:0] p

    );
wire int_sig2, int_sig3, int_sig4, int_sig5, int_sig6, int_sig7, int_sig8, int_sig9, 
int_sig10, int_sig11, int_sig12, int_sig13, int_sig14, int_sig15, int_sig16, int_sig_out1 ,int_sig_out2, int_sig_out3, 
int_sig_out4, int_sig_out5, int_sig_out6 ;

wire carryout1, carryout2, carryout3, carryout4, carryout5, carryout6, carryout7, carryout8, carryout9,
carryout10, carryout11;

assign p[0] = m[0] & q[0];
assign int_sig2 = m[1] & q[0];
assign int_sig3 = m[2] & q[0];
assign int_sig4 = m[3] & q[0];
assign int_sig5 = m[0] & q[1];
assign int_sig6 = m[1] & q[1];
assign int_sig7 = m[2] & q[1];
assign int_sig8 = m[3] & q[1];

assign int_sig9 = m[0] & q[2];
assign int_sig10 = m[1] & q[2];
assign int_sig11 = m[2] & q[2];
assign int_sig12 = m[3] & q[2];

assign int_sig13 = m[0] & q[3];
assign int_sig14 = m[1] & q[3];
assign int_sig15 = m[2] & q[3];
assign int_sig16 = m[3] & q[3];

full_adder inst1 (int_sig2, int_sig5, 1'b0, carryout1, p[1]);
full_adder inst2 (int_sig3, int_sig6, carryout1, carryout2, int_sig_out1);
full_adder inst3 (int_sig4, int_sig7, carryout2, carryout3, int_sig_out2);
full_adder inst4 (1'b0, int_sig8, carryout3, carryout4, int_sig_out3);

full_adder inst5 (int_sig_out1, int_sig9, 1'b0, carryout5, p[2]);
full_adder inst6 (int_sig_out2, int_sig10, carryout5, carryout6, int_sig_out4);
full_adder inst7 (int_sig_out3, int_sig11, carryout3, carryout7, int_sig_out5);
full_adder inst8 (carryout4, int_sig12, carryout7, carryout8, int_sig_out6);

full_adder inst9 (int_sig_out4, int_sig13, 1'b0, carryout9, p[3]);
full_adder inst10 (int_sig_out5, int_sig14, carryout9, carryout10, p[4]);
full_adder inst11 (int_sig_out6, int_sig15, carryout10, carryout11, p[5]);
full_adder inst12 (carryout8, int_sig16, carryout11, p[7], p[6]);

endmodule

module full_adder(
    input a, 
    input b,
    input c,
    output carry,
    output sum
    );
    
assign sum = a ^ b ^ c; 
assign carry  = (a&b) | (b&c) | (a&c) ;

endmodule 
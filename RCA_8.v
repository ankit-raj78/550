/*This is a simple 8 bit ripple carry adder computed from the full adder adders, to be used to create select
16-bit carry select adder module. 
*/
module RCA_8 (a, b, cin, sum, cout);
	
	input [7:0] a, b;
	input cin;
	output [7:0] sum;
	output cout;
	
	wire [6:0] w5;
	
	full_adder my_fa(.sum(sum[0]), .cout(w5[0]), .a(a[0]), .b(b[0]), .cin(cin));
	full_adder my_fa1(.sum(sum[1]), .cout(w5[1]), .a(a[1]), .b(b[1]), .cin(w5[0]));
	full_adder my_fa2(.sum(sum[2]), .cout(w5[2]), .a(a[2]), .b(b[2]), .cin(w5[1]));
	full_adder my_fa3(.sum(sum[3]), .cout(w5[3]), .a(a[3]), .b(b[3]), .cin(w5[2]));
	full_adder my_fa4(.sum(sum[4]), .cout(w5[4]), .a(a[4]), .b(b[4]), .cin(w5[3]));
	full_adder my_fa5(.sum(sum[5]), .cout(w5[5]), .a(a[5]), .b(b[5]), .cin(w5[4]));
	full_adder my_fa6(.sum(sum[6]), .cout(w5[6]), .a(a[6]), .b(b[6]), .cin(w5[5]));
	full_adder my_fa7(.sum(sum[7]), .cout(cout), .a(a[7]), .b(b[7]), .cin(w5[6]));

	
endmodule 
	
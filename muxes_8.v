module muxes_8(a, b, sel, out);

	input [7:0] a,b;
	input sel;
	output [7:0] out;
	
	muxes_4 my_mux1(.a(a[3:0]), .b(b[3:0]), .sel(sel), .out(out[3:0]));
	muxes_4 my_mux2(.a(a[7:4]), .b(b[7:4]), .sel(sel), .out(out[7:4]));

	
endmodule

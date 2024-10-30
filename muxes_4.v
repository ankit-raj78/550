module muxes_4(a, b, sel, out);

	input [3:0] a,b;
	input sel;
	output [3:0] out;
	
	muxes_1 my_mux1(.a(a[0]), .b(b[0]), .sel(sel), .out(out[0]));
	muxes_1 my_mux2(.a(a[1]), .b(b[1]), .sel(sel), .out(out[1]));
	muxes_1 my_mux3(.a(a[2]), .b(b[2]), .sel(sel), .out(out[2]));
	muxes_1 my_mux4(.a(a[3]), .b(b[3]), .sel(sel), .out(out[3]));
	
endmodule

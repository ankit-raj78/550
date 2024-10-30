module muxes_16(a, b, sel, out);

	input [15:0] a,b;
	input sel;
	output [15:0] out;
	
	muxes_8 my_mux1(.a(a[7:0]), .b(b[7:0]), .sel(sel), .out(out[7:0]));
	muxes_8 my_mux2(.a(a[15:8]), .b(b[15:8]), .sel(sel), .out(out[15:8]));

	
endmodule

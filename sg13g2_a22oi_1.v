module sg13g2_a22oi_1 (Y, A1, A2, B1, B2);
	output Y;
	input A1, A2, B1, B2;

	// Function
	wire int_fwire_0, int_fwire_1;

	and (int_fwire_0, A1, A2);
	or (int_fwire_1, int_fwire_0, B1, B2);
	not (Y, int_fwire_1);

	// Timing
	specify
		(A1 => Y) = 0;
		(A2 => Y) = 0;
		(B1 => Y) = 0;
		(B2 => Y) = 0;
	endspecify

	// Formal
	`ifdef FORMAL 
	always @(A1, A2, B1, B2) begin
	if (B1 || B2 || (A1 && A2) == 1)
		assert (Y == 0);
	else
		assert (Y == 1);
	end
	`endif
endmodule

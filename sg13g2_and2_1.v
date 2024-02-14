module sg13g2_and2_1 (X, A, B);
	output X;
	input A, B;

	// Function
	and (X, A, B);

	// Timing
	specify
		(A => X) = 0;
		(B => X) = 0;
	endspecify
		
	// Formal
	`ifdef FORMAL 
	always @(A, B) begin
	if (A && B == 1)
		assert (X == 1);
	else
		assert (X == 0);
	end
	`endif
endmodule

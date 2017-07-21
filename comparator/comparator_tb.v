/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
*/

module comparator_tb();

reg a, b; //declare all inputs as registers
wire a_less_b, a_equal_b, a_greater_b; //declare all outputs as wires

initial
	begin
		$dumpfile ("comparator_wave.vcd"); //required for gtkwaveform
		$dumpvars (0, comparator_tb); //required for gtkwaveform

		$display ("time\t a b a<b a=b a>b");
		$monitor ("%g\t %b %b %b\t %b  %b", $time, a, b, a_less_b, a_equal_b, a_greater_b);

//stimulus

		#10 a <= 2'b00; b <= 2'b00;
		#10 a <= 2'b01; b <= 2'b10;
		#10 a <= 2'b10; b <= 2'b01;
		#10 a <= 2'b11; b <= 2'b11;
	end

comparator connect_comparator (
	a,
	b,
	a_less_b,
	a_equal_b,
	a_greater_b
);

endmodule 

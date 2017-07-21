/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
*/

module full_adder_tb ();

reg a, b, cin; //decllare all inputs as registers
wire sum, cout; //declare all outputs as wires

integer i, j, k; //integer required for running loops


initial
	begin
		$dumpfile ("full_adder_wave.vcd"); //required for gtkwaveform
		$dumpvars (0, full_adder_tb); //required for gtkwaveform

		$display ("time\t a b cin sum cout");
		$monitor ("%g\t %b %b %b\t %b  %b", $time, a, b, cin, sum, cout);
	a = 0; //initial value of a
	b = 0; //initial value of b
	cin = 0; //initial value of cin

//stimulus
	for ( i = 0; i< 2; i = i+1)
		begin
			for ( j = 0; j< 2; j = j+1)
				begin
					for ( k = 0; k< 2; k = k+1)
						begin
							#10 a= i; b= j; cin = k;
							#10 ;
						end
				end
		end

	end
full_adder connect_full_adder (
	a,
	b,
	cin,
	sum,
	cout
);

endmodule	



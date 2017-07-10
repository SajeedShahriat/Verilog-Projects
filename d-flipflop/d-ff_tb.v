/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
*/

module d_ff_tb ();

reg data, reset, clk; //declare all inputs as registers
wire q; // declare all outputs as wires

initial
	begin
		$dumpfile ("d_ff_wave.vcd"); //required for gtkwaveform
		$dumpvars (0, d_ff_tb); //required for gtkwaveform

		$display ("time\t clk reset data q");
		$monitor ("%g\t %b %b %b", $time, clk, reset, data, q);
		data = 0; //initial value of data
		reset = 0; //initial value of reset
	end

		always #100 clk = ~clk; //initialize clk

//stimulus
initial
	begin
	#200 data = 1b'1;
	reset = 1b'1;
	#200 data = 
	end

endmodule
	

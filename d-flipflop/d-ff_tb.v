/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
*/

module d_ff_tb ();

reg data, reset, clk; //declare all inputs as registers
wire q; // declare all outputs as wires


always 
	begin	
		#100 clk = ~clk; //initialize clk
	end

initial
	begin
		$dumpfile ("d_ff_wave.vcd"); //required for gtkwaveform
		$dumpvars (0, d_ff_tb); //required for gtkwaveform

		$display ("time\t clk reset data q");
		$monitor ("%g\t %b %b %b", $time, clk, reset, data, q);
		clk = 1'b1; //initial value of clock		
		data = 1'b0; //initial value of data
		reset = 1'b0; //initial value of reset

//stimulus
	#100 data = 1'b1;
	#300 reset = 1'b1; 
	#300 reset = 1'b0;
	#600 data = 1'b0;
	#500 data = 1'b1;
	#200 data = 1'b0;
	#400 $finish;
	end

//connect DUT to test bench
d_ff connect_d_ff (
	data,
	q,	
	reset,	
	clk
);
endmodule
	

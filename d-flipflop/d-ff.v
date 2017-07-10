/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
*/

module d_ff (
	data,	//data input
	q,	// data output	
	reset,	//reset signal
	clk	//clock
); //end of port list

//---------------------------input ports-----------------------------
input data;
input clk;
input reset;

//---------------------------output ports----------------------------
output q;

//-----------------------input port data type------------------------
wire data;
wire clk;
wire reset;

//-----------------------output port data type-----------------------
reg q;

//---------------------------RTL design------------------------------
always @ (posedge clk)
	if (reset == 1)
		begin
			q <= 1b'0;
		end
	else
		begin
			q <= data;
		end

endmodule //d-flipflop

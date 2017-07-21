/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
*/

module comparator (
	a,
	b,
	a_less_b,
	a_equal_b,
	a_greater_b

); //end of port list

//---------------------------input ports-----------------------------
input a;
input b;

//---------------------------output ports----------------------------
output a_less_b;
output a_equal_b;
output a_greater_b;

//-----------------------input port data type------------------------
wire [1:0] a;
wire [1:0] b;

//-----------------------output port data type-----------------------
reg a_less_b;
reg a_equal_b;
reg a_greater_b;

//---------------------------RTL design------------------------------

always @ (a or b)
	begin
		if (a < b)
			begin
				a_less_b <= 1'b1;
				a_equal_b <= 1'b0;
				a_greater_b <= 1'b0;
			end
		else if (a == b)
			begin
				a_less_b <= 1'b0;
				a_equal_b <= 1'b1;
				a_greater_b <= 1'b0;
			end

		else if (a > b)
			begin
				a_less_b <= 1'b0;
				a_equal_b <= 1'b0;
				a_greater_b <= 1'b1;	
			end

	end

endmodule //comparator

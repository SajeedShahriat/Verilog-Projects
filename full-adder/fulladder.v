/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
*/

module full_adder (
	a,
	b,
	cin,
	sum,
	cout

); //end of port list

//---------------------------input ports-----------------------------
input a;
input b;
input cin;

//---------------------------output ports----------------------------
output sum;
output cout;

//-----------------------input port data type------------------------
wire a;
wire b;
wire cin;

//-----------------------output port data type-----------------------
reg sum;
reg cout;

//---------------------------RTL design------------------------------

always @ (a or b or cin)
	begin
		sum <= a^b^cin;
		cout <= ((a&b)|((a^b)&cin));
	end

endmodule 

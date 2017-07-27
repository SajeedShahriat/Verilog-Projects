/*
Author: Sajeed Mohammad Shahriat
Affiliation: Rochester Institute of Technology
All rights reserved
This files can be reused and modified given that this copyright notice is not removed
reference: http://www.asic-world.com/examples/verilog/
*/

module sp_ram_sync (

	clk	,	//system clock
	address	,	// address input
	data	,	// bi-directional data
	cs	,	// chip select
	we	,	// write enable
	oe		// output enable


); //end of port list

//----------------------------parameters-----------------------------
parameter DATA_WIDTH= 8;
parameter ADDR_WIDTH= 8;
parameter RAM_DEPTH= 1 << ADDR_WIDTH;

//---------------------------input ports-----------------------------
input clk;
input [ADDR_WIDTH-1:0] address;
input cs;
input we;
inout oe;

//---------------------------inout ports-----------------------------
inout [DATA_WIDTH-1:0] data

//------------------------internal variables-------------------------
reg [DATA_WIDTH-1:0] data-out;
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];
reg oe_r;

//---------------------------RTL design------------------------------
//tri-state buffer control
//output: when enabl=0, oe=1, cs=1
assign data = (cs && oe && !we) ? data_out: 8'bz;

//memory write block
//write operation: when we=1, cs=1
always @ (posedge clk)
	begin : MEM_WRITE
		if (cs && we)
			begin
				mem [address] = data;
			end
	end

//memory read block
//read operation: when we= 0, oe= 1, cs=1
always @ (posedge clk)
	begin : MEM_READ
		if (cs && !we && oe)
			begin
				data_out = mem [address];
				oe_r = 1;
			end
		else
			begin
				oe_r = 0;
			end
	end

endmodule 

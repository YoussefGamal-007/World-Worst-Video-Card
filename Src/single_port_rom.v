// Quartus Prime Verilog Template
// Single Port ROM

module single_port_rom
#(parameter DATA_WIDTH=3, parameter ADDR_WIDTH=16)
(
	input [(ADDR_WIDTH-1):0] addr,
	input clk, 
	input r_en ,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,


	initial
	begin
		$readmemb("image_new.txt", rom);
	end

	always @ ( posedge clk or posedge r_en  )
	begin
		if ( r_en ) 
			q <= 3'b000;
		
		else 
		  q <= rom[addr];
	end


	
endmodule
module top (clk , reset , RGB , vsync , hsync );
	
	input clk ;
	input reset ;
	output [2:0] RGB ;
	output vsync , hsync;
	
	
	wire video_on ;
	wire  [8:0] pixel_x ;
	wire [9:0] pixel_y ;
	
	
		
		pll PLL (
		
			.inclk0(clk),
			.c0(clk_out)
			
			);

			
			
		vgaController B1(
			
			.clk(clk_out),
			.reset(reset),
			.hsync(hsync),
			.vsync(vsync),
			.video_on(video_on),
			.pixel_x(pixel_x),
			.pixel_y(pixel_y)
		
				);
				
				
		single_port_rom M1(
		
			.addr( {pixel_y[8:1], pixel_x[7:0]} ),
			.clk(clk_out),
			.r_en(!video_on),
			.q(RGB)
					
				);


endmodule
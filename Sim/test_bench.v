module test_bench () ;

	reg clk , reset ;
	wire vsync , hsync;
	wire [2:0] RGB ;
	wire video_on ;
	wire [8:0] pixel_x ;
	wire [9:0] pixel_y ;

	top UUT (
			.clk(clk),
			.vsync(vsync),
			.hsync(hsync),
			.reset(reset),
			.RGB(RGB),
			.pixel_x(pixel_x),
	    .pixel_y(pixel_y),
	    .video_on(video_on)

		); 

	always #5 clk = ~clk ;

	initial begin

	clk = 0 ;
	reset = 1 ;
	#4 reset = 0;
	#12 reset = 1;

	end 

	initial begin 

		$monitor ("RGB = %b" , RGB );
	end 

endmodule 
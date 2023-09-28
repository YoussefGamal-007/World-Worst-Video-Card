`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2023 11:33:46 PM
// Design Name: 
// Module Name: vga_sync



module vgaController (
        input clk ,  // 10.07 MHz 
        input reset ,
        output  hsync , vsync ,
        output video_on ,          // signal for tracking visible area of screen 
        output reg [8:0] pixel_x ,
		  output reg [9:0] pixel_y   // counters for tracking pixel position 
		//  output [2:0] RGB 
    );
    
    // constants decleration 
    // VGA 256 * 480 @ 60 HZ sync parameters 
	 // we will divide all pixels by 2.5 
	 
    parameter hVisible_area  = 256 ;   // horizontal display (visible area) 
    parameter hFront_porch  = 6 ;      // (right border)
    parameter hSync  = 38 ;             // horizonatal sync signal (low)
    parameter hBack_porch = 19 ;       // (left border)
    parameter h_max = hVisible_area + hFront_porch + hBack_porch + hSync -1 ;  
    
    parameter vVisible_area = 480;     // vertical display (visible area)
    parameter vFront_porch = 10;       // (bottom border)
    parameter vSync = 2;               // vertical sync (low)
    parameter vBack_porch = 33;        // (top border)
    parameter v_max = vVisible_area + vFront_porch + vBack_porch + vSync -1 ; 


    wire h_end ;     // detect the end of line 
    wire v_end ;     // detect the end of whole screen 
    
 
  always @(posedge clk or negedge reset)   
    begin 
    
            if(!reset) 
              begin
                 pixel_x <= 0 ;
                // hsync = 0 ;
              end
                    
            else  
              begin 
                 if(h_end)
                    pixel_x <= 0;
                    
                 else 
                    pixel_x <= pixel_x + 1;        
              end
    end
    
  always @(posedge clk or negedge reset) 
    begin 
       
            if(!reset) 
              begin
                 pixel_y <= 0 ;
                // vsync = 0 ;
              end
                    
            else  
              begin 
                 if(h_end)
                  begin 
                     if(v_end) 
                           pixel_y <= 0 ; 
                           
                     else 
                            pixel_y <= pixel_y + 1 ; 
                  end                
              end
    end
    
    assign h_end = (pixel_x == h_max) ;  // end of line 
    assign v_end = (pixel_y == v_max) ;  // end of whole screen 
    
    // horizonatl sync signal 
   assign hsync = ((pixel_x < hVisible_area + hFront_porch) ||
                                     (pixel_x > hVisible_area + hFront_porch + hSync -1));
                                     
    // vertical sync signal                              
   assign vsync = ((pixel_y < vVisible_area + vFront_porch) ||
                                     (pixel_y > vVisible_area + vFront_porch + vSync -1 ));
    
    // ON when within visible area of screen 
    assign video_on = ( (pixel_x < hVisible_area) && (pixel_y < vVisible_area) );
	 
	// assign RGB = ( video_on ? 3'b111 : 3'b000);

endmodule
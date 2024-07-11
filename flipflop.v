module flipflop ( clk , rst_n , in1 ,in2 ,out ) ; // port list 
	
	//port declaration 
	input rst_n ; 
	input in1 ;
	input in2 ;
	input clk ;
	output out; 
	
	// date type declaration 
	
	wire rst_n ; 
	wire in1 ;
	wire in2 ;
	wire clk ;
	reg out ; 
	reg in2_1d;

	always @(posedge clk or negedge rst_n ) begin 
				if ( rst_n == 1'b0)
				in2_1d <= 1'b0;
				else 
				in2_1d <= in2 ; 
	end
	
	always @(posedge clk or negedge rst_n ) begin 
				if ( rst_n == 1'b0)
				out <= 1'b0;
				else if ( in1 == 1'b1 ) 
				out <= 1'b1 ;
	      else if ( in2_1d <= 1'b1 )  
	        out <= 1'b0;
	        else 
	          out <= out ; 
	end

endmodule 

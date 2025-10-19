`timescale 1 ns / 10 ps

module TM;

parameter 	IN_WORD_SIZE = 8;
parameter 	OUT_WORD_SIZE = 15;

reg 							clk, rst;
reg		[IN_WORD_SIZE-1:0] 		x0, x1, x2, x3, x4, x5, x6, x7;
wire 	[OUT_WORD_SIZE-1:0] 	z0, z1, z2, z3, z4, z5, z6, z7;
	
//===========================================//

initial
	begin
		$fsdbDumpfile("dct.fsdb");
		$fsdbDumpvars;
	end
	
//---- gate sim -----//
//initial
//        $sdf_annotate("../dct.sdf", U_DCT);	

//-------------------//

DCT		U_DCT(
					.clk	(clk), 
					.rst	(rst),
					.x0		(x0),
					.x1		(x1),
					.x2		(x2),
					.x3		(x3),
					.x4		(x4),
					.x5		(x5),
					.x6		(x6),
					.x7		(x7),
					.z0		(z0),
					.z1		(z1),
					.z2		(z2),
					.z3		(z3),
					.z4		(z4),
					.z5		(z5),
					.z6		(z6),
					.z7		(z7)
				);



//*********************************
// 		control signal
//*********************************

// gen clock signal
parameter	t = 100;		
parameter	th = t/2;

always #th clk = ~clk;


initial begin
    clk = 1;
    rst = 1;
    #th rst = 0;
    #(t*2)      rst = 1;
	#(t)	
		x0 = 8'd10;	
		x1 = 8'd110;	
		x2 = 8'd20;	
		x3 = 8'd78;	
		x4 = 8'd27;	
		x5 = 8'd60;	
		x6 = 8'd54;	
		x7 = 8'd3;	
	  
    #(t*64)
    #t      $finish;
end
 
endmodule                         


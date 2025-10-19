module DCT(clk, rst, x0, x1, x2, x3, x4, x5, x6, x7, z0, z1, z2, z3, z4, z5, z6, z7);

input signed [7:0] x0,x1,x2,x3,x4,x5,x6,x7;
input clk,rst;
output signed [20:0] z0,z1,z2,z3,z4,z5,z6,z7;

reg signed [8:0] xx0,xx1,xx2,xx3,xx4,xx5,xx6,xx7;
reg signed [20:0] z0,z1,z2,z3,z4,z5,z6,z7;

parameter signed c1 = 9'b011111011;
parameter signed c2 = 9'b011101100;
parameter signed c3 = 9'b011010100;
parameter signed c4 = 9'b010110101;
parameter signed c5 = 9'b010001110;
parameter signed c6 = 9'b001100001;
parameter signed c7 = 9'b000110001;

always@(posedge clk or negedge rst)begin
	if (~rst)begin
		xx0 <= 1'b0;
		xx1 <= 1'b0;
		xx2 <= 1'b0;
		xx3 <= 1'b0;
		xx4 <= 1'b0;
		xx5 <= 1'b0;
		xx6 <= 1'b0;
		xx7 <= 1'b0;
	end
	else begin
		xx0 <= (1'b0,x0);
		xx1 <= (1'b0,x1);
		xx2 <= (1'b0,x2);
		xx3 <= (1'b0,x3);
		xx4 <= (1'b0,x4);
		xx5 <= (1'b0,x5);
		xx6 <= (1'b0,x6);
		xx7 <= (1'b0,x7);
	end
end

always@(posedge clk or negedge rst)begin
	if (~rst)begin
		z0 <= 1'b0;
		z1 <= 1'b0;
		z2 <= 1'b0;
		z3 <= 1'b0;
		z4 <= 1'b0;
		z5 <= 1'b0;
		z6 <= 1'b0;
		z7 <= 1'b0;
	end
	else begin
		z0 <= (xx0 + xx1 + xx2 + xx3 + xx4 + xx5 + xx6 + xx7)*c4;
		z1 <= (xx0 - xx7)*c1 + (xx1 - xx6)*c3 + (xx2 - xx5)*c5 + (xx3 - xx4)*c7;
		z2 <= (xx0 - xx3 - xx4 + xx7)*c2 + (xx1 - xx2 - xx5 + xx6)*c6;
		z3 <= (xx0 - xx7)*c3 + (xx1 - xx6)*(-c7) + (xx2 - xx5)*(-c1) + (xx3 - xx4)*(-c5);
		z4 <= (xx0 - xx1 - xx2 + xx3 + xx4 - xx5 - xx6 + xx7)*c4;
		z5 <= (xx0 - xx7)*c5 + (xx1 - xx6)*(-c1) + (xx2 - xx5)*c7 + (xx3 - xx4)*c3;
		z6 <= (xx0 - xx3 - xx4 + xx7)*c6 + (xx1 - xx2 - xx5 + xx6)*(-c2);
		z7 <= (xx0 - xx7)*c7 + (xx1 - xx6)*(-c5) + (xx2 - xx5)*c3 + (xx3 - xx4)*(-c1);
	end
end

endmodule
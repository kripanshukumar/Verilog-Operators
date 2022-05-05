module operator_tb();

	reg [3:0] A = 4'b1010;
	reg [3:0] B = 4'b0010;
	
	reg [7:0] out = 8'b00000000;
	integer itr = 0;
	
	initial
	begin
		$monitor("A = %b, B = %b, out = %b, ITR = %d",A,B,out,itr);
	end
	
	initial
	begin
		#10 out = A+B; itr = itr+1;   //1
		#10 out = A-B; itr = itr+1;	//2
		#10 out = A/B; itr = itr+1;	//3
		#10 out = A*B; itr = itr+1;	//4
		#10 out = A%B; itr = itr+1;	//5
		#10 out = A**2'b10; itr = itr+1;//6
		#10 A = -A; itr = itr+1;	//7
		#10 B = +B; itr = itr+1;	//8
		#10 out = A != B; itr = itr+1;	//9
		#10 out = A==B; itr = itr+1;	//10
		#10 out = A>=B; itr = itr+1;	//11
		#10 out = A<=B; itr = itr+1;	//12
		#10 out = A>B; itr = itr+1;	//13
		#10 out = A<B; itr = itr+1;	//14
		#10 out = ~A; itr = itr+1;	//15
		#10 out = A&B; itr = itr+1;	//16
		#10 out = A|B; itr = itr+1;	//17
		#10 out = A^B; itr = itr+1;	//18
		#10 out = A~^B; itr = itr+1;	//19
		#10 out = &A; itr = itr+1;	//20
		#10 out = |B; itr = itr+1;	//21
		#10 out = ~&A; itr = itr+1;	//22
		#10 out = ~|B; itr = itr+1;	//23
		#10 $finish;
	end
	
endmodule
module alu_tb();
	
	reg [3:0]cmd;
	reg oe;
	reg [7:0] a;
	reg [7:0] b;
	wire [15:0] out;
	
	integer itr;

	parameter
	ADD = 4'b0000,
	INC = 4'b0001,
	SUB = 4'b0010,
	DEC = 4'b0011,
	MUL = 4'b0100,
	DIV = 4'b0101,
	SHL = 4'b0110,
	SHR = 4'b0111,
	AND = 4'b1000,
	OR = 4'b1001,
	INV = 4'b1010,
	NAND = 4'b1011,
	NOR = 4'b1100,
	XOR = 4'b1101,
	XNOR = 4'b1110,
	BUF = 4'b1111;
	
	//Internal register for storing the string values
   	reg [4*8:0]string_cmd;
	alu DUT(out,a,b,cmd,oe);
	
	always@(cmd)
    begin
         case (cmd)
	    ADD    :  string_cmd = "ADD";
	    INC    :  string_cmd = "INC";
	    SUB    :  string_cmd = "SUB";
	    DEC    :  string_cmd = "DEC";
	    MUL    :  string_cmd = "MUL";
	    DIV    :  string_cmd = "DIV";
	    SHL    :  string_cmd = "SHL";
	    SHR    :  string_cmd = "SHR";
	    INV    :  string_cmd = "INV";
	    AND    :  string_cmd = "AND";
	    OR     :  string_cmd = "OR";
	    NAND   :  string_cmd = "NAND";
	    NOR    :  string_cmd = "NOR";
	    XOR    :  string_cmd = "XOR";
	    XNOR   :  string_cmd = "XNOR";
	    BUF    :  string_cmd = "BUF";
	 endcase
    end
	
	initial
	begin
		for(itr = 0; itr< 1048575; itr = itr + 1)
		begin
			{cmd,a,b} = itr;
			#10;
		end
		#20 $finish;
	end
	
	initial
	begin
		oe = 1'b1;
	end

	initial
	begin
		$monitor("CMD = %s, OE = %d, A = %d, B = %d, OUTPUT = %d",string_cmd,oe,a,b,out);
	end
endmodule;
	
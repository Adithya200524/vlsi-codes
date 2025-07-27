module full_adder(input a, b, cin, output s, cout);

	assign s= a^b^cin;
	assign cout= (a&b) | (b&cin) | (a&cin);
endmodule 

module ripple_carry_adder(
		input[3:0] A,B,
		input Cin,
		output[3:0] S,
output Cout);
    wire c1,c2,c3;


		full_adder f0(.a(A[0]),
				.b(B[0]),
				.cin(Cin),
				.s(S[0]),
				.cout(c1) );	
		full_adder f1(.a(A[1]),
				.b(B[1]),
				.cin(c1),
				.s(S[1]),
				.cout(c2) );
		full_adder f2(.a(A[2]),
				.b(B[2]),
				.cin(c2),
				.s(S[2]),
				.cout(c3) );
		full_adder f3(.a(A[3]),
				.b(B[3]),
				.cin(c3),
				.s(S[3]),
				.cout(Cout));

endmodule

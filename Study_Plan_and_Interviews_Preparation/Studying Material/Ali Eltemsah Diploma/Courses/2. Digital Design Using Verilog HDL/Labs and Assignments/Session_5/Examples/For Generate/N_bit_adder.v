module N_bit_adder#(parameter N = 4)(
input wire [N-1 : 0] a,
input wire [N-1 : 0] b,
output wire [N-1 : 0] s,
output wire cout
);

wire [N-1 : 0] carry;
genvar i;

full_adder U0_full_adder(
    .a(a[0]),
    .b(b[0]),
    .cin(1'b0),
    .s(s[0]),
    .cout(carry[0])
);

generate
    for(i = 1; i < N; i = i + 1)
    begin
    full_adder U1_full_adder(
        .a(a[i]),
        .b(b[i]),
        .cin(carry[i-1]),
        .s(s[i]),
        .cout(carry[i])
    );
    end
endgenerate

assign cout = carry[N-1];

endmodule
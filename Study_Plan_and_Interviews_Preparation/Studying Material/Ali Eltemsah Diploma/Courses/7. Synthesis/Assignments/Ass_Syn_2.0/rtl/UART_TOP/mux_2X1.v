module mux_2X1(
input wire I0,
input wire I1,
input wire sel,
output wire out
);

assign out = sel ? I1 : I0;

endmodule

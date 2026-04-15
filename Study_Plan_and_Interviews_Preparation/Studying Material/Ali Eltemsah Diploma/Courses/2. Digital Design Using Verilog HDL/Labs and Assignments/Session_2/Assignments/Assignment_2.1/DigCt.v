module DigCt(
input wire IN1, 
input wire IN2,
input wire IN3,
input wire IN4,
input wire IN5,
input wire CLK,
output reg OUT1,
output reg OUT2,
output reg OUT3
);

reg D1, D2, D3;

always @(posedge CLK)
begin
OUT1 <= D1;
OUT2 <= D2;
OUT3 <= D3;
end

always @(*)
begin
  D1 = ~( ~(IN1 | IN2) & IN3 );
end

always @(*)
begin
  D2 = ~(IN2 & IN3);
end

always @(*)
begin
  D3 = (IN3 | ~IN4) | IN5;
end

endmodule


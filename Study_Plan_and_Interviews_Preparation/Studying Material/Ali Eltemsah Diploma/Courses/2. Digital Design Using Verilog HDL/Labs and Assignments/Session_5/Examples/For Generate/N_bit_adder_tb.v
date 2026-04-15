`timescale 1 ns / 1 ps
module N_bit_adder_tb();

localparam N_tb = 4;

reg [N_tb-1 : 0] a_tb;
reg [N_tb-1 : 0] b_tb;
wire [N_tb-1 : 0] s_tb;
wire cout_tb;

integer i;

initial 
begin
    $dumpfile("N_bit_adder.vcd");
    $dumpvars;
    for(i = 0; i < 100; i = i + 1)
    begin
        a_tb = $random;
        b_tb = $random;
        #10;
        if(a_tb + b_tb != {cout_tb, s_tb} )
        begin
            $display("DUT ERROR!");
        end
    end
    $stop;
end

initial 
begin
    $monitor("a=%d b=%d s=%d cout=%d", a_tb, b_tb, s_tb, cout_tb);
end

N_bit_adder #( .N(N_tb) ) U0_N_bit_adder (
.a(a_tb),
.b(b_tb),
.s(s_tb),
.cout(cout_tb)
);

endmodule
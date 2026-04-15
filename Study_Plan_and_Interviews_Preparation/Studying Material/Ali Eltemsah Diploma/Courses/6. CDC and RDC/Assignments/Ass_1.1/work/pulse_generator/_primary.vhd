library verilog;
use verilog.vl_types.all;
entity pulse_generator is
    port(
        signal_in       : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        pulse_out       : out    vl_logic
    );
end pulse_generator;

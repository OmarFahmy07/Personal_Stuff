library verilog;
use verilog.vl_types.all;
entity electronic_lock is
    port(
        zero            : in     vl_logic;
        one             : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        unlock          : out    vl_logic
    );
end electronic_lock;

library verilog;
use verilog.vl_types.all;
entity bit_synchronizer is
    generic(
        BUS_WIDTH       : integer := 1;
        NUM_STAGES      : integer := 1
    );
    port(
        ASYNC           : in     vl_logic_vector;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        SYNC            : out    vl_logic_vector
    );
end bit_synchronizer;

library verilog;
use verilog.vl_types.all;
entity data_synchronizer is
    generic(
        BUS_WIDTH       : integer := 8;
        NUM_STAGES      : integer := 1
    );
    port(
        unsync_bus      : in     vl_logic_vector;
        bus_enable      : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        sync_bus        : out    vl_logic_vector;
        enable_pulse    : out    vl_logic
    );
end data_synchronizer;

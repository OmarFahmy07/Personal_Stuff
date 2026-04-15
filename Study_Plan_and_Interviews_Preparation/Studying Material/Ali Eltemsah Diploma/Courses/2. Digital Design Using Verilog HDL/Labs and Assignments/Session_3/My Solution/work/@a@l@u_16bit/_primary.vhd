library verilog;
use verilog.vl_types.all;
entity ALU_16bit is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        ALU_FUN         : in     vl_logic_vector(3 downto 0);
        CLK             : in     vl_logic;
        ALU_OUT         : out    vl_logic_vector(15 downto 0);
        Arith_Flag      : out    vl_logic;
        Logic_Flag      : out    vl_logic;
        CMP_Flag        : out    vl_logic;
        Shift_Flag      : out    vl_logic
    );
end ALU_16bit;

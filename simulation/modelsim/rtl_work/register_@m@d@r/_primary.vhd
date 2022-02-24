library verilog;
use verilog.vl_types.all;
entity register_MDR is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        enable          : in     vl_logic;
        bus_data        : in     vl_logic_vector(31 downto 0);
        Mdatain         : in     vl_logic_vector(31 downto 0);
        read            : in     vl_logic_vector(31 downto 0);
        output_Q        : out    vl_logic_vector(31 downto 0)
    );
end register_MDR;

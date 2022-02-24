library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        ALU_Sel         : in     vl_logic_vector(3 downto 0);
        ALU_Out         : out    vl_logic_vector(63 downto 0)
    );
end alu;

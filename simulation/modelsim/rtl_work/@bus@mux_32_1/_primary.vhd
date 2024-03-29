library verilog;
use verilog.vl_types.all;
entity BusMux_32_1 is
    port(
        mux_out         : out    vl_logic_vector(31 downto 0);
        BusMuxIn_R0     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R1     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R2     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R3     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R4     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R5     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R6     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R7     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R8     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R9     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R10    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R11    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R12    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R13    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R14    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_R15    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_HI     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_LO     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_ZHI    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_ZLOW   : in     vl_logic_vector(31 downto 0);
        BusMuxIn_PC     : in     vl_logic_vector(31 downto 0);
        BusMuxIn_MDR    : in     vl_logic_vector(31 downto 0);
        BusMuxIn_InPort : in     vl_logic_vector(31 downto 0);
        C_sign_extended : in     vl_logic_vector(31 downto 0);
        \select\        : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic
    );
end BusMux_32_1;

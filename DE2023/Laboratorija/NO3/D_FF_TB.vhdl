library ieee;

use ieee.std_logic_1164.all;

entity D_FF_TB is
end entity;

architecture D_FF_TB_beh of D_FF_TB is
    component D_FF is 
        port(
            D, CLK : in std_logic;
            Q : out std_logic
        );
    end component;

    signal d_in : std_logic :='0';
    signal clk : std_logic :='0';
    signal q_out : std_logic :='0';

    begin
        lbl: D_FF port map(D => d_in, CLK => clk, Q => q_out);
        process begin
            d_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed d = 0, clk = 0 from Qn-1 = 0." severity error;

            d_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed d = 0, clk = 1 from Qn-1 = 0." severity error;

            d_in <=  '1';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed d = 1, clk = 0 from Qn-1 = 0." severity error;

            d_in <=  '1';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed d = 1, clk = 1 from Qn-1 = 0." severity error;

            d_in <=  '1';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '1') report "Failed d = 1, clk = 0 from Qn-1 = 1." severity error;

            d_in <=  '1';
            clk <= '1';
            wait for 10 ns;
            
            d_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '1') report "Failed d = 0, clk = 0 from Qn-1 = 1." severity error;

            d_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed d = 0, clk = 1 from Qn-1 = 1." severity error;

            -- Clear inputs
            clk <= '0';
            d_in <= '0';
            assert false report "Test finished." severity note;
            wait;
        end process;
end D_FF_TB_beh;
library ieee;

use ieee.std_logic_1164.all;

entity JK_FF_TB is
end entity;

architecture JK_FF_TB_beh of JK_FF_TB is
    component JK_FF is 
        port(
            J, K, CLK : in std_logic;
            Q : out std_logic
        );
    end component;

    signal j_in : std_logic :='0';
    signal k_in : std_logic :='0';
    signal clk : std_logic :='0';
    signal q_out : std_logic :='0';

    begin
        lbl: JK_FF port map(J => j_in, K => k_in, CLK => clk, Q => q_out);
        process begin
            k_in <=  '0';
            j_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed k_in = j_in = 0, clk = 0 from Qn-1 = 0." severity error;

            k_in <=  '0';
            j_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed k_in = j_in = 0, clk = 1 from Qn-1 = 0." severity error;

            k_in <=  '0';
            j_in <=  '1';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed k_in = 0, j_in = 1, clk = 0 from Qn-1 = 0." severity error;

            k_in <=  '0';
            j_in <=  '1';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed k_in = 0, j_in = 1, clk = 1 from Qn-1 = 0." severity error;

            k_in <=  '1';
            j_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '1') report "Failed k_in = 1, j_in = 0, clk = 0 from Qn.1 = 1." severity error;

            k_in <=  '1';
            j_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed k_in = 1, j_in = 0, clk = 1 Qn-1 = 1." severity error;

            k_in <=  '1';
            j_in <=  '1';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed k_in = 1, j_in = 1, clk = 0 from Qn.1 = 0." severity error;

            k_in <=  '1';
            j_in <=  '1';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed k_in = 1, j_in = 1, clk = 1 Qn-1 = 0." severity error;

            k_in <= '0';
            j_in <= '0';
            clk <= '0';
            wait for 10 ns;

            k_in <= '0';
            j_in <= '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed k_in = 0, j_in = 0, clk = 1 Qn-1 = 1." severity error;

            k_in <= '1';
            j_in <= '1';
            clk <= '0';
            wait for 10 ns;

            k_in <= '1';
            j_in <= '1';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed k_in = 1, j_in = 1, clk = 1 Qn-1 = 0." severity error;

            -- Clear inputs
            clk <= '0';
            k_in <= '0';
            j_in <= '0';
            assert false report "Test finished." severity note;
            wait;
        end process;
end JK_FF_TB_beh;
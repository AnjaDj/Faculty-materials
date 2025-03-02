library ieee;

use ieee.std_logic_1164.all;

entity T_FF_TB is
end entity;

architecture T_FF_TB_beh of T_FF_TB is
    component T_FF is 
        port(
            T, CLK : in std_logic;
            Q : out std_logic
        );
    end component;

    signal t_in : std_logic :='0';
    signal clk : std_logic :='0';
    signal q_out : std_logic :='0';

    begin
        lbl: T_FF port map(T => t_in, CLK => clk, Q => q_out);
        process begin
            t_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed t = 0, clk = 0 from Qn-1 = 0." severity error;

            t_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed t = 0, clk = 1 from Qn-1 = 0." severity error;

            t_in <=  '1';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed t = 1, clk = 0 from Qn-1 = 0." severity error;

            t_in <=  '1';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed t = 1, clk = 1 from Qn-1 = 0." severity error;

            t_in <=  '1';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '1') report "Failed t = 1, clk = 0 from Qn-1 = 1." severity error;

            t_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed t = 0, clk = 1 from Qn-1 = 1." severity error;

            t_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '1') report "Failed t = 0, clk = 0 from Qn-1 = 1." severity error;

            t_in <=  '1';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed t = 1, clk = 1 from Qn-1 = 1." severity error;

            -- Clear inputs
            clk <= '0';
            t_in <= '0';
            assert false report "Test finished." severity note;
            wait;
        end process;
end T_FF_TB_beh;
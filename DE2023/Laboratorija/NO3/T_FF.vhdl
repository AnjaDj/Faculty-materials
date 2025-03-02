library ieee;

use ieee.std_logic_1164.all;

entity T_FF is 
port(
    T, CLK : in std_logic;
    Q : out std_logic
);
end T_FF;

architecture T_FF_beh of T_FF is
    signal state : std_logic;
    signal q_tmp : std_logic :='0';
begin
    state <= q_tmp;
    process(CLK) 
    begin
        if(rising_edge(CLK)) then
            if(T = '0') then
                q_tmp <= state;
            else
                q_tmp <= not(state);
            end if;
        end if;
    end process;
    Q <= q_tmp;
end T_FF_beh ; 
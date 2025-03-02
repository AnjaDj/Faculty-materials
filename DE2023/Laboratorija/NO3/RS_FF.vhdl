library ieee;

use ieee.std_logic_1164.all;

entity RS_FF is 
port(
    R, S, CLK : in std_logic;
    Q : out std_logic
);
end RS_FF;

architecture RS_FF_beh of RS_FF is

    signal q_tmp : std_logic :='0';
begin
    process(CLK) 
    begin
        if(rising_edge(CLK)) then
            if(S = '1' and R = '0') then
                q_tmp <= '1';
            elsif(R = '1' and S = '0') then
                q_tmp <= '0';
            end if;
        end if;
    end process;
    Q <= q_tmp;
end RS_FF_beh ; 
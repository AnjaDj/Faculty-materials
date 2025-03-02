library ieee;

use ieee.std_logic_1164.all;

entity D_FF is 
port(
    D, CLK : in std_logic;
    Q : out std_logic
);
end D_FF;

architecture D_FF_beh of D_FF is

    signal q_tmp : std_logic :='0';
begin
    process(CLK) 
    begin
        if(rising_edge(CLK)) then
            q_tmp <= D;
        end if;
    end process;
    Q <= q_tmp;
end D_FF_beh ; 
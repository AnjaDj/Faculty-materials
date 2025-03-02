library ieee;

use ieee.std_logic_1164.all;

entity JK_FF is 
port(
    J, K, CLK : in std_logic;
    Q : out std_logic
);
end JK_FF;

architecture JK_FF_beh of JK_FF is
    signal state : std_logic;
    signal q_tmp : std_logic :='0';
begin
    state <=  q_tmp;
    process(CLK) 
    begin
        if(rising_edge(CLK)) then
            if(J = '0' and K = '0') then
                q_tmp <= state;
            elsif(J = '1' and K = '0') then
                q_tmp <= '1';
            elsif(K = '1' and J = '0') then
                q_tmp <= '0';
            else 
                q_tmp <= not(state);
            end if;
        end if;
    end process;
    Q <= q_tmp;
end JK_FF_beh ; 
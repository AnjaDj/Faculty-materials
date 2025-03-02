library ieee;

use ieee.std_logic_1164.all;

entity shift_register is
    port(
        CLK, CLR, LIN, RIN : in std_logic;
        data_in : in std_logic_vector(5 downto 0);
        mode : in std_logic_vector(1 downto 0);
        data_out : out std_logic_vector(5 downto 0)
    );
end shift_register;

architecture shift_register_beh of shift_register is
    
    signal tmp_state : std_logic_vector(5 downto 0) := "000000";

begin
    data_out <= tmp_state;
    process(CLK, CLR) begin
        if(CLR = '0') then
            tmp_state <= "000000";
        elsif(rising_edge(CLK)) then
            case mode is
                when "00" =>
                    -- drzanje
                    tmp_state <= tmp_state;
                when "01" =>
                    -- pomjeranje udesno
                    for i in 0 to 4 loop
                        tmp_state(i) <= tmp_state(i+1);
                    end loop;
                    tmp_state(5) <= RIN;
                when "10" =>
                    -- pomjeranje ulijevo
                    for i in 5 downto 1 loop
                        tmp_state(i) <= tmp_state(i-1);
                    end loop;
                    tmp_state(0) <= LIN;
                when others =>
                    -- paralelni upis
                    tmp_state <= data_in;
            end case;
        end if;
    end process;
end shift_register_beh;
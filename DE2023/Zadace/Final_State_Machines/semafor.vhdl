library ieee;
use ieee.std_logic_1164.all;

entity semafor is
port( clk, rst, t1, t2, t3 : in std_logic;
      output : out std_logic_vector(1 downto 0)
);
end semafor;

architecture beh_semafor of semafor is
    type semafor_states is (R,Y,G);
    signal present_state, next_state : semafor_states;

    begin
    -- SEKVENCIJALNI DIO

        process(clk,rst)
        begin
            if (rst = '1') then present_state <= R;
            elsif (rising_edge(clk)) then present_state <= next_state;
            end if;
        end process;

    -- KOMBINACIONI DIO

        process(present_state,t1,t2,t3)
        begin
            case present_state is
                                when R =>   if (t1 = '0') then 
                                                                next_state <= Y;
                                                                output <= "01";
                                            else
                                                                next_state <= R;
                                                                output <= "00";
                                            end if;
                                when Y =>   if (t2 = '0') then 
                                                                next_state <= G;
                                                                output <= "10";
                                            else
                                                                next_state <= Y;
                                                                output <= "01";
                                            end if;
                                when G =>   if (t3 = '0') then 
                                                                next_state <= R;
                                                                output <= "00";
                                            else
                                                                next_state <= G;
                                                                output <= "10";
                                            end if;
            end case;
        end process;

end beh_semafor;
                
                                    
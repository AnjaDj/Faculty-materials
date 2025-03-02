library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dc_controller_tb is
end dc_controller_tb; 

architecture Behavioral of dc_controller_tb is

  component dc_controller is
  port (
    clk        : in  STD_LOGIC;                     -- Clock signal
    reset      : in  STD_LOGIC;                     -- Reset signal
    duty       : in  STD_LOGIC_VECTOR(7 downto 0);  -- Duty cycle (0-255)
    polarity   : in  STD_LOGIC;                     -- Polarity control signal
	start      : in STD_LOGIC;                      -- Start control signal
	stop       : in STD_LOGIC;						-- Stop control signal
    motor_out  : out STD_LOGIC                      -- Motor output signal
  );
  end component;
	
  -- Clock period constant
  constant clk_period : time := 10 ns;

  signal clk       : STD_LOGIC := '0';
  signal reset     : STD_LOGIC := '0';
  signal duty      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
  signal polarity  : STD_LOGIC := '0';            
  signal start     : STD_LOGIC := '0';                      
  signal stop      : STD_LOGIC := '0';				
  signal motor_out : STD_LOGIC := '0';              
  
begin

  -- Clock generation
  clk <= not clk after clk_period / 2;

  DUT : dc_controller port map(clk,reset,duty,polarity,start,stop,motor_out);

  -- Stimulus process
  stimulus : process
  begin
    -- Reset
    reset <= '1';
    wait for 20 ns;
    reset <= '0';

    -- Test: Start motor, forward rotation
    start <= '1';
    stop <= '0';
    duty <= "01000000";  -- 25% duty cycle
    polarity <= '0';    
    -- wait for 100 ns;

    -- Test: Reverse rotation
    polarity <= '1';
    wait for 100 ns;

    -- Test: Stop motor
    -- stop <= '1';
    -- wait for 100 ns;

    -- Test: Restart motor
    -- stop <= '0';
    -- wait for 100 ns;

    -- Završetak simulacije
    wait;
  end process;

end architecture;
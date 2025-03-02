library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use std.env.finish;

entity pwm_tb is
end pwm_tb; 

architecture Behavioral of pwm_tb is

  component pwm is
  port (
    clk   : in  STD_LOGIC;       -- Clock signal
    reset : in  STD_LOGIC;       -- Reset signal
    duty  : in  STD_LOGIC_VECTOR(7 downto 0); -- Duty cycle (0-255)
    pwm_out : out STD_LOGIC      -- PWM output signal
  );
  end component;
	
  -- Clock period constant
  constant clk_period : time := 10 ns;

  signal clk     : STD_LOGIC := '0';
  signal reset   : STD_LOGIC := '0';
  signal duty    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
  signal pwm_out : STD_LOGIC := '0';
  
begin

  -- Clock generation
  clk <= not clk after clk_period / 2;

  DUT : pwm
    port map(
      clk     => clk,
      reset   => reset,
      duty    => duty,
      pwm_out => pwm_out
    );

  -- Stimulus process
  stimulus_process: process
  begin
    -- Reset the system
    reset <= '1';
    wait for 40 ns;
    reset <= '0';
    wait for 40 ns;
	
	-- Test case 5: Duty cycle = 0 (~0%)
    -- duty <= "00000000";
    -- wait for 1 ms;

    -- Test case 1: Duty cycle = 64 (~25%)
    -- duty <= "01000000";
    -- wait for 700 ns;

    -- Test case 2: Duty cycle = 128 (~50%)
    -- duty <= "10000000";
    -- wait for 1 ms;

    -- Test case 3: Duty cycle = 192 (~75%)
    -- duty <= "11000000";
    -- wait for 100 ns;

    -- Test case 4: Duty cycle = 255 (~100%)
    -- duty <= "11111111";
    -- wait for 1 ms;

    -- End simulation
    wait;
  end process;

end architecture;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2017 06:05:34 PM
-- Design Name: 
-- Module Name: register_8_bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_8_bit is
    Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           enable : in STD_LOGIC);
end register_8_bit;

architecture Behavioral of register_8_bit is
begin

process (clk)
variable value : std_logic_vector(7 downto 0);
begin
if (enable = '1' and rising_edge(clk)) then
    value := data_in;
end if;
data_out <= value;
end process;

end Behavioral;

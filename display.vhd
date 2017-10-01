----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2017 09:48:18 AM
-- Design Name: 
-- Module Name: main - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port ( binary_number : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR(3 downto 0);
           seg : out STD_LOGIC_VECTOR(6 downto 0));
           
end display;

architecture Behavioral of display is

signal bcd0 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal bcd1 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal bcd2 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal bcd3 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal slow_clock : STD_LOGIC;
signal two_bit : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
signal bcd_in : STD_LOGIC_VECTOR (3 downto 0);
signal display_selector : STD_LOGIC_VECTOR (3 downto 0); 
--signal bigShifter : STD_LOGIC_VECTOR (35 downto 0) := (others => '0');

begin

bcd_in <= bcd0 when two_bit = "00" else
          bcd1 when two_bit = "01" else
          bcd2 when two_bit = "10" else
          bcd3 when two_bit = "11" else "0000";
          
an <= "1110" when two_bit = "00" else
      "1101" when two_bit = "01" else
      "1011" when two_bit = "10" else
      "0111" when two_bit = "11" else "0000";

seg <= "1000000" when bcd_in = "0000" else
       "1111001" when bcd_in = "0001" else
       "0100100" when bcd_in = "0010" else
       "0110000" when bcd_in = "0011" else
       "0011001" when bcd_in = "0100" else
       "0010010" when bcd_in = "0101" else
       "0000010" when bcd_in = "0110" else
       "1111000" when bcd_in = "0111" else
       "0000000" when bcd_in = "1000" else
       "0011000" when bcd_in = "1001" else "1111111";

two_bit_counter : process(slow_clock)
variable counter : std_logic_vector(1 downto 0) := "00";
begin
if(rising_edge(slow_clock)) then
    if(counter = "11") then
        counter := "00";
    else
        counter := std_logic_vector(unsigned(counter) + 1);
    end if;
end if;
two_bit <= counter;
end process;

clk_divider : process(clk)
variable counter : std_logic_vector(25 downto 0) := "00000000000000000000000000";
variable output : std_logic;
begin
if(rising_edge(clk)) then
    if(unsigned(counter) >= 65535) then
        counter := "00000000000000000000000000";
        output := not output; 
    else
        counter := std_logic_vector(unsigned(counter) + 1);
    end if;
end if;
slow_clock <= output;
end process;

binary_to_bcd : process(binary_number)
variable bigShifter : std_logic_vector(35 downto 0);
begin
bigShifter(35 downto 0) := "000000000000000000000000000000000000";
if(unsigned(binary_number(15 downto 0)) > 9999) then
    bigShifter(15 downto 0) := "0010011100001111";
else
    bigShifter(15 downto 0) := binary_number;
end if;

for i in 0 to 15 loop

    if(unsigned(bigShifter(19 downto 16)) > 4) then
        bigShifter(19 downto 16) := std_logic_vector(unsigned(bigShifter(19 downto 16)) + 3);
    end if;
    
    if(unsigned(bigShifter(23 downto 20)) > 4) then
        bigShifter(23 downto 20) := std_logic_vector(unsigned(bigShifter(23 downto 20)) + 3);
    end if;

    if(unsigned(bigShifter(27 downto 24)) > 4) then
        bigShifter(27 downto 24) := std_logic_vector(unsigned(bigShifter(27 downto 24)) + 3);
    end if;
    
    if(unsigned(bigShifter(31 downto 28)) > 4) then
        bigShifter(31 downto 28) := std_logic_vector(unsigned(bigShifter(31 downto 28)) + 3);
    end if;

    if(unsigned(bigShifter(35 downto 32)) > 4) then
        bigShifter(35 downto 32) := std_logic_vector(unsigned(bigShifter(35 downto 32)) + 3);
    end if;

    bigShifter(35 downto 1) := bigShifter(34 downto 0);
    bigShifter(0) := '0';
    
end loop;

 bcd0(3 downto 0) <= bigShifter(19 downto 16);
 bcd1(3 downto 0) <= bigShifter(23 downto 20);
 bcd2(3 downto 0) <= bigShifter(27 downto 24);
 bcd3(3 downto 0) <= bigShifter(31 downto 28);

end process;

end Behavioral;

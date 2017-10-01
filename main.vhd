----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2017 05:16:04 PM
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( sw : in STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           clk : in STD_LOGIC;
           btnC : in STD_LOGIC);
end main;

architecture Behavioral of main is

component display is
    Port ( binary_number : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component register_8_bit is
    Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           enable : in STD_LOGIC);
end component;

signal command : STD_LOGIC_VECTOR (3 downto 0);
signal write_value : STD_LOGIC_VECTOR (7 downto 0);
signal wr_addr : STD_LOGIC_VECTOR (3 downto 0);
signal rd_addr : STD_LOGIC_VECTOR (3 downto 0);
signal output_value : STD_LOGIC_VECTOR (15 downto 0);
signal display_reg_in : STD_LOGIC_VECTOR (7 downto 0);
signal enable : STD_LOGIC_VECTOR (16 downto 0);
signal reg_0_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_1_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_2_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_3_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_4_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_5_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_6_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_7_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_8_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_9_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_10_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_11_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_12_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_13_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_14_out : STD_LOGIC_VECTOR (7 downto 0);
signal reg_15_out : STD_LOGIC_VECTOR (7 downto 0);

begin

display_driver: display Port Map (binary_number => output_value,
                                  clk => clk,
                                  an => an,
                                  seg => seg);
                                  
register0: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_0_out,
                                    clk => btnC,
                                    enable => enable(0));

register1: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_1_out,
                                    clk => btnC,
                                    enable => enable(1));

register2: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_2_out,
                                    clk => btnC,
                                    enable => enable(2));                                    

register3: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_3_out,
                                    clk => btnC,
                                    enable => enable(3));

register4: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_4_out,
                                    clk => btnC,
                                    enable => enable(4));

register5: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_5_out,
                                    clk => btnC,
                                    enable => enable(5));

register6: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_6_out,
                                    clk => btnC,
                                    enable => enable(6));

register7: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_7_out,
                                    clk => btnC,
                                    enable => enable(7));

register8: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_8_out,
                                    clk => btnC,
                                    enable => enable(8));

register9: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_9_out,
                                    clk => btnC,
                                    enable => enable(9));

register10: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_10_out,
                                    clk => btnC,
                                    enable => enable(10));

register11: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_11_out,
                                    clk => btnC,
                                    enable => enable(11));

register12: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_12_out,
                                    clk => btnC,
                                    enable => enable(12));

register13: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_13_out,
                                    clk => btnC,
                                    enable => enable(13));

register14: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_14_out,
                                    clk => btnC,
                                    enable => enable(14));

register15: register_8_bit Port Map (data_in => write_value,
                                    data_out => reg_15_out,
                                    clk => btnC,
                                    enable => enable(15));

output_register: register_8_bit Port Map (data_in => display_reg_in,
                                          data_out => output_value(7 downto 0),
                                          clk => btnC,
                                          enable => enable(16));

command <= sw(3 downto 0);

display_reg_in <= reg_0_out when rd_addr = "0000" else
                  reg_1_out when rd_addr = "0001" else
                  reg_2_out when rd_addr = "0010" else
                  reg_3_out when rd_addr = "0011" else
                  reg_4_out when rd_addr = "0100" else
                  reg_5_out when rd_addr = "0101" else
                  reg_6_out when rd_addr = "0110" else
                  reg_7_out when rd_addr = "0111" else
                  reg_8_out when rd_addr = "1000" else
                  reg_9_out when rd_addr = "1001" else
                  reg_10_out when rd_addr = "1010" else
                  reg_11_out when rd_addr = "1011" else
                  reg_12_out when rd_addr = "1100" else
                  reg_13_out when rd_addr = "1101" else
                  reg_14_out when rd_addr = "1110" else
                  reg_15_out when rd_addr = "1111";
                                    
doeverything : process(sw)
begin
enable <= "00000000000000000";
case command is
    when "0001" =>
        -- write command
        write_value <= sw(15 downto 8);
        wr_addr <= sw(7 downto 4);
        case wr_addr is
            when "0000" =>
                enable(0) <= '1';
            when "0001" =>
                enable(1) <= '1';
            when "0010" =>
                enable(2) <= '1';
            when "0011" =>
                enable(3) <= '1';
            when "0100" =>
                enable(4) <= '1';
            when "0101" =>
                enable(5) <= '1';
            when "0110" =>
                enable(6) <= '1';
            when "0111" =>
                enable(7) <= '1';
            when "1000" =>
                enable(8) <= '1';
            when "1001" =>
                enable(9) <= '1';
            when "1010" =>
                enable(10) <= '1';
            when "1011" =>
                enable(11) <= '1';
            when "1100" =>
                enable(12) <= '1';
            when "1101" =>
                enable(13) <= '1';
            when "1110" =>
                enable(14) <= '1';
            when "1111" =>
                enable(15) <= '1';
        end case; 
    when "0010" =>
        -- read command
        enable(16) <= '1';
        rd_addr <= sw(7 downto 4);
    when "0100" =>
        -- copy command
        wr_addr <= sw(7 downto 4);
        rd_addr <= sw(11 downto 8);
        case wr_addr is
            when "0000" =>
                enable(0) <= '1';
            when "0001" =>
                enable(1) <= '1';
            when "0010" =>
                enable(2) <= '1';
            when "0011" =>
                enable(3) <= '1';
            when "0100" =>
                enable(4) <= '1';
            when "0101" =>
                enable(5) <= '1';
            when "0110" =>
                enable(6) <= '1';
            when "0111" =>
                enable(7) <= '1';
            when "1000" =>
                enable(8) <= '1';
            when "1001" =>
                enable(9) <= '1';
            when "1010" =>
                enable(10) <= '1';
            when "1011" =>
                enable(11) <= '1';
            when "1100" =>
                enable(12) <= '1';
            when "1101" =>
                enable(13) <= '1';
            when "1110" =>
                enable(14) <= '1';
            when "1111" =>
                enable(15) <= '1';
        end case;
        case rd_addr is
            when "0000" =>
                write_value <= reg_0_out;
            when "0001" =>
                write_value <= reg_1_out;
            when "0010" =>
                write_value <= reg_2_out;
            when "0011" =>
                write_value <= reg_3_out;
            when "0100" =>
                write_value <= reg_4_out;
            when "0101" =>
                write_value <= reg_5_out;
            when "0110" =>
                write_value <= reg_6_out;
            when "0111" =>
                write_value <= reg_7_out;
            when "1000" =>
                write_value <= reg_8_out;
            when "1001" =>
                write_value <= reg_9_out;
            when "1010" =>
                write_value <= reg_10_out;
            when "1011" =>
                write_value <= reg_11_out;
            when "1100" =>
                write_value <= reg_12_out;
            when "1101" =>
                write_value <= reg_13_out;
            when "1110" =>
                write_value <= reg_14_out;
            when "1111" =>
                write_value <= reg_15_out;
        end case;
    when "1000" =>
        -- clear command
        case wr_addr is
            when "0000" =>
                enable(0) <= '1';
            when "0001" =>
                enable(1) <= '1';
            when "0010" =>
                enable(2) <= '1';
            when "0011" =>
                enable(3) <= '1';
            when "0100" =>
                enable(4) <= '1';
            when "0101" =>
                enable(5) <= '1';
            when "0110" =>
                enable(6) <= '1';
            when "0111" =>
                enable(7) <= '1';
            when "1000" =>
                enable(8) <= '1';
            when "1001" =>
                enable(9) <= '1';
            when "1010" =>
                enable(10) <= '1';
            when "1011" =>
                enable(11) <= '1';
            when "1100" =>
                enable(12) <= '1';
            when "1101" =>
                enable(13) <= '1';
            when "1110" =>
                enable(14) <= '1';
            when "1111" =>
                enable(15) <= '1';
        end case;
        write_value <= "00000000";
    when others =>
        -- do nothing
end case;
end process;
end Behavioral;
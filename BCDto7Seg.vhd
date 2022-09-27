
----***BCD to 7-Segment Q no:(18)***-----

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
--------------------------------
entity BCDto7Seg is
  port(
    s1:in std_logic_vector(3 downto 0);
    o1:out std_logic_vector(6 downto 0)); 
end BCDto7Seg;
---------------------------------
Architecture Operation of BCDto7Seg is
signal o:std_logic_vector(6 downto 0); 
--signal s:std_logic_vector(3 downto 0); 

begin
  process(s1)
    begin

     if    (s1="0000") then o<="1111110";
     elsif (s1="0001") then o<="0110000";
     elsif (s1="0010") then o<="1101101";
     elsif (s1="0011") then o<="1111001";
     elsif (s1="0100") then o<="0110011";
     elsif (s1="0101") then o<="1011011";
     elsif (s1="0110") then o<="1011111";
     elsif (s1="0111") then o<="1110000";
     elsif (s1="1000") then o<="1111111";  
     elsif (s1="1001") then o<="1111011";
     end  if;
  end process;
o1<=not(o);
end Operation;

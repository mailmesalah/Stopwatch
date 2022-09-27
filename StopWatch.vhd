
-------***Stop Watch (Q no:50)***--------
-------coded by Jenson and Salahudheen----
library ieee;

  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.std_logic_arith.all;
  
----------------------------------------------
entity StopWatch is
  port(
    enable,clr,go,clk:in std_logic;
    q:out std_logic_vector(20 downto 0));
    
end StopWatch;
----------------------------------------------
architecture Operation of StopWatch is

signal x1:std_logic_vector(11 downto 0):="000000000000";

component BCDto7Seg is
  port(
    s:in std_logic_vector(3 downto 0);
    o1:out std_logic_vector(6 downto 0)); 
end component;
  begin
    process(enable,clr,clk,go)
      variable x:std_logic_vector(11 downto 0):="000000000000";
      variable y:std_logic_vector(26 downto 0):="000000000000000000000000000";


      begin
             
        --2500,000 mode counter for generating one sec 
       

 if( clk'event and clk='1') then
	if(y="100110001001011010000000000") then
            
          y:="000000000000000000000000000";
        
       
          if (clr='1')then

            x:="000000000000";
else
                if(go='1')then
          
            if(x(3 downto 0)="1001") then
              x(3 downto 0):="0000";
              if(x(7 downto 4)="1001") then
                x(7 downto 4):="0000";
                if(x(11 downto 8)="1001") then
                  x(11 downto 8):="0000";
                else
                  x(11 downto 8):=x(11 downto 8)+1;
                end if;
              else
                x(7 downto 4):=x(7 downto 4)+1;
              end if;
            else
              x:=x+1;
            end if;  
          end if;
end if;
                  
       
        else
          y:=y+1;
      end if;
end if;
  
  x1<=x;      
    end process;



b1: BCDto7Seg port map(x1(3 downto 0),q(6 downto 0));
b2: BCDto7Seg port map(x1(7 downto 4),q(13 downto 7));
b3: BCDto7Seg port map(x1(11 downto 8),q(20 downto 14));

end Operation; 
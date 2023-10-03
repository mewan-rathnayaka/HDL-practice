library ieee;                                	
use ieee.std_logic_1164.all;           	
                                             		
entity Majority is port (                 	
    A, B, C: in std_logic; 			
    Y: out std_logic);            		
end Majority;                   	

architecture behavioral of Majority is
begin
	Y <= ( (A and B) or (A and C) or (B and C) );

end behavioral;

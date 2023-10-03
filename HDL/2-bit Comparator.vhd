library ieee;                                	
use ieee.std_logic_1164.all;           	
                                             		
entity comparator2 is port (                 	
    A, B: in std_logic_vector(1 downto 0); 
    Equals: out std_logic);            		
end comparator2;    
--use work.gatespkg.all;                         	

architecture struct of comparator2 is
	signal x: std_logic_vector(1 downto 0);
begin
	x(0) <= A(0) xnor B(0);
	x(1) <= A(1) xnor B(1);

	Equals <= x(0) and x(1);
end struct;
    
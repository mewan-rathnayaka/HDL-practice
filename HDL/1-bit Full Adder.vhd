library ieee;
use ieee.std_logic_1164.all;

entity FullAdd is port ( 
A, B, Cin: in std_logic; 
Sum, Cout: out std_logic 
); 
end FullAdd;

architecture behavioral of FullAdd is
begin
	Sum <=  A XOR B XOR Cin;
	Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
end behavioral;

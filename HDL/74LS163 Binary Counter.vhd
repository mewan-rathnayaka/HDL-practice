LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:  in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP: in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:   out std_logic_vector(3 downto 0);            			
    TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;

architecture counter_arch of AAC2M2P1 is begin
	count_proc : process (CP, Q, CET, PE, SR)
	begin	
		TC <= Q(0) and Q(1) and Q(2) and Q(3) and CET;	
		if (rising_edge(CP) and SR = '0') then Q <= "0000";
		elsif (rising_edge(CP)) then
			if (PE = '0') then Q <= P;
			elsif (PE = '1' and CET = '1' and CEP = '1') then
				if (Q /= "1111") then Q <= Q + "0001";
				else Q <= "0000";
				end if;
			end if;
		end if;

	end process count_proc;            		
end architecture counter_Arch;

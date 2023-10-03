library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;


architecture behavioral of FSM is
	type state_available is (A, B, C);
	signal present_state, next_state : state_available;
	
	begin
	process (CLK, RST)
		begin
		if (RST = '1') then
			present_state <= A;
		elsif (rising_edge(CLK)) then
			present_state <= next_state;
		end if;
	end process;

	process (present_state, In1)
	begin
		case present_state is
     		when A =>	--when current state is "A"
			Out1 <= '0';
			if (In1 = '0') then
				next_state <= A;
    			else
      				next_state <= B;
     			end if;  
     		when B =>	--when current state is "B"
			Out1 <= '0';
			if (In1 = '0') then
				next_state <= C;
    			else
      				next_state <= B;
     			end if;
     		when C =>	--when current state is "C"
			Out1 <= '1';
			if (In1 = '0') then
				next_state <= C;
    			else
      				next_state <= A;
     			end if;
		end case;
	end process;
end behavioral;

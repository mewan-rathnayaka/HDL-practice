LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

ARCHITECTURE SPR_Arch OF RAM128_32 IS

	TYPE array_type IS ARRAY (0 TO 128) OF std_logic_vector (31 DOWNTO 0);
	SIGNAL array_reg : array_type;


BEGIN RAM_Proc : PROCESS (clock,  wren,  data, address, q)

	BEGIN
		IF (rising_edge(clock)) THEN
			IF (wren = '1') THEN
				array_reg (to_integer (unsigned (address))) <= data;
			END IF;
		END IF;
		q <= array_reg (to_integer (unsigned (address)));
END PROCESS RAM_Proc;
END ARCHITECTURE SPR_Arch;

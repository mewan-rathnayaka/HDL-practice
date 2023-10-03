library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic;
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;
architecture RTL of FIFO8x9 is
	--signal declarations
	type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);  -- makes use of VHDL’s enumerated type
	signal fifo:  fifo_array;
	signal wrptr, rdptr: unsigned(2 downto 0);
	signal en: std_logic_vector(7 downto 0);
	signal dmuxout: std_logic_vector(8 downto 0);
begin	
	wrptr <= "000"; rdptr <= "000";
	DataOut <= fifo (to_integer (unsigned (rdptr))) when (rden = '1') else "ZZZZZZZZZ";
	fifo (to_integer (unsigned (wrptr))) <= DataIn when (wren = '1') else "000000000";
	rdptr <= (rdptr + "001") when (RdInc = '1');
	wrptr <= (wrptr + "000") when (WrInc = '1');
	rdptr <= "000" when (RdPtrClr = '1');
	wrptr <= "000" when (WrPtrClr = '1');


end RTL;

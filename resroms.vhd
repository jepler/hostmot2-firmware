library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Created from resmods.bin
-- On 11/15/2011

entity resroms is
	port (
	addra: in std_logic_vector(8 downto 0);
	addrb: in std_logic_vector(8 downto 0);
	clk: in std_logic;
	dina: in std_logic_vector(23 downto 0);
	douta: out std_logic_vector(23 downto 0);
	doutb: out std_logic_vector(23 downto 0);
	wea: in std_logic);
end resroms;

architecture syn of resroms is
   type ram_type is array (0 to 511) of std_logic_vector(23 downto 0);
   signal RAM : ram_type := 
   (
   x"000000", x"000000", x"000000", x"1001AA", x"100180",
   x"100043", x"400400", x"B00035", x"850000", x"700025",
   x"320019", x"000000", x"400035", x"700020", x"330029",
   x"400035", x"700024", x"320015", x"400401", x"B90000",
   x"200017", x"490000", x"B00401", x"010000", x"B00400",
   x"40040A", x"000000", x"320006", x"000000", x"000000",
   x"B0040A", x"B0040B", x"100066", x"1000F0", x"100111",
   x"100129", x"10013E", x"B0040C", x"010001", x"C0802E",
   x"200006", x"010003", x"700035", x"32003E", x"E00012",
   x"330032", x"000000", x"000000", x"100156", x"20003D",
   x"E00012", x"330038", x"000000", x"000000", x"10016B",
   x"20003D", x"E00012", x"33003D", x"000000", x"000000",
   x"100180", x"100043", x"010000", x"B00400", x"000000",
   x"000000", x"200006", x"010000", x"B00014", x"010800",
   x"840000", x"000000", x"400014", x"B00407", x"480000",
   x"030000", x"A0002B", x"060000", x"050000", x"050000",
   x"C00021", x"050000", x"880004", x"700029", x"B00018",
   x"40002C", x"E00014", x"33005D", x"400022", x"508018",
   x"000000", x"000000", x"000000", x"400018", x"B00408",
   x"010001", x"C08014", x"E0003A", x"330048", x"000000",
   x"000000", x"280000", x"010E00", x"B0002F", x"400402",
   x"70001D", x"32006D", x"010C00", x"B0002F", x"8C0000",
   x"010040", x"850000", x"400026", x"C0002F", x"840000",
   x"1000A9", x"010050", x"850000", x"400027", x"C0002F",
   x"840000", x"1000A9", x"010060", x"860000", x"010040",
   x"850000", x"010050", x"840000", x"8D0000", x"000000",
   x"490000", x"E80000", x"BA0000", x"490001", x"E80001",
   x"BA0001", x"490002", x"E80002", x"BA0002", x"490003",
   x"E80003", x"BA0003", x"490004", x"E80004", x"BA0004",
   x"490005", x"E80005", x"BA0005", x"490006", x"E80006",
   x"BA0006", x"490007", x"E80007", x"BA0007", x"490008",
   x"E80008", x"BA0008", x"490009", x"E80009", x"BA0009",
   x"49000A", x"E8000A", x"BA000A", x"49000B", x"E8000B",
   x"BA000B", x"000000", x"000000", x"280000", x"400028",
   x"B00014", x"010000", x"B90000", x"B90001", x"B90002",
   x"B90003", x"B90004", x"B90005", x"B90006", x"B90007",
   x"B90008", x"B90009", x"B9000A", x"B9000B", x"480000",
   x"C98000", x"480001", x"C98001", x"480002", x"C98002",
   x"480003", x"C98003", x"480004", x"C98004", x"480005",
   x"C98005", x"480006", x"C98006", x"480007", x"C98007",
   x"480008", x"C98008", x"480009", x"C98009", x"48000A",
   x"C9800A", x"48000B", x"C9800B", x"88000C", x"01FFFF",
   x"C08014", x"3300B8", x"000000", x"000000", x"000000",
   x"280000", x"000000", x"000000", x"010400", x"900032",
   x"060000", x"70002A", x"840000", x"C00012", x"70002A",
   x"850000", x"01003F", x"700032", x"90001F", x"B00033",
   x"490800", x"E80800", x"000000", x"900033", x"060000",
   x"C80800", x"030000", x"B00030", x"000000", x"280000",
   x"010000", x"860000", x"870000", x"8C0000", x"010006",
   x"B00014", x"4A0420", x"BA0088", x"060000", x"C00023",
   x"B00032", x"1000D8", x"4B0060", x"A00030", x"B00018",
   x"4A0088", x"060000", x"B00032", x"1000D8", x"4B0061",
   x"A00030", x"E00018", x"BA0078", x"8A0001", x"8B0002",
   x"01FFFF", x"C08014", x"3300F6", x"8D0000", x"000000",
   x"000000", x"000000", x"280000", x"010000", x"860000",
   x"010006", x"B00014", x"010000", x"EA0078", x"060000",
   x"B00019", x"9A00A0", x"CA8080", x"BA0410", x"B00018",
   x"400019", x"9A00A8", x"000000", x"C00018", x"BA0418",
   x"8A0001", x"01FFFF", x"C08014", x"330115", x"000000",
   x"000000", x"280000", x"010000", x"860000", x"870000",
   x"010006", x"B00014", x"4B0060", x"AB0060", x"B00018",
   x"4B0061", x"AB0061", x"000000", x"C00018", x"BA0098",
   x"8B0002", x"8A0001", x"01FFFF", x"C08014", x"33012E",
   x"000000", x"000000", x"280000", x"010000", x"860000",
   x"B00018", x"400012", x"B00019", x"010006", x"B00014",
   x"4A0098", x"700038", x"33014C", x"BA0080", x"BA0418",
   x"400019", x"508018", x"400019", x"040000", x"B00019",
   x"8A0001", x"01FFFF", x"C08014", x"330145", x"400018",
   x"B0040E", x"280000", x"0101A3", x"B0040D", x"010008",
   x"B00028", x"015000", x"B00037", x"010500", x"B00036",
   x"0100FC", x"B00027", x"010000", x"B00026", x"01015B",
   x"B00404", x"02E14D", x"032804", x"B00402", x"B00039",
   x"01001D", x"B0002C", x"200195", x"010347", x"B0040D",
   x"010008", x"B00028", x"015000", x"B00037", x"010500",
   x"B00036", x"010000", x"B00026", x"01009C", x"B00027",
   x"01068E", x"B00404", x"02014D", x"031804", x"B00402",
   x"B00039", x"010024", x"B0002C", x"200195", x"01068E",
   x"B0040D", x"010005", x"B00028", x"018000", x"B00037",
   x"010800", x"B00036", x"010000", x"B00026", x"010054",
   x"B00027", x"010D1C", x"B00404", x"02014D", x"030B04",
   x"B00402", x"B00039", x"01002D", x"B0002C", x"200195",
   x"010002", x"B00406", x"0100FF", x"B00405", x"013600",
   x"B0002B", x"400037", x"B000A8", x"B000A9", x"B000AA",
   x"B000AB", x"B000AC", x"B000AD", x"400036", x"B000A0",
   x"B000A1", x"B000A2", x"B000A3", x"B000A4", x"B000A5",
   x"280000", x"0100FE", x"B000FF", x"010000", x"840000",
   x"010000", x"B80000", x"880001", x"800000", x"E000FF",
   x"3301AE", x"010012", x"B00000", x"010020", x"B00001",
   x"010001", x"B00002", x"010000", x"B00003", x"024937",
   x"033934", x"B00008", x"010000", x"B00004", x"010000",
   x"B00005", x"0100B3", x"B00006", x"010006", x"B00007",
   x"010000", x"B00400", x"038000", x"B00025", x"03FFFF",
   x"B00038", x"010001", x"B00012", x"010004", x"B0001A",
   x"010008", x"B0001B", x"010020", x"B0001C", x"01003F",
   x"B0040E", x"010100", x"B0001D", x"010200", x"B0001E",
   x"010400", x"B0001F", x"010800", x"B00020", x"011000",
   x"B00021", x"012000", x"B00022", x"024000", x"B00023",
   x"028000", x"B00024", x"01FFFF", x"B00013", x"0103FF",
   x"B0002A", x"010FFF", x"B00029", x"010400", x"B0002D",
   x"010100", x"B0003A", x"280000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"00ABCD");

signal daddra: std_logic_vector(8 downto 0);
signal daddrb: std_logic_vector(8 downto 0);

begin
   aresroms: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (wea = '1') then
            RAM(conv_integer(addra)) <= dina;
         end if;
         daddra <= addra;
         daddrb <= addrb;
      end if; -- clk 
   end process;

   douta <= RAM(conv_integer(daddra));
   doutb <= RAM(conv_integer(daddrb));
end;

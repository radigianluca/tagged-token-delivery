library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.sim_package.all;



entity fir_tb is

end entity fir_tb;

architecture behav of fir_tb is

	-- Constant declarations

	constant HALF_CLK_PERIOD : TIME := 2.00 ns;
	constant TRANSACTION_NUM : INTEGER := 1;
	constant INPUT_end : STRING := "";
	constant OUTPUT_end : STRING := "../VHDL_OUT/output_end.dat";
	constant DATA_WIDTH_end : INTEGER := 32;
	constant INPUT_arg_1 : STRING := "../INPUT_VECTORS/input_arg_1.dat";
	constant OUTPUT_arg_1 : STRING := "";
	constant DATA_WIDTH_arg_1 : INTEGER := 32;

	-- Signal declarations

	signal tb_clk : std_logic := '0';
	signal tb_rst : std_logic := '0';
	signal tb_start_valid : std_logic := '0';
	signal tb_start_ready : std_logic;
	signal tb_arg_valid : std_logic;
	signal tb_arg_ready : std_logic;
	signal tb_end_valid : std_logic;

	signal end_mem_ce0 : std_logic;
	signal end_mem_we0 : std_logic;
	signal end_mem_dout0 : std_logic_vector(DATA_WIDTH_end - 1 downto 0);
	signal end_mem_din0 : std_logic_vector(DATA_WIDTH_end - 1 downto 0);


	signal arg_1_mem_ce0 : std_logic;
	signal arg_1_mem_we0 : std_logic;
	signal arg_1_mem_dout0 : std_logic_vector(DATA_WIDTH_arg_1 - 1 downto 0);
	signal arg_1_mem_din0 : std_logic_vector(DATA_WIDTH_arg_1 - 1 downto 0);



	signal tb_temp_idle : std_logic:= '1';
	shared variable transaction_idx : INTEGER := 0;
	shared variable count_start : INTEGER := 0;
	signal tb_done : std_logic;
	signal temp_start_valid : std_logic;
	signal temp_arg_valid : std_logic;

begin


duv: 	 entity work.fir
		port map (
			clk => tb_clk,
			rst => tb_rst,
			end_out => end_mem_din0,
			end_valid => tb_end_valid,
			end_ready => '1',
			arg_1_valid_in => tb_arg_valid,
			arg_1_din => arg_1_mem_dout0,
			arg_1_ready_out => tb_arg_ready,
			start_in => (others => '0'),
			start_ready => tb_start_ready,
			start_valid => (tb_start_valid and tb_start_ready)
		);


arg_inst_end:	 entity work.single_argument
	generic map(
		TV_IN => INPUT_end,
		TV_OUT => OUTPUT_end,
		DATA_WIDTH => DATA_WIDTH_end
	)
	port map(
		clk => tb_clk,
		rst => tb_rst,
		ce0 => '1',
		we0 => tb_end_valid,
		mem_dout0 => end_mem_dout0,
		mem_din0 => end_mem_din0,
		done => tb_temp_idle
	);

arg_inst_arg_1:	 entity work.single_argument
	generic map(
		TV_IN => INPUT_arg_1,
		TV_OUT => OUTPUT_arg_1,
		DATA_WIDTH => DATA_WIDTH_arg_1
	)
	port map(
		clk => tb_clk,
		rst => tb_rst,
		ce0 => '1',
		we0 => '0',
		mem_dout0 => arg_1_mem_dout0,
		mem_din0 => (others => '0'),
		done => (temp_arg_valid and tb_arg_ready)
	);



----------------------------------------------------------------------------
-- Write "[[[runtime]]]" and "[[[/runtime]]]" for output transactor
write_output_transactor_end_runtime_proc : process
	file fp             : TEXT;
	variable fstatus    : FILE_OPEN_STATUS;
	variable token_line : LINE;
	variable token      : STRING(1 to 1024);

begin
	file_open(fstatus, fp, OUTPUT_end, WRITE_MODE);
	if (fstatus /= OPEN_OK) then
		assert false report "Open file " & OUTPUT_end & " failed!!!" severity note;
		assert false report "ERROR: Simulation using HLS TB failed." severity failure;
	end if;
	write(token_line, string'("[[[runtime]]]"));
	writeline(fp, token_line);
	file_close(fp);
	while tb_done /= '1' loop
		wait until tb_clk'event and tb_clk = '1';
	end loop;
	wait until tb_clk'event and tb_clk = '1';
	wait until tb_clk'event and tb_clk = '1';
	file_open(fstatus, fp, OUTPUT_end, APPEND_MODE);
	if (fstatus /= OPEN_OK) then
		assert false report "Open file " & OUTPUT_end & " failed!!!" severity note;
		assert false report "ERROR: Simulation using HLS TB failed." severity failure;
	end if;
	write(token_line, string'("[[[/runtime]]]"));
	writeline(fp, token_line);
	file_close(fp);
	wait;
end process;
----------------------------------------------------------------------------



generate_sim_done_proc : process
begin
   while (tb_done /= '1') loop
        wait until tb_clk'event and tb_clk = '1';
    end loop;
    wait until tb_clk'event and tb_clk = '1';
    wait until tb_clk'event and tb_clk = '1';
    wait until tb_clk'event and tb_clk = '1';
    assert false report "simulation done!" severity note;
    assert false report "NORMAL EXIT (note: failure is to force the simulator to stop)" severity failure;
    wait;
end process;

----------------------------------------------------------------------------
gen_clock_proc : process
begin
	tb_clk <= '0';
	while (true) loop
		wait for HALF_CLK_PERIOD;
		tb_clk <= not tb_clk;
	end loop;
	wait;
end process;

----------------------------------------------------------------------------
gen_reset_proc : process
begin
	tb_rst <= '1';
	wait for 10 ns;
	tb_rst <= '0';
	wait;
end process;

----------------------------------------------------------------------------
done_proc : process(tb_clk, tb_rst)
variable count : integer := 0;
begin
    if(tb_rst = '1') then
        count := 0;
        tb_done <= '0';
    elsif rising_edge(tb_clk) then
        if(tb_end_valid = '1') then
            count := count + 1;
            if(count = TRANSACTION_NUM) then
	            tb_done <= '1';
            end if;
        end if;
    end if;
end process;

----------------------------------------------------------------------------
generate_idle_signal: process(tb_clk,tb_rst)
begin
   if (tb_rst = '1') then
       tb_temp_idle <= '1';
   else
       tb_temp_idle <= tb_end_valid;
   end if;
end process generate_idle_signal;

----------------------------------------------------------------------------
generate_start_signal : process(tb_clk, tb_rst)
variable count_start : integer := 0;
begin
    if (tb_rst = '1') then
        temp_start_valid <= '0';
        temp_arg_valid <= '0';
        tb_start_valid <= '0';
        tb_arg_valid <= '0';
        count_start := 0;
        transaction_idx := 0;
    elsif rising_edge(tb_clk) then
        if(count_start < TRANSACTION_NUM) then
            --count trans
            if(tb_start_valid = '1' and tb_start_ready = '1') then
                count_start := count_start + 1;
            end if;
            --generate start
            if (count_start < TRANSACTION_NUM) then
                temp_start_valid <= '1';
            else
                temp_start_valid <= '0';
            end if;
        else
            temp_start_valid <= '0';
        end if;
        if(transaction_idx < TRANSACTION_NUM) then
            --count trans
           if(tb_arg_valid = '1' and tb_arg_ready = '1') then
                transaction_idx := transaction_idx + 1;
            end if;
            --gen valid
            if (transaction_idx < TRANSACTION_NUM) then
                temp_arg_valid <= '1';
            else
                temp_arg_valid <= '0';
            end if;
        else
            temp_arg_valid <= '0';
        end if;
        if(count_start < TRANSACTION_NUM) then
            tb_start_valid <= temp_start_valid;
        else
            tb_start_valid <= '0';
        end if;
        if(transaction_idx < TRANSACTION_NUM) then
            tb_arg_valid <= temp_arg_valid;
        else
            tb_arg_valid <= '0';
        end if;
    end if;
end process;

----------------------------------------------------------------------------


end architecture behav;


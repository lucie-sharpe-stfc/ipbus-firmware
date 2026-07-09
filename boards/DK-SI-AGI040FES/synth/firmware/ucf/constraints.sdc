create_clock -name "clk"    -period "100 MHz"    [get_ports "clk"]
create_clock -name "refclk" -period "156.25 MHz" [get_ports "refclk"]

derive_clock_uncertainty

set_false_path -from [get_keepers -no_duplicates {inst_clock_gen|i_nuke_d2}] -to [get_keepers -no_duplicates {inst_clock_gen|i_nuke_d3}]
set_false_path -from [get_keepers -no_duplicates {inst_clock_gen|i_nuke_delay_rtl_0|auto_generated|altera_syncram4|altera_syncram_impl5|q_b[0]}] -to [get_keepers -no_duplicates {inst_clock_gen|i_nuke_d3}]
set_false_path -from [get_keepers -no_duplicates {inst_clock_gen|rst_d1}] -to [get_keepers -no_duplicates {inst_clock_gen|i_mac_rst}]
set_false_path -from [get_keepers -no_duplicates {inst_clock_gen|rst_d1}] -to [get_keepers -no_duplicates {inst_clock_gen|i_ipb_rst}]
set_false_path -from [get_keepers -no_duplicates {inst_clock_gen|rst_d1}] -to [get_keepers -no_duplicates {inst_clock_gen|i_ipb_ctrl_rst}]
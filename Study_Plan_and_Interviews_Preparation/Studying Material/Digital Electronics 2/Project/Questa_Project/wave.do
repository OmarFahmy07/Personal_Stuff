onerror {resume}
radix define fixed#12#decimal#signed -fixed -fraction 12 -signed -base signed -precision 6
radix define fixed#24#decimal#signed -fixed -fraction 24 -signed -base signed -precision 12
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Tx
add wave -noupdate -color Gold /ffe_tb/clk_tb_1M
add wave -noupdate -color Gold -radix fixed#12#decimal#signed /ffe_tb/data_in_tb
add wave -noupdate -color Gold /ffe_tb/data_vld_toggle_tb
add wave -noupdate -divider FFE
add wave -noupdate /ffe_tb/clk_tb_4M
add wave -noupdate /ffe_tb/rst_n_tb
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/data_out_tb
add wave -noupdate /ffe_tb/vld_out_tb
add wave -noupdate /ffe_tb/i
add wave -noupdate /ffe_tb/DUT/u0_ffe/d0
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/d1
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/d2
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/d3
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/acc
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/mul_in_1
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/mul_in_2
add wave -noupdate /ffe_tb/DUT/u0_ffe/mul_out
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/mul_out_trunc
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_ffe/add_out
add wave -noupdate -divider Synchronizer
add wave -noupdate -radix fixed#12#decimal#signed /ffe_tb/DUT/u0_sync/data_sync
add wave -noupdate /ffe_tb/DUT/u0_sync/sync_pulse
add wave -noupdate -divider Controller
add wave -noupdate /ffe_tb/DUT/u0_ctrl/load
add wave -noupdate /ffe_tb/DUT/u0_ctrl/clr
add wave -noupdate /ffe_tb/DUT/u0_ctrl/vld_out
add wave -noupdate /ffe_tb/DUT/u0_ctrl/in_sel
add wave -noupdate /ffe_tb/DUT/u0_ctrl/out_sel
add wave -noupdate /ffe_tb/DUT/u0_ctrl/cycles_cntr
add wave -noupdate /ffe_tb/DUT/u0_ctrl/strt_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1734 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 209
configure wave -valuecolwidth 213
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {104995727 ps} {105000331 ps}


################## Design Compiler Library Files ######################

lappend search_path /home/IC/Labs/Ass_Syn_2.0/std_cells
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl/UART_TX
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl/UART_TOP

set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

## Standard Cell libraries 
set target_library [list $TTLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $TTLIB]  

#echo "###############################################"
#echo "############# Reading RTL Files  ##############"
#echo "###############################################"

#TX
read_file -format verilog mux.v
read_file -format verilog parity_calc.v
read_file -format verilog Serializer.v
read_file -format verilog uart_tx_fsm.v
read_file -format verilog UART_TX.v
#RX
read_file -format verilog data_sampling.v
read_file -format verilog deserializer.v
read_file -format verilog edge_bit_counter.v
read_file -format verilog par_chk.v
read_file -format verilog stp_chk.v
read_file -format verilog strt_chk.v
read_file -format verilog UART_RX.v
read_file -format verilog uart_rx_fsm.v
#UART TOP
read_file -format verilog UART_TOP/UART.v

#################### Liniking All The Design Parts #########################
#echo "###############################################"
#echo "# Linking The Top Module with its submodules  #"
#echo "###############################################"

link 

############# Make unique copies of replicated modules by ##################
############# giving each replicated module a unique name  #############

uniquify

###################### Mapping and optimization ########################"

compile

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -output UART.v



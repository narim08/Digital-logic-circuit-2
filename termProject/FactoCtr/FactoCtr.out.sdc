## Generated SDC file "FactoCtr.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

## DATE    "Fri Dec 01 09:50:21 2023"

##
## DEVICE  "5CGXBC9E6F35C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 15.000 -waveform { 0.000 7.500 } 
create_clock -name {op_start} -period 1.000 -waveform { 0.000 0.500 } [get_ports {op_start}]
create_clock -name {reset_n} -period 1.000 -waveform { 0.000 0.500 } [get_ports {reset_n}]
create_clock -name {state.IDLE} -period 1.000 -waveform { 0.000 0.500 } [get_registers {state.IDLE}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {reset_n}] -rise_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {reset_n}] -fall_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {reset_n}] -rise_to [get_clocks {op_start}]  0.080  
set_clock_uncertainty -rise_from [get_clocks {reset_n}] -fall_to [get_clocks {op_start}]  0.080  
set_clock_uncertainty -fall_from [get_clocks {reset_n}] -rise_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {reset_n}] -fall_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {reset_n}] -rise_to [get_clocks {op_start}]  0.080  
set_clock_uncertainty -fall_from [get_clocks {reset_n}] -fall_to [get_clocks {op_start}]  0.080  
set_clock_uncertainty -rise_from [get_clocks {state.IDLE}] -rise_to [get_clocks {op_start}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {state.IDLE}] -fall_to [get_clocks {op_start}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {state.IDLE}] -rise_to [get_clocks {op_start}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {state.IDLE}] -fall_to [get_clocks {op_start}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {op_start}] -rise_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {op_start}] -fall_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {op_start}] -rise_to [get_clocks {op_start}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {op_start}] -fall_to [get_clocks {op_start}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {op_start}] -rise_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {op_start}] -fall_to [get_clocks {state.IDLE}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {op_start}] -rise_to [get_clocks {op_start}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {op_start}] -fall_to [get_clocks {op_start}] -setup 0.080  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************


# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcsg325-2L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.cache/wt [current_project]
set_property parent.project_path /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/hdl/blinking_wrapper.vhd
add_files /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/blinking.bd
set_property used_in_implementation false [get_files -all /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/ip/blinking_clk_wiz_0_0/blinking_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/ip/blinking_clk_wiz_0_0/blinking_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/ip/blinking_clk_wiz_0_0/blinking_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/ip/blinking_proc_sys_reset_0_0/blinking_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/ip/blinking_proc_sys_reset_0_0/blinking_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/ip/blinking_proc_sys_reset_0_0/blinking_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/blinking_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/jan/git/udp_communication/fpga/config/pins.xdc
set_property used_in_implementation false [get_files /home/jan/git/udp_communication/fpga/config/pins.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top blinking_wrapper -part xc7a35tcsg325-2L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef blinking_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file blinking_wrapper_utilization_synth.rpt -pb blinking_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

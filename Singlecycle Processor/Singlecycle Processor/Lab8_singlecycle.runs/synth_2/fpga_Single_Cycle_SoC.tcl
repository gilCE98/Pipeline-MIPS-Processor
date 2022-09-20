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
create_project -in_memory -part xc7a35tcpg236-2L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.cache/wt [current_project]
set_property parent.project_path C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {{C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/imports/spike/Desktop/CMPE 140/Lab7/memfile.dat}}
read_verilog -library xil_defaultlib {
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/Ad_decoder.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/CMP_ERROR.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/CMP_GT.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/CNT.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/CU.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/DP.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/Factorial.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/Factorial_accelerator.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/GPIO.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/Gpio_mux.v}
  C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/new/HILO.v
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/MUL.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/MUX.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab1/Vivado Files/Assignment_1.srcs/sources_1/new/REG.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/SOC_Decoder.v}
  C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/new/SOC_mux4.v
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/SingleCycle_SOC.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/datapath/adder.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/datapath/alu.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/control_unit/auxdec.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/New folder/basys3_single_cycle_mips_validation/basys3_single_cycle_mips_validation/button_debouncer.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/New folder/basys3_single_cycle_mips_validation/basys3_single_cycle_mips_validation/clk_gen.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/control_unit/controlunit.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/datapath/datapath.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/memory/dmem.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/datapath/dreg.v}
  C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/new/fact_reg.v
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/factorial_and.v}
  C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/new/gpio_ad.v
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/New folder/basys3_single_cycle_mips_validation/basys3_single_cycle_mips_validation/hex_to_7seg.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/hiloregister.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/memory/imem.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/New folder/basys3_single_cycle_mips_validation/basys3_single_cycle_mips_validation/led_mux.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/control_unit/maindec.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/mips/mips.v}
  C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/new/multiplier.v
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/datapath/mux2.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/new/reg_factorial.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/datapath/regfile.v}
  C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/new/shifter.v
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab 5/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/datapath/signext.v}
  {C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/sources_1/imports/CMPE 140/Lab7/project_1/project_1.srcs/sources_1/imports/spike/Downloads/Lab7_Attachment1/MIPS_single_cycle_patched/validation_wrapper/mips_fpga.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/constrs_1/imports/new/SingleCycle_SOC.xdc
set_property used_in_implementation false [get_files C:/Users/Gil/Desktop/Lab8_singlecycle/Lab8_singlecycle/Lab8_singlecycle.srcs/constrs_1/imports/new/SingleCycle_SOC.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top fpga_Single_Cycle_SoC -part xc7a35tcpg236-2L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef fpga_Single_Cycle_SoC.dcp
create_report "synth_2_synth_report_utilization_0" "report_utilization -file fpga_Single_Cycle_SoC_utilization_synth.rpt -pb fpga_Single_Cycle_SoC_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
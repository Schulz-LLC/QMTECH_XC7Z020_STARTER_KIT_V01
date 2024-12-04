connect -url tcp:127.0.0.1:3121
source E:/Xilinx/zynq/Workspace_Starter_Kit_V2_XC7Z020/Project01_PL_MIO_LED/project_1.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 00000000000000"} -index 0
loadhw -hw E:/Xilinx/zynq/Workspace_Starter_Kit_V2_XC7Z020/Project01_PL_MIO_LED/project_1.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 00000000000000"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00000000000000"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00000000000000"} -index 0
dow E:/Xilinx/zynq/Workspace_Starter_Kit_V2_XC7Z020/Project01_PL_MIO_LED/project_1.sdk/MIO_TEST/Debug/MIO_TEST.elf
configparams force-mem-access 0
bpadd -addr &main

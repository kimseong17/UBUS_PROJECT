verdiSetActWin -dock widgetDock_<Decl._Tree>
simSetSimulator "-vcssv" -exec "/DATA/home/edu028/3team/smc_week4/my3_vip/simv" \
           -args \
           "+UVM_TESTNAME=ubus_write_test +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
debImport "-dbdir" "/DATA/home/edu028/3team/smc_week4/my3_vip/simv.daidir"
debLoadSimResult /DATA/home/edu028/3team/smc_week4/my3_vip/wave.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "372" "122" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top"
verdiSetActWin -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top/vif"
wvSetPosition -win $_nWave2 {("vif" 0)}
wvRenameGroup -win $_nWave2 {G1} {vif}
wvAddSignal -win $_nWave2 "/my3_testbench_top/vif/ubus_clock" \
           "/my3_testbench_top/vif/ubus_reset" \
           "/my3_testbench_top/vif/ubus_addr\[15:0\]" \
           "/my3_testbench_top/vif/ubus_size\[1:0\]" \
           "/my3_testbench_top/vif/ubus_read" \
           "/my3_testbench_top/vif/ubus_write" \
           "/my3_testbench_top/vif/ubus_bip" \
           "/my3_testbench_top/vif/ubus_data\[7:0\]" \
           "/my3_testbench_top/vif/ubus_wait" \
           "/my3_testbench_top/vif/ubus_error"
wvSetPosition -win $_nWave2 {("vif" 0)}
wvSetPosition -win $_nWave2 {("vif" 10)}
wvSetPosition -win $_nWave2 {("vif" 10)}
wvSetPosition -win $_nWave2 {("vif" 10)}
wvSetPosition -win $_nWave2 {("vif" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"vif" \
{/my3_testbench_top/vif/ubus_clock} \
{/my3_testbench_top/vif/ubus_reset} \
{/my3_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_testbench_top/vif/ubus_read} \
{/my3_testbench_top/vif/ubus_write} \
{/my3_testbench_top/vif/ubus_bip} \
{/my3_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_testbench_top/vif/ubus_wait} \
{/my3_testbench_top/vif/ubus_error} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSetPosition -win $_nWave2 {("vif" 10)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top"
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top/vif"
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top/vif"
wvSetPosition -win $_nWave2 {("vif" 10)}
wvSetPosition -win $_nWave2 {("vif" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"vif" \
{/my3_testbench_top/vif/ubus_clock} \
{/my3_testbench_top/vif/ubus_reset} \
{/my3_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_testbench_top/vif/ubus_read} \
{/my3_testbench_top/vif/ubus_write} \
{/my3_testbench_top/vif/ubus_bip} \
{/my3_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_testbench_top/vif/ubus_wait} \
{/my3_testbench_top/vif/ubus_error} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSetPosition -win $_nWave2 {("vif" 10)}
wvGetSignalClose -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiSetActWin -win $_nWave2
srcHBSelect "my3_testbench_top.vif" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
srcHBSelect "my3_testbench_top.vif.MASTER" -win $_nTrace1
srcHBSelect "my3_testbench_top.vif.MASTER" -win $_nTrace1
srcSetScope "my3_testbench_top.vif.MASTER" -delim "." -win $_nTrace1
srcHBSelect "my3_testbench_top.vif.MASTER" -win $_nTrace1
verdiSetActWin -win $_nWave2
wvScrollUp -win $_nWave2 1
srcHBSelect "uvm_custom_install_recording" -win $_nTrace1
srcSetScope "my3_testbench_top.vif.SLAVE" -delim "." -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debExit

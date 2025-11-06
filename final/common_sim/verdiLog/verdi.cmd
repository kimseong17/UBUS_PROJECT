simSetSimulator "-vcssv" -exec "/DATA/home/edu010/3team/final/common_sim/simv" \
           -args \
           "+UVM_TESTNAME=ubus_write_test +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
debImport "-simv" "simv" "-dbdir" \
          "/DATA/home/edu010/3team/final/common_sim/simv.daidir"
debLoadSimResult /DATA/home/edu010/3team/final/common_sim/wave.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "8" "31" "928" "174"
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top"
verdiSetActWin -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top/vif"
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_testbench_top/vif/ubus_bip} \
{/my3_testbench_top/vif/ubus_clock} \
{/my3_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_testbench_top/vif/ubus_error} \
{/my3_testbench_top/vif/ubus_read} \
{/my3_testbench_top/vif/ubus_reset} \
{/my3_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_testbench_top/vif/ubus_wait} \
{/my3_testbench_top/vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_testbench_top/vif/ubus_bip} \
{/my3_testbench_top/vif/ubus_clock} \
{/my3_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_testbench_top/vif/ubus_error} \
{/my3_testbench_top/vif/ubus_read} \
{/my3_testbench_top/vif/ubus_reset} \
{/my3_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_testbench_top/vif/ubus_wait} \
{/my3_testbench_top/vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvGetSignalClose -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 27.487946 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 35.518132 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 68.256584 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 57.446718 -snap {("G1" 4)}
debExit

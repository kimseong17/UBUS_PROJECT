verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec "/DATA/home/edu028/3team/smc_week4/sim/simv" -args \
           "+ntb_random_seed=1 +UVM_TESTNAME=ubus_write_test +UVM_VERBOSITY=UVM_HIGH + + +UVM_TR_RECORD +UVM_LOG_RECORD +COUNT=10"
debImport "-dbdir" "/DATA/home/edu028/3team/smc_week4/sim/simv.daidir"
debLoadSimResult /DATA/home/edu028/3team/smc_week4/sim/wave.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "510" "190" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
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
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 58644.320138 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 106780.120482 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 30508.605852 -snap {("G1" 4)}

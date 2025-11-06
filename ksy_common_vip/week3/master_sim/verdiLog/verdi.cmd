verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec \
           "/DATA/home/edu010/3team/ksy_common_vip/week3/master_sim/simv" \
           -args "+UVM_TESTNAME=my3_vip_master_test +UVM_VERBOSITY=UVM_HIGH"
debImport "-dbdir" \
          "/DATA/home/edu010/3team/ksy_common_vip/week3/master_sim/simv.daidir"
debLoadSimResult \
           /DATA/home/edu010/3team/ksy_common_vip/week3/master_sim/wave.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "510" "190" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSelectGroup -win $_nWave2 {G1}
verdiSetActWin -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_master_testbench_top"
wvGetSignalSetScope -win $_nWave2 "/my3_master_testbench_top/vif"
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_master_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_master_testbench_top/vif/ubus_bip} \
{/my3_master_testbench_top/vif/ubus_clock} \
{/my3_master_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_master_testbench_top/vif/ubus_error} \
{/my3_master_testbench_top/vif/ubus_read} \
{/my3_master_testbench_top/vif/ubus_reset} \
{/my3_master_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_master_testbench_top/vif/ubus_wait} \
{/my3_master_testbench_top/vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_master_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_master_testbench_top/vif/ubus_bip} \
{/my3_master_testbench_top/vif/ubus_clock} \
{/my3_master_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_master_testbench_top/vif/ubus_error} \
{/my3_master_testbench_top/vif/ubus_read} \
{/my3_master_testbench_top/vif/ubus_reset} \
{/my3_master_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_master_testbench_top/vif/ubus_wait} \
{/my3_master_testbench_top/vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 6.370124 -snap {("G1" 9)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 51.425952 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 51.425952 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 36.945487 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 24.630324 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 37.622144 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 41.005430 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 57.245205 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 45.065374 -snap {("G1" 6)}
debExit

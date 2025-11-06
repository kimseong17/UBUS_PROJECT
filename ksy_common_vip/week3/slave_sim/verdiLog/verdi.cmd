verdiSetActWin -dock widgetDock_<Message>
debImport "wave.fsdb"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/DATA/home/edu010/3team/ksy_common_vip/week3/slave_sim/wave.fsdb}
verdiWindowResize -win $_Verdi_1 "510" "190" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_slave_testbench_top"
wvGetSignalSetScope -win $_nWave2 "/my3_slave_testbench_top/vif"
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_slave_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_slave_testbench_top/vif/ubus_bip} \
{/my3_slave_testbench_top/vif/ubus_clock} \
{/my3_slave_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_slave_testbench_top/vif/ubus_error} \
{/my3_slave_testbench_top/vif/ubus_read} \
{/my3_slave_testbench_top/vif/ubus_reset} \
{/my3_slave_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_slave_testbench_top/vif/ubus_wait} \
{/my3_slave_testbench_top/vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_slave_testbench_top/vif/ubus_addr\[15:0\]} \
{/my3_slave_testbench_top/vif/ubus_bip} \
{/my3_slave_testbench_top/vif/ubus_clock} \
{/my3_slave_testbench_top/vif/ubus_data\[7:0\]} \
{/my3_slave_testbench_top/vif/ubus_error} \
{/my3_slave_testbench_top/vif/ubus_read} \
{/my3_slave_testbench_top/vif/ubus_reset} \
{/my3_slave_testbench_top/vif/ubus_size\[1:0\]} \
{/my3_slave_testbench_top/vif/ubus_wait} \
{/my3_slave_testbench_top/vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
debExit

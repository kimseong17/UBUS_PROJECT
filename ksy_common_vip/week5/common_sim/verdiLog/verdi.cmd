verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec \
           "/DATA/home/edu010/3team/ksy_common_vip/week5/common_sim/simv" \
           -args \
           "+UVM_TESTNAME=ubus_virtual_sequence_test +N_REPEAT=4 +ntb_random_seed_verbose +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE -cm_dir ubus_cov.vdb"
debImport "-simv" "simv" "-dbdir" \
          "/DATA/home/edu010/3team/ksy_common_vip/week5/common_sim/simv.daidir"
debLoadSimResult \
           /DATA/home/edu010/3team/ksy_common_vip/week5/common_sim/wave.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "510" "190" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top"
verdiSetActWin -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/my3_testbench_top/m_vif"
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_testbench_top/m_vif/ubus_addr\[15:0\]} \
{/my3_testbench_top/m_vif/ubus_bip} \
{/my3_testbench_top/m_vif/ubus_clock} \
{/my3_testbench_top/m_vif/ubus_data\[7:0\]} \
{/my3_testbench_top/m_vif/ubus_error} \
{/my3_testbench_top/m_vif/ubus_read} \
{/my3_testbench_top/m_vif/ubus_reset} \
{/my3_testbench_top/m_vif/ubus_size\[2:0\]} \
{/my3_testbench_top/m_vif/ubus_wait} \
{/my3_testbench_top/m_vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/my3_testbench_top/m_vif/ubus_addr\[15:0\]} \
{/my3_testbench_top/m_vif/ubus_bip} \
{/my3_testbench_top/m_vif/ubus_clock} \
{/my3_testbench_top/m_vif/ubus_data\[7:0\]} \
{/my3_testbench_top/m_vif/ubus_error} \
{/my3_testbench_top/m_vif/ubus_read} \
{/my3_testbench_top/m_vif/ubus_reset} \
{/my3_testbench_top/m_vif/ubus_size\[2:0\]} \
{/my3_testbench_top/m_vif/ubus_wait} \
{/my3_testbench_top/m_vif/ubus_write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvGetSignalClose -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 103.750135 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 221.666956 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 324.583757 -snap {("G1" 9)}
debExit

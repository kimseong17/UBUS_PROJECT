verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec \
           "/DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/simv" \
           -args \
           "+UVM_TESTNAME=ubus_write_test +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
debImport "-simv" "simv" "-dbdir" \
          "/DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/simv.daidir"
debLoadSimResult \
           /DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/wave.fsdb
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
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 379.805238 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 395.202748 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 402.901502 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 472.831859 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 438.829025 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 424.714641 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 394.561185 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 419.582138 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 457.434349 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 415.732760 -snap {("G1" 3)}
verdiWindowWorkMode -win $_Verdi_1 -transactionDebug
verdiSetActWin -win $_tRelation_5
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
verdiSetActWin -win $_tProtocolAnalyzer_3
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top/env"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top/env"
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabExpandAllHierTree -win $_pabWnd3
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/s_agent/sequencer"
pabDropEvent -win $_pabWnd3 -add \
           "\$trans_root/uvm_test_top/env/s_agent/sequencer"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/sequencer"
pabDropEvent -win $_pabWnd3 -add \
           "\$trans_root/uvm_test_top/env/m_agent/sequencer"
pabCursorSelection -win $_pabWnd3 -cursorTime 365.966502
pabSelectObject -win $_pabWnd3 -objId 91 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 404.489292
pabSelectObject -win $_pabWnd3 -objId 116 -columnIndexes 0
pabCursorSelection -win $_pabWnd3 -cursorTime 389.850632
pabSelectObject -win $_pabWnd3 -objId 91 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 27.736409
pabSelectObject -win $_pabWnd3 -objId 17 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 127.895662
pabSelectObject -win $_pabWnd3 -objId 41 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 19.261395
pabSelectObject -win $_pabWnd3 -objId 19 -columnIndexes 0
pabCursorSelection -win $_pabWnd3 -cursorTime 48.538715
pabSelectObject -win $_pabWnd3 -objId 24 -columnIndexes 0
pabCursorSelection -win $_pabWnd3 -cursorTime 65.488742
pabSelectObject -win $_pabWnd3 -objId 29 -columnIndexes 0
pabCursorSelection -win $_pabWnd3 -cursorTime 10.786381
pabSelectObject -win $_pabWnd3 -objId 17 -columnIndexes 1
debExit

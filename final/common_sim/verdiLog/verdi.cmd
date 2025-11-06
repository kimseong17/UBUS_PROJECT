simSetSimulator "-vcssv" -exec \
           "/DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/simv" \
           -args \
           "+UVM_TESTNAME=ubus_write_test +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
debImport "-simv" "simv" "-dbdir" \
          "/DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/simv.daidir"
debLoadSimResult \
           /DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/wave.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "8" "31" "928" "174"
verdiSetActWin -win $_nWave2
verdiWindowWorkMode -win $_Verdi_1 -transactionDebug
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
verdiSetActWin -win $_tProtocolAnalyzer_3
pabExpandAllHierTree -win $_pabWnd3
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/driver"
pabDropEvent -win $_pabWnd3 -add "\$trans_root/uvm_test_top/env/m_agent/driver"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/monitor"
pabDropEvent -win $_pabWnd3 -add "\$trans_root/uvm_test_top/env/m_agent/monitor"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/s_agent/monitor"
pabDropEvent -win $_pabWnd3 -add "\$trans_root/uvm_test_top/env/s_agent/monitor"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/s_agent/sequencer"
pabDropEvent -win $_pabWnd3 -add \
           "\$trans_root/uvm_test_top/env/s_agent/sequencer"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/sequencer"
pabDropEvent -win $_pabWnd3 -add \
           "\$trans_root/uvm_test_top/env/m_agent/sequencer"
wvCreateWindow
wvSetPosition -win $_nWave6 {("G1" 0)}
wvOpenFile -win $_nWave6 \
           {/DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/wave.fsdb}
wvGetSignalOpen -win $_nWave6
wvGetSignalSetScope -win $_nWave6 "/my3_testbench_top"
wvGetSignalSetScope -win $_nWave6 "/my3_testbench_top/vif"
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"G1" \
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
wvAddSignal -win $_nWave6 -group {"G2" \
}
wvSelectSignal -win $_nWave6 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"G1" \
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
wvAddSignal -win $_nWave6 -group {"G2" \
}
wvSelectSignal -win $_nWave6 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave6 {("G1" 10)}
wvGetSignalClose -win $_nWave6
wvZoomIn -win $_nWave6
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/s_agent/sequencer"
verdiSetActWin -win $_tProtocolAnalyzer_3
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomIn -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvZoomIn -win $_nWave6
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/sequencer"
verdiSetActWin -win $_tProtocolAnalyzer_3
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/monitor"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/driver"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/monitor"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/m_agent/sequencer"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/s_agent/sequencer"
wvSetCursor -win $_nWave6 13.105187 -snap {("G1" 9)}
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 35.510828 -snap {("G1" 3)}
wvSetCursor -win $_nWave6 15.641674 -snap {("G1" 3)}
wvSetCursor -win $_nWave6 32.128844 -snap {("G1" 3)}
wvSetCursor -win $_nWave6 33.397088 -snap {("G1" 3)}

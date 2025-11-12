<<<<<<< HEAD
verdiSetActWin -dock widgetDock_<Decl._Tree>
simSetSimulator "-vcssv" -exec "/DATA/home/edu028/3team/final/common_sim/simv" \
           -args \
           "+UVM_TESTNAME=ubus_write_test +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
debImport "-dbdir" "/DATA/home/edu028/3team/final/common_sim/simv.daidir"
debLoadSimResult /DATA/home/edu028/3team/final/common_sim/wave.fsdb
=======
verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec \
           "/DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/simv" \
           -args \
           "+UVM_TESTNAME=ubus_write_test +N_REPEAT=8 +ntb_random_seed=18 +ntb_random_seed_verbose +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE"
debImport "-simv" "simv" "-dbdir" \
          "/DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/simv.daidir"
debLoadSimResult \
           /DATA/home/edu010/3team/ksy_common_vip/week4/common_sim/wave.fsdb
>>>>>>> bf314f3ebf1cb147553b9ee472b6072dca1f0606
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "510" "175" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
<<<<<<< HEAD
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "my3_testbench_top.vif" -win $_nTrace1
srcSetScope "my3_testbench_top.vif" -delim "." -win $_nTrace1
srcHBSelect "my3_testbench_top.vif" -win $_nTrace1
=======
>>>>>>> bf314f3ebf1cb147553b9ee472b6072dca1f0606
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
wvGetSignalClose -win $_nWave2
<<<<<<< HEAD
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
=======
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 204.911790 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 210.242828 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 234.565691 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 139.606569 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 218.572576 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 435.479203 -snap {("G1" 7)}
debExit
>>>>>>> bf314f3ebf1cb147553b9ee472b6072dca1f0606

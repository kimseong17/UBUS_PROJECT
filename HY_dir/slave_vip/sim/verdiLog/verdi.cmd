verdiSetActWin -dock widgetDock_<Watch>
debImport "slave_test.fsdb"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/DATA/home/edu014/HY_UVM/HY_dir/slave_vip/sim/slave_test.fsdb}
verdiWindowResize -win $_Verdi_1 "8" "31" "1920" "1009"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/slave_tb_top"
verdiSetActWin -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/slave_tb_top/vif"
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/slave_tb_top/vif/addr\[15:0\]} \
{/slave_tb_top/vif/bip} \
{/slave_tb_top/vif/clk} \
{/slave_tb_top/vif/data\[7:0\]} \
{/slave_tb_top/vif/error} \
{/slave_tb_top/vif/read} \
{/slave_tb_top/vif/rst} \
{/slave_tb_top/vif/size\[1:0\]} \
{/slave_tb_top/vif/wait_state} \
{/slave_tb_top/vif/write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/slave_tb_top/vif/addr\[15:0\]} \
{/slave_tb_top/vif/bip} \
{/slave_tb_top/vif/clk} \
{/slave_tb_top/vif/data\[7:0\]} \
{/slave_tb_top/vif/error} \
{/slave_tb_top/vif/read} \
{/slave_tb_top/vif/rst} \
{/slave_tb_top/vif/size\[1:0\]} \
{/slave_tb_top/vif/wait_state} \
{/slave_tb_top/vif/write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
srcSignalView -off
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSetCursor -win $_nWave2 3783.492063 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 1410.793651 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3078.095238 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 3078.095238 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 4040.000000 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 4360.634921 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 4488.888889 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 4553.015873 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 4488.888889 -snap {("G1" 9)}
debExit

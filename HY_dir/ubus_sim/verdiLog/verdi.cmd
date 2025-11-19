verdiSetActWin -dock widgetDock_<Message>
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/DATA/home/ins007/UVM_PRJ/3team/HY_dir/ubus_sim/ubus_test.fsdb}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/ubus_tb_top"
wvGetSignalSetScope -win $_nWave2 "/ubus_tb_top/vif"
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/ubus_tb_top/vif/addr\[15:0\]} \
{/ubus_tb_top/vif/bip} \
{/ubus_tb_top/vif/clk} \
{/ubus_tb_top/vif/data\[7:0\]} \
{/ubus_tb_top/vif/error} \
{/ubus_tb_top/vif/read} \
{/ubus_tb_top/vif/rst} \
{/ubus_tb_top/vif/size\[1:0\]} \
{/ubus_tb_top/vif/wait_state} \
{/ubus_tb_top/vif/write} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetCursor -win $_nWave2 90391.258153 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 44975.877234 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 121889.022340 -snap {("G2" 0)}
debExit

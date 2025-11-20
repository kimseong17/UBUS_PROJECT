verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/mission_4/sim/simv" \
           -args
debImport "-dbdir" \
          "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/mission_4/sim/simv.daidir"
debLoadSimResult \
           /DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/mission_4/sim/sim.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "510" "190" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top"
verdiSetActWin -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/pclk} \
{/tb_top/presetn} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvGetSignalSetScope -win $_nWave2 "/tb_top/apb_if"
wvGetSignalSetScope -win $_nWave2 "/tb_top/apb_if/tb_if"
wvGetSignalSetScope -win $_nWave2 "/tb_top/prog"
wvGetSignalSetScope -win $_nWave2 "/tb_top/prog/apb_if"
wvGetSignalSetScope -win $_nWave2 "/tb_top/u0"
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/pclk} \
{/tb_top/presetn} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_top/u0/pre_pready} \
{/tb_top/u0/pready} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/pclk} \
{/tb_top/presetn} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_top/u0/pre_pready} \
{/tb_top/u0/pready} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave2 {("G2" 2)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
verdiWindowResize -win $_Verdi_1 "538" "606" "900" "700"
debExit

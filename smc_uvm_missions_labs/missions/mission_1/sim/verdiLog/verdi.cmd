verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec "simv" -args "-1 sim.log"
debImport "-dbdir" "simv.daidir"
debLoadSimResult /DATA/home/edu028/UVM_TB/missions/mission_1/sim/verilog_sim.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_verilog"
verdiSetActWin -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
{/tb_verilog/pwrite} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
{/tb_verilog/pwrite} \
{/tb_verilog/paddr\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
{/tb_verilog/pwrite} \
{/tb_verilog/paddr\[7:0\]} \
{/tb_verilog/penable} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
verdiWindowResize -win $_Verdi_1 "59" "34" "892" "703"
wvSetCursor -win $_nWave2 42730.769231 -snap {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
{/tb_verilog/pwrite} \
{/tb_verilog/paddr\[7:0\]} \
{/tb_verilog/penable} \
{/tb_verilog/pready} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
{/tb_verilog/pwrite} \
{/tb_verilog/paddr\[7:0\]} \
{/tb_verilog/penable} \
{/tb_verilog/pready} \
{/tb_verilog/pwdata\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
{/tb_verilog/pwrite} \
{/tb_verilog/paddr\[7:0\]} \
{/tb_verilog/penable} \
{/tb_verilog/pready} \
{/tb_verilog/pwdata\[31:0\]} \
{/tb_verilog/prdata\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_verilog/pclk} \
{/tb_verilog/presetn} \
{/tb_verilog/pselx} \
{/tb_verilog/pwrite} \
{/tb_verilog/paddr\[7:0\]} \
{/tb_verilog/penable} \
{/tb_verilog/pready} \
{/tb_verilog/pwdata\[31:0\]} \
{/tb_verilog/prdata\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetPosition -win $_nWave2 {("G1" 9)}
wvGetSignalClose -win $_nWave2
debExit

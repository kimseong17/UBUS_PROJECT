simSetSimulator "-vcssv" -exec "simv" -args -uvmDebug on
debImport "-sverilog" "-ntb_opts" "uvm-1.2" "../../rtl/router.sv" \
          "../../rtl/router_io.sv" "../../rtl/ral/host_io.sv" \
          "../../rtl/reset_io.sv" "../../rtl/router_test_top.sv" \
          "./packages/router_stimulus_pkg.sv" "./packages/router_env_pkg.sv" \
          "./packages/router_test_pkg.sv" "./test.sv" "-l" "simv.log" \
          "+UVM_TESTNAME=test_base" "+UVM_VERBOSITY=UVM_MEDIUM" "+" "+" \
          "+UVM_TR_RECORD" "+UVM_LOG_RECORD" "+ntb_random_seed=1"
debLoadSimResult \
           ./novas.fsdb
wvCreateWindow
srcHBSelect "router_test_top.reset_if" -win $_nTrace1
wvAddSubGroup -win $_nWave2 -holdpost {reset_if(reset_io)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1/reset_if(reset_io)" 0)}
wvAddSignal -win $_nWave2 "/router_test_top/reset_if/clk" \
           "/router_test_top/reset_if/reset_n"
wvSetPosition -win $_nWave2 {("G1/reset_if(reset_io)" 0)}
wvSetPosition -win $_nWave2 {("G1/reset_if(reset_io)" 2)}
wvSetPosition -win $_nWave2 {("G1/reset_if(reset_io)" 2)}
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect "router_test_top.router_if" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1/reset_if(reset_io)" 0)}
wvSetPosition -win $_nWave2 {("G1/reset_if(reset_io)" 1)}
wvSetPosition -win $_nWave2 {("G1/reset_if(reset_io)" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSubGroup -win $_nWave2 -holdpost {router_if(router_io)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2/router_if(router_io)" 0)}
wvAddSignal -win $_nWave2 "/router_test_top/router_if/clk" \
           "/router_test_top/router_if/frame_n\[15:0\]" \
           "/router_test_top/router_if/valid_n\[15:0\]" \
           "/router_test_top/router_if/din\[15:0\]" \
           "/router_test_top/router_if/dout\[15:0\]" \
           "/router_test_top/router_if/busy_n\[15:0\]" \
           "/router_test_top/router_if/valido_n\[15:0\]" \
           "/router_test_top/router_if/frameo_n\[15:0\]"
wvSetPosition -win $_nWave2 {("G2/router_if(router_io)" 0)}
wvSetPosition -win $_nWave2 {("G2/router_if(router_io)" 8)}
wvSetPosition -win $_nWave2 {("G2/router_if(router_io)" 8)}
wvSetPosition -win $_nWave2 {("G2" 0)}
verdiWindowResize -win Verdi_1 "213" "221" "983" "693"
verdiWindowResize -win Verdi_1 "213" "221" "983" "832"
wvSelectSignal -win $_nWave2 {( "G2/router_if(router_io)" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2/router_if(router_io)" 8 )} 
wvSetPosition -win $_nWave2 {("G2/router_if(router_io)" 8)}
wvExpandBus -win $_nWave2 {("G2/router_if(router_io)" 8)}
wvZoomAll -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 68559.488636 -snap {("router_if(router_io)" 15)}
wvZoom -win $_nWave2 15235.441919 29884.905303
wvSetCursor -win $_nWave2 15457.403486 -snap {("router_if(router_io)" 24)}
wvSetCursor -win $_nWave2 582.558859 -snap {("router_if(router_io)" 24)}
wvSetCursor -win $_nWave2 2293.602853 -snap {("router_if(router_io)" 23)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 192908.775253 231345.486111
wvSetCursor -win $_nWave2 25721.536307 -snap {("router_if(router_io)" 23)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "router_test_top.router_if" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
verdiWindowWorkMode -win $_Verdi_1 -transactionDebug
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
verdiSetActWin -win $_tProtocolAnalyzer_3
pabHierTreeExpandItem -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top/env"
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top/env/r_agt"
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top/env/i_agt"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier \
           "\$trans_root/uvm_test_top/env/i_agt"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/i_agt/drv"
pabHierTreeDoubleClick -win $_pabWnd3
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/i_agt/sqr"
pabHierTreeDoubleClick -win $_pabWnd3
pabCursorSelection -win $_pabWnd3 -cursorTime 23213.909782
pabClearObjSelection -win $_pabWnd3
pabHierTreeExpandItem -win $_pabWnd3 -selectHier \
           "\$trans_root/uvm_test_top/env/r_agt"
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/r_agt/sqr"
pabHierTreeDoubleClick -win $_pabWnd3
pabCursorSelection -win $_pabWnd3 -cursorTime 24564.860689
pabSelectObject -win $_pabWnd3 -objId 30 -columnIndexes 1
pabZoomSelected -win $_pabWnd3
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/i_agt/drv"
pabCursorSelection -win $_pabWnd3 -cursorTime 44727.925532
pabSelectObject -win $_pabWnd3 -objId 32 -columnIndexes 0
pabHierTreeCollapseItem -win $_pabWnd3 -selectHier \
           "\$trans_root/uvm_test_top/env/i_agt"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier \
           "\$trans_root/uvm_test_top/env/i_agt"
pabHierTreeCollapseItem -win $_pabWnd3 -selectHier \
           "\$trans_root/uvm_test_top/env/i_agt"
pabHierTreeCollapseItem -win $_pabWnd3 -selectHier \
           "\$trans_root/uvm_test_top/env"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top/env"
pabHierTreeCollapseItem -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabHierTreeExpandItem -win $_pabWnd3 -selectHier \
           "\$trans_root/uvm_test_top/env/i_agt"
verdiDockWidgetMaximize -dock windowDock_tTableView_4
verdiSetActWin -win $_tTableView_4
wvCreateWindow
verdiWindowWorkMode -win $_Verdi_1 -transactionDebug
verdiSetActWin -win $_tRelation_5
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/i_agt/sqr"
pabHierTreeDoubleClick -win $_pabWnd3
verdiSetActWin -win $_tProtocolAnalyzer_3
pabScrollDrawArea -win $_pabWnd3 -vScroll 86 -hScroll -1
pabCursorSelection -win $_pabWnd3 -cursorTime 85196.048632
pabViewAllColumn -win $_pabWnd3
wvCreateWindow
wvSetPosition -win $_nWave7 {("G1" 0)}
wvOpenFile -win $_nWave7 \
           {/DATA/home/edu028/UVM_TB/uvm_tb_missions/missions/solutions/lab3/novas.fsdb}
wvGetSignalOpen -win $_nWave7
wvGetSignalSetScope -win $_nWave7 "/_vcs_msglog"
wvGetSignalSetScope -win $_nWave7 "/router_test_top/router_if"
wvSetPosition -win $_nWave7 {("G1" 8)}
wvSetPosition -win $_nWave7 {("G1" 8)}
wvAddSignal -win $_nWave7 -clear
wvAddSignal -win $_nWave7 -group {"G1" \
{/router_test_top/router_if/busy_n\[15:0\]} \
{/router_test_top/router_if/clk} \
{/router_test_top/router_if/din\[15:0\]} \
{/router_test_top/router_if/dout\[15:0\]} \
{/router_test_top/router_if/frame_n\[15:0\]} \
{/router_test_top/router_if/frameo_n\[15:0\]} \
{/router_test_top/router_if/valid_n\[15:0\]} \
{/router_test_top/router_if/valido_n\[15:0\]} \
}
wvAddSignal -win $_nWave7 -group {"G2" \
}
wvSelectSignal -win $_nWave7 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave7 {("G1" 8)}
wvSetPosition -win $_nWave7 {("G1" 8)}
wvSetPosition -win $_nWave7 {("G1" 8)}
wvAddSignal -win $_nWave7 -clear
wvAddSignal -win $_nWave7 -group {"G1" \
{/router_test_top/router_if/busy_n\[15:0\]} \
{/router_test_top/router_if/clk} \
{/router_test_top/router_if/din\[15:0\]} \
{/router_test_top/router_if/dout\[15:0\]} \
{/router_test_top/router_if/frame_n\[15:0\]} \
{/router_test_top/router_if/frameo_n\[15:0\]} \
{/router_test_top/router_if/valid_n\[15:0\]} \
{/router_test_top/router_if/valido_n\[15:0\]} \
}
wvAddSignal -win $_nWave7 -group {"G2" \
}
wvSelectSignal -win $_nWave7 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave7 {("G1" 8)}
wvGetSignalClose -win $_nWave7
wvSetPosition -win $_nWave7 {("G1" 3)}
wvExpandBus -win $_nWave7
wvSetPosition -win $_nWave7 {("G1" 24)}
wvScrollUp -win $_nWave7 9
wvScrollDown -win $_nWave7 7
wvScrollDown -win $_nWave7 9
wvSelectSignal -win $_nWave7 {( "G1" 20 )} 
wvSelectSignal -win $_nWave7 {( "G1" 20 )} 
wvSetPosition -win $_nWave7 {("G1" 20)}
wvExpandBus -win $_nWave7
wvSetPosition -win $_nWave7 {("G1" 40)}
wvScrollUp -win $_nWave7 1
wvScrollUp -win $_nWave7 21
wvScrollUp -win $_nWave7 4
wvScrollDown -win $_nWave7 32
wvScrollUp -win $_nWave7 32
debExit

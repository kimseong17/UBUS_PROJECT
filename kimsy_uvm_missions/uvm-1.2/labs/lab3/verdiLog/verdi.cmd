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
verdiWindowWorkMode -win $_Verdi_1 -transactionDebug
verdiSetActWin -win $_tProtocolAnalyzer_3
pabExpandAllHierTree -win $_pabWnd3
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top/env"
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root"
pabHierTree -win $_pabWnd3 -selectHier "\$trans_root/uvm_test_top"
pabExpandAllHierTree -win $_pabWnd3
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/i_agt/sqr"
pabDropEvent -win $_pabWnd3 -add "\$trans_root/uvm_test_top/env/i_agt/sqr"
verdiWindowResize -win $_Verdi_1 "8" "31" "901" "566"
pabCursorSelection -win $_pabWnd3 -cursorTime 19240.458539
pabSelectObject -win $_pabWnd3 -objId 30 -columnIndexes 0
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 10
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 20
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 31
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 41
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 51
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 61
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 92
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 143
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 174
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 215
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 266
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 338
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 379
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 420
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 461
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 522
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 573
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 645
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 737
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 808
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 880
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 931
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1013
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1125
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1196
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1268
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1339
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1411
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1492
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1574
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1656
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1737
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1829
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1921
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2002
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2074
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2155
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2227
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2318
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2410
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2492
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2593
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2716
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2828
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2919
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2980
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3031
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3092
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3143
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3204
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3244
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3285
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3315
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3366
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3437
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3498
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3558
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3629
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3680
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3710
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3741
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3774
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3794
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3814
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3834
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3844
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3864
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3884
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3904
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3914
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3924
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3934
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3913
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3903
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3882
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3841
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3800
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3769
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3738
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3707
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3686
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3655
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3625
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3594
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3573
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3552
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3532
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3511
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3480
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3449
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3429
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3408
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3397
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3387
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3366
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3335
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3305
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3274
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3243
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3222
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3212
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3201
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3191
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3160
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3140
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3119
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3109
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3088
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3078
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3067
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3057
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 3016
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2955
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2863
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2761
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2629
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2517
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2405
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2293
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2202
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2131
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2069
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 2019
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1958
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1907
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1856
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1825
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1805
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1774
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1754
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1723
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1693
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1662
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1642
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1611
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1581
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1550
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1530
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1509
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1479
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1458
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1428
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1407
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1377
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1346
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1336
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1326
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1295
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1285
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1275
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1265
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1254
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1244
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1234
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1224
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1214
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1203
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1183
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1173
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1163
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1142
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1133
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1113
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1102
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1082
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1062
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1042
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 1011
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 981
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 950
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 920
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 879
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 849
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 808
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 788
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 758
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 727
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 707
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 687
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 667
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 636
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 576
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 525
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 485
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 454
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 404
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 363
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 343
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 333
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 323
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 303
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 282
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 272
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 262
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 252
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 242
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 232
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 212
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 192
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 181
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 161
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 141
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 131
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 111
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 101
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 91
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 81
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 71
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 40
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 20
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 0
pabCursorSelection -win $_pabWnd3 -cursorTime 18559.071131
pabSelectObject -win $_pabWnd3 -objId 31 -columnIndexes 0
pabZoomSelected -win $_pabWnd3
pabCursorSelection -win $_pabWnd3 -cursorTime 20022.774045
pabSelectObject -win $_pabWnd3 -objId 30 -columnIndexes 0
pabZoomSelected -win $_pabWnd3
pabCursorSelection -win $_pabWnd3 -cursorTime 93855.874007
pabSelectObject -win $_pabWnd3 -objId 40 -columnIndexes 0
pabHierTree -win $_pabWnd3 -selectStream \
           "\$trans_root/uvm_test_top/env/i_agt/drv"
pabDropEvent -win $_pabWnd3 -add "\$trans_root/uvm_test_top/env/i_agt/drv"
pabCursorSelection -win $_pabWnd3 -cursorTime 103400.53916
pabSelectObject -win $_pabWnd3 -objId 38 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 98097.947408
pabSelectObject -win $_pabWnd3 -objId 40 -columnIndexes 0
pabCursorSelection -win $_pabWnd3 -cursorTime 126731.942868
pabSelectObject -win $_pabWnd3 -objId 43 -columnIndexes 0
pabCursorSelection -win $_pabWnd3 -cursorTime 101809.761635
pabSelectObject -win $_pabWnd3 -objId 40 -columnIndexes 0
pabCursorSelection -win $_pabWnd3 -cursorTime 109233.390087
pabSelectObject -win $_pabWnd3 -objId 38 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 130443.757094
pabSelectObject -win $_pabWnd3 -objId 41 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 102340.02081
pabSelectObject -win $_pabWnd3 -objId 38 -columnIndexes 1
pabCursorSelection -win $_pabWnd3 -cursorTime 100218.984109
pabSelectObject -win $_pabWnd3 -objId 40 -columnIndexes 0
pabCallStack -win $_pabWnd3 -f "packet_sequence.sv" -lineNo 117
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
pabCallStack -win $_pabWnd3 -f "packet_sequence.sv" -lineNo 117
verdiSetActWin -win $_tProtocolAnalyzer_3
pabCallStack -win $_pabWnd3 -f "packet_sequence.sv" -lineNo 117
pabCallStack -win $_pabWnd3 -f "packet_sequence.sv" -lineNo 117
wvCreateWindow
wvSetPosition -win $_nWave6 {("G1" 0)}
wvOpenFile -win $_nWave6 \
           {/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/novas.fsdb}
wvGetSignalOpen -win $_nWave6
wvGetSignalSetScope -win $_nWave6 "/_vcs_msglog"
wvGetSignalSetScope -win $_nWave6 "/router_test_top"
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"G1" \
}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"G1" \
}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvGetSignalClose -win $_nWave6
wvSelectGroup -win $_nWave6 {G1}
wvSelectGroup -win $_nWave6 {G1}
wvGetSignalOpen -win $_nWave6
wvGetSignalSetScope -win $_nWave6 "/_vcs_msglog"
wvGetSignalSetScope -win $_nWave6 "/router_test_top"
wvGetSignalSetScope -win $_nWave6 "/router_test_top/reset_if"
wvGetSignalSetScope -win $_nWave6 "/router_test_top/reset_if"
wvGetSignalSetScope -win $_nWave6 "/router_test_top/reset_if/dut"
wvGetSignalSetScope -win $_nWave6 "/router_test_top/reset_if"
wvGetSignalExpandCollapseAll -win $_nWave6
wvGetSignalSetScope -win $_nWave6 "/router_test_top"
wvSetPosition -win $_nWave6 {("reset_if" 0)}
wvRenameGroup -win $_nWave6 {G1} {reset_if}
wvAddSignal -win $_nWave6 "/router_test_top/reset_if/clk" \
           "/router_test_top/reset_if/reset_n"
wvSetPosition -win $_nWave6 {("reset_if" 0)}
wvSetPosition -win $_nWave6 {("reset_if" 2)}
wvSetPosition -win $_nWave6 {("reset_if" 2)}
wvGetSignalSetScope -win $_nWave6 "/router_test_top/router_if"
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("router_if" 0)}
wvRenameGroup -win $_nWave6 {G2} {router_if}
wvAddSignal -win $_nWave6 "/router_test_top/router_if/clk" \
           "/router_test_top/router_if/frame_n\[15:0\]" \
           "/router_test_top/router_if/valid_n\[15:0\]" \
           "/router_test_top/router_if/din\[15:0\]" \
           "/router_test_top/router_if/dout\[15:0\]" \
           "/router_test_top/router_if/busy_n\[15:0\]" \
           "/router_test_top/router_if/valido_n\[15:0\]" \
           "/router_test_top/router_if/frameo_n\[15:0\]"
wvSetPosition -win $_nWave6 {("router_if" 0)}
wvSetPosition -win $_nWave6 {("router_if" 8)}
wvSetPosition -win $_nWave6 {("router_if" 8)}
wvSetPosition -win $_nWave6 {("router_if" 8)}
wvSetPosition -win $_nWave6 {("router_if" 8)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"reset_if" \
{/router_test_top/reset_if/clk} \
{/router_test_top/reset_if/reset_n} \
}
wvAddSignal -win $_nWave6 -group {"router_if" \
{/router_test_top/router_if/clk} \
{/router_test_top/router_if/frame_n\[15:0\]} \
{/router_test_top/router_if/valid_n\[15:0\]} \
{/router_test_top/router_if/din\[15:0\]} \
{/router_test_top/router_if/dout\[15:0\]} \
{/router_test_top/router_if/busy_n\[15:0\]} \
{/router_test_top/router_if/valido_n\[15:0\]} \
{/router_test_top/router_if/frameo_n\[15:0\]} \
}
wvAddSignal -win $_nWave6 -group {"G3" \
}
wvSetPosition -win $_nWave6 {("router_if" 8)}
wvGetSignalClose -win $_nWave6
wvSyncAllWaveform -win $_nWave6 -cursor_marker on -horizontal_range on \
           -vertical_scroll on
wvSetPrimaryWindow -win $_nWave6
verdiSetActWin -win $_tProtocolAnalyzer_3
wvGetActiveFileName -win $_nWave6
wvDeleteMarker -win $_nWave6 "pa_begin"
wvDeleteMarker -win $_nWave6 "pa_end"
wvSetMarker -win $_nWave6 -keepViewRange -name "pa_begin" 84500.000
wvSetMarker -win $_nWave6 -keepViewRange -name "pa_end" 117500.000
wvSetMarker -win $_nWave6 -keepViewRange 0.000000
wvSetCursor -win $_nWave6 100218.984109
wvZoom -win $_nWave6 0.000000 464095.000000
wvRestoreMarker -win $_nWave6 -file \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerReport.rpt"
pabSelectObject -win $_pabWnd3 -objId 40 -columnIndexes 0
pabNWSyncAll -win $_pabWnd3 -on
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 161039.052795
pabCursorSelection -win $_pabWnd3 -cursorTime 161039.052795
pabSelectObject -win $_pabWnd3 -objId 46 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 111711.775362
pabCursorSelection -win $_pabWnd3 -cursorTime 111711.775362
pabSelectObject -win $_pabWnd3 -objId 40 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 70363.910455
pabCursorSelection -win $_pabWnd3 -cursorTime 70363.910455
pabSelectObject -win $_pabWnd3 -objId 37 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 129121.402692
pabCursorSelection -win $_pabWnd3 -cursorTime 129121.402692
pabSelectObject -win $_pabWnd3 -objId 43 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 221247.347308
pabCursorSelection -win $_pabWnd3 -cursorTime 221247.347308
pabSelectObject -win $_pabWnd3 -objId 49 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvZoom -win $_nWave6 181522.169290 306149.330295
pabZoomSelected -win $_pabWnd3
wvZoom -win $_nWave6 181522.169290 306149.330295
pabZoomSelected -win $_pabWnd3
wvSetCursor -win $_nWave6 297247.390224
pabCursorSelection -win $_pabWnd3 -cursorTime 297247.390224
pabSelectObject -win $_pabWnd3 -objId 52 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 253511.771610
pabCursorSelection -win $_pabWnd3 -cursorTime 253511.77161
pabSelectObject -win $_pabWnd3 -objId 49 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 263574.834300
pabCursorSelection -win $_pabWnd3 -cursorTime 263574.8343
wvDeleteMarker -win $_nWave6 "pa_begin"
wvDeleteMarker -win $_nWave6 "pa_end"
pabClearObjSelection -win $_pabWnd3
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvDeleteMarker -win $_nWave6 "pa_begin"
pabDeleteMarker -win $_pabWnd3 -name pa_begin
wvDeleteMarker -win $_nWave6 "pa_end"
pabDeleteMarker -win $_pabWnd3 -name pa_end
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvZoom -win $_nWave6 179199.924054 303827.085059
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 926
wvZoom -win $_nWave6 170685.024855 295312.185860
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 882
wvZoom -win $_nWave6 164105.330019 288732.491025
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 848
wvZoom -win $_nWave6 155783.951257 280411.112262
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 805
wvZoom -win $_nWave6 131400.376277 256027.537283
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 679
wvZoom -win $_nWave6 123659.558824 248286.719829
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 639
wvZoom -win $_nWave6 113790.016570 238417.177575
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 588
wvZoom -win $_nWave6 109145.526098 233772.687103
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 564
wvZoom -win $_nWave6 103726.953880 228354.114885
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 536
wvZoom -win $_nWave6 102178.790389 226805.951395
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 528
wvZoom -win $_nWave6 99082.463408 223709.624413
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 512
wvZoom -win $_nWave6 98308.381663 222935.542668
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 508
wvZoom -win $_nWave6 97534.299917 222161.460922
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 504
wvZoom -win $_nWave6 92889.809445 217516.970450
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 480
wvZoom -win $_nWave6 89793.482463 214420.643469
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 464
wvZoom -win $_nWave6 84568.430682 209195.591687
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 437
wvZoom -win $_nWave6 82246.185446 206873.346451
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 425
wvZoom -win $_nWave6 78569.297155 203196.458161
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 406
wvZoom -win $_nWave6 73924.806683 198551.967688
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 382
wvZoom -win $_nWave6 67925.673157 192552.834162
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 351
wvZoom -win $_nWave6 64055.264430 188682.425435
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 331
wvZoom -win $_nWave6 53411.640431 178038.801436
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 276
wvZoom -win $_nWave6 47412.506904 172039.667909
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 245
wvZoom -win $_nWave6 42187.455123 166814.616128
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 218
wvZoom -win $_nWave6 35414.239851 160041.400856
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 183
wvZoom -win $_nWave6 28641.024579 153268.185584
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 148
wvZoom -win $_nWave6 26318.779343 150945.940348
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 136
wvZoom -win $_nWave6 21867.809307 146494.970312
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 113
wvZoom -win $_nWave6 19545.564071 144172.725076
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 101
wvZoom -win $_nWave6 18771.482325 143398.643331
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 97
wvZoom -win $_nWave6 15675.155344 140302.316349
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 81
wvZoom -win $_nWave6 13546.430544 138173.591549
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 70
wvZoom -win $_nWave6 11998.267053 136625.428059
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 62
wvZoom -win $_nWave6 11224.185308 135851.346313
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 58
wvZoom -win $_nWave6 9676.021817 134303.182822
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 50
wvZoom -win $_nWave6 6773.215272 131400.376277
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 35
wvZoom -win $_nWave6 2322.245236 126949.406241
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 12
wvZoom -win $_nWave6 0.000000 124627.161005
pabScrollDrawArea -win $_pabWnd3 -vScroll -1 -hScroll 0
wvSetCursor -win $_nWave6 21480.768434
pabCursorSelection -win $_pabWnd3 -cursorTime 21480.768434
pabSelectObject -win $_pabWnd3 -objId 31 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 52056.997376
pabCursorSelection -win $_pabWnd3 -cursorTime 52056.997376
pabSelectObject -win $_pabWnd3 -objId 34 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 66183.989229
pabCursorSelection -win $_pabWnd3 -cursorTime 66183.989229
pabSelectObject -win $_pabWnd3 -objId 37 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 92889.809445
pabCursorSelection -win $_pabWnd3 -cursorTime 92889.809445
pabSelectObject -win $_pabWnd3 -objId 40 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 67538.632284
pabCursorSelection -win $_pabWnd3 -cursorTime 67538.632284
pabSelectObject -win $_pabWnd3 -objId 37 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvSetCursor -win $_nWave6 48186.588650
pabCursorSelection -win $_pabWnd3 -cursorTime 48186.58865
pabSelectObject -win $_pabWnd3 -objId 34 -columnIndexes 0
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
wvReportMarker -win $_nWave6 -toFile \
           "/DATA/home/edu010/UVM/UVM_test/UVM_TB/missions/uvm-1.2/labs/lab3/verdiLog/markerSyncReport.rpt"
debExit

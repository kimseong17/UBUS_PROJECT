verdiSetActWin -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "510" "190" "900" "700"
nsMsgSwitchTab -tab cmpl
nsMsgSwitchTab -tab trace
verdiSetActWin -dock widgetDock_<Message>
nsMsgSwitchTab -tab general
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Message>
nsMsgSwitchTab -tab cmpl
nsMsgSwitchTab -tab search
nsMsgSwitchTab -tab cmpl
debExit

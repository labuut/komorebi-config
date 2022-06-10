notifyOnCurrentMonitor(string) {
    monitorKmrIndex := getMonitorKmrIndex()
    monitorAhkIndex := toMonitorAhkIndex(monitorKmrIndex)

    SysGet, monitor, MonitorWorkArea, %monitorAhkIndex%

    CoordMode, ToolTip, Screen
    ToolTip, %string%, %monitorLeft%, %monitorTop%
    Sleep, 1000
    ToolTip

    ; SetTimer, removeToolTip, -2000
    ; removeToolTip: 
        ; ToolTip
        ; return
}

notifyCurrentMonitorAndWorkspace() {
  monitorKmrIndex := getMonitorKmrIndex()
  workspaceIndex := getWorkspaceIndex(monitorKmrIndex)

  string := "monitor: " monitorKmrIndex "`nworkspace: " workspaceIndex

  notifyOnCurrentMonitor(string)
}

notifyCurrentMonitor() {
  monitorKmrIndex := getMonitorKmrIndex()

  string := "monitor: " monitorKmrIndex

  notifyOnCurrentMonitor(string)
}
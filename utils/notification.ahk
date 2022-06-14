#Persistent
#Warn


removeToolTip() {
  ToolTip
  return
} 

notifyOnCurrentMonitor(string) {
    monitorKmrIndex := getMonitorKmrIndex()
    monitorAhkIndex := toMonitorAhkIndex(monitorKmrIndex)

    SysGet, monitor, MonitorWorkArea, %monitorAhkIndex%

    CoordMode, ToolTip, Screen
    ToolTip, %string%, %monitorLeft%, %monitorTop%

    SetTimer, removeToolTip, -%NOTIFICATION_TIMEOUT%
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
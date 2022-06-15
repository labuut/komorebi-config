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

notifyCurrentMonitorAndWorkspace(firstString = "") {
  monitorKmrIndex := getMonitorKmrIndex()
  workspaceIndex := getWorkspaceIndex(monitorKmrIndex)

  begining := firstString ? firstString "`n" : ""
  finalString := begining "Monitor: " monitorKmrIndex "`nWorkspace: " workspaceIndex

  notifyOnCurrentMonitor(finalString)
}

notifyCurrentMonitor(firstString = "") {
  monitorKmrIndex := getMonitorKmrIndex()

  begining := firstString ? firstString "`n" : ""
  finalString := firstString "Monitor: " monitorKmrIndex

  notifyOnCurrentMonitor(finalString)
}

notifyCurrentLayout() {
  layoutIndex := getLayoutIndex()
  layoutName := getLayoutName(layoutIndex)

  notifyOnCurrentMonitor(layoutName)
}
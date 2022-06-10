#SingleInstance Force

#Include %A_ScriptDir%


onChangeActiveWindow() {
    monitorAhkIndex := getCurrentMonitorAhkIndex()
    currentMonitorIndex := toMonitorKmrIndex(monitorAhkIndex)

    setMonitorKmrIndex(currentMonitorIndex)
}

handleChangeFocusKey(direction) {
  WinGet, currentPID, PID, A

  Run, komorebic.exe focus %direction%, , Hide
  
  Sleep, PROCESS_DELAY
  WinGet, updatedPID, PID, A
  
  isActiveWinChanged := currentPID != updatedPID

  if (!isActiveWinChanged) {
      switch direction {
        ; change monitor
        case "left", "right":
          moveMouseToMonitorByDirection(direction)
        ; change workspace
        case "up", "down":
          focusWorkspaceByDirection(direction)

          monitorIndex := getMonitorKmrIndex()
          workspaceIndex := getWorkspaceIndex(monitorIndex)

          notifyMonitorAndWorkspace(monitorIndex, workspaceIndex)
    }
  }

  return
}

handleMoveKey(direction) {
  WinGetPos, currentX, currentY,,, A

  Run, komorebic.exe move %direction%, , Hide

  Sleep, PROCESS_DELAY
  WinGetPos, newX, newY,,, A
  
  isActiveWinPositionChanged := (currentX != newX) || (currentY != newY)
  
  if (!isActiveWinPositionChanged) {
      switch direction {
        ; move to monitor
        case "left", "right":
          moveWindowToMonitorByDirection(direction)
        ; move to workspace
        case "up", "down":
          moveWindowToWorkspaceByDirection(direction)

          monitorIndex := getMonitorKmrIndex()
          workspaceIndex := getWorkspaceIndex(monitorIndex)

          notifyMonitorAndWorkspace(monitorIndex, workspaceIndex)
    }
  }
  return
}
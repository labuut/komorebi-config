#SingleInstance Force

#Include %A_ScriptDir%\utils\index.ahk


handleChangeActiveWindow() {
  currentMonitorAhkIndex := getCurrentMonitorAhkIndex()
  currentMonitorKmrIndex := toMonitorKmrIndex(currentMonitorAhkIndex)

  setMonitorKmrIndex(currentMonitorKmrIndex)
  
  notifyCurrentMonitor()
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
          notifyCurrentMonitor()
        ; change workspace
        case "up", "down":
          focusWorkspaceByDirection(direction)
          notifyCurrentMonitorAndWorkspace()
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
          notifyCurrentMonitor()
        ; move to workspace
        case "up", "down":
          moveWindowToWorkspaceByDirection(direction)
          notifyCurrentMonitorAndWorkspace()
    }
  }
  
  return
}

handleChangeLayoutKey() {
  changeLayout()

  return
}
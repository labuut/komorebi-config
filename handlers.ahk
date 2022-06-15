#Persistent
#Warn
#Include %A_ScriptDir%\utils\index.ahk


; Not usable now
handleChangeActiveWindow() {
  currentMonitorAhkIndex := getActiveMonitorAhkIndexByCursor()
  currentMonitorKmrIndex := toMonitorKmrIndex(currentMonitorAhkIndex)

  setMonitorKmrIndex(currentMonitorKmrIndex)

  ; notifyCurrentMonitorAndWorkspace("Change Active Window")
  ; notifyCurrentMonitorAndWorkspace()
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
    }

    ; notifyCurrentMonitorAndWorkspace("Change Focus")
    notifyCurrentMonitorAndWorkspace()
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
    }

    ; notifyCurrentMonitorAndWorkspace("Move Key")
    notifyCurrentMonitorAndWorkspace()
  }
  
  return
}

handleChangeLayoutKey() {
  changeLayout()

  return
}
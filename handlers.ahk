#Persistent
#Warn
#Include %A_ScriptDir%\utils\index.ahk


; Not usable now
handleChangeActiveWindow() {
  currentMonitorAhkIndex := getActiveMonitorAhkIndexByCursor()
  currentMonitorKmrIndex := toMonitorKmrIndex(currentMonitorAhkIndex)

  setMonitorKmrIndex(currentMonitorKmrIndex)

  ; notifyCurrentMonitorAndWorkspace("Change Active Window")
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
          newMonitorIndex := getMonitorKmrIndexByDirection(direction)
          setMonitorKmrIndex(newMonitorIndex)
          moveMouseToMonitorByDirection(direction)
        ; change workspace
        case "up", "down":
          focusWorkspaceByDirection(direction)
    }
      
    isWorkspaceEmpty := checkIsScreenEmpty()

    if (isWorkspaceEmpty) {
      Click
    }

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
          newMonitorIndex := getMonitorKmrIndexByDirection(direction)
          setMonitorKmrIndex(newMonitorIndex)
          moveWindowToMonitorByDirection(direction)
        ; move to workspace
        case "up", "down":
          moveWindowToWorkspaceByDirection(direction)
    }

    notifyCurrentMonitorAndWorkspace()
  }
  
  return
}

handleChangeLayoutKey() {
  changeLayout()
  notifyCurrentLayout()
}

handleChangeWorkspaceKey(workspaceIndex) {
  currentMonitorKmrIndex := getMonitorKmrIndex()
  setWorkspaceIndex(currentMonitorKmrIndex, workspaceIndex)

  Run, komorebic.exe focus-workspace %workspaceIndex%, , Hide

  notifyCurrentMonitorAndWorkspace()
}

handleMoveToWorkspaceKey(workspaceIndex) {
  currentMonitorKmrIndex := getMonitorKmrIndex()
  setWorkspaceIndex(currentMonitorKmrIndex, workspaceIndex)

  Run, komorebic.exe move-to-workspace %workspaceIndex%, , Hide

  notifyCurrentMonitorAndWorkspace()
}
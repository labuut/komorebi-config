#Persistent
#Warn
#Include %A_ScriptDir%\utils\index.ahk


handleChangeActiveWindow() {
  currentMonitorAhkIndex := getActiveMonitorAhkIndexByCursor()
  currentMonitorKmrIndex := toMonitorKmrIndex(currentMonitorAhkIndex)

  setMonitorKmrIndex(currentMonitorKmrIndex)

  ; notifyCurrentMonitorAndWorkspace("Change Active Window")
}

handleFocusWorkspaceByIndex(workspaceIndex) {
  currentMonitorKmrIndex := getMonitorKmrIndex()
  setWorkspaceIndex(currentMonitorKmrIndex, workspaceIndex)

  Run, komorebic.exe focus-workspace %workspaceIndex%, , Hide

  notifyCurrentMonitorAndWorkspace()
}

handleFocusMonitorByDirection(direction) {
  newMonitorIndex := getMonitorKmrIndexByDirection(direction)
  setMonitorKmrIndex(newMonitorIndex)
  
  moveMouseToMonitorByDirection(direction)
  
  isScreenEmpty := checkIsScreenEmpty()

  if (isScreenEmpty) {
    Click
  }

  notifyCurrentMonitorAndWorkspace()
}

handleFocusWorkspaceByDirection(direction) {
  focusWorkspaceByDirection(direction)
  
  isScreenEmpty := checkIsScreenEmpty()

  if (isScreenEmpty) {
    Click
  }

  notifyCurrentMonitorAndWorkspace()
}
  
handleChangeFocus(direction) {
  WinGet, currentPID, PID, A

  Run, komorebic.exe focus %direction%, , Hide
  
  Sleep, PROCESS_DELAY
  WinGet, updatedPID, PID, A
  
  isActiveWinChanged := currentPID != updatedPID

  if (!isActiveWinChanged) {
      switch direction {
        ; change monitor
        case "left", "right":
          handleFocusMonitorByDirection(direction)
        ; change workspace
        case "up", "down":
          handleFocusWorkspaceByDirection(direction)
    }
  }
}

handleMoveToWorkspaceByIndex(workspaceIndex) {
  currentMonitorKmrIndex := getMonitorKmrIndex()
  setWorkspaceIndex(currentMonitorKmrIndex, workspaceIndex)

  Run, komorebic.exe move-to-workspace %workspaceIndex%, , Hide

  notifyCurrentMonitorAndWorkspace()
}

handleMoveToWorkspaceByDirection(direction) {
  setWorkspaceIndexByDirection(direction)

  monitorKmrIndex := getMonitorKmrIndex()
  workspaceIndex := getWorkspaceIndex(monitorKmrIndex)

  Run, komorebic.exe move-to-workspace %workspaceIndex%, , Hide

  notifyCurrentMonitorAndWorkspace()
}

handleMoveToMonitorByDirection(direction) {
  newMonitorIndex := getMonitorKmrIndexByDirection(direction)
  setMonitorKmrIndex(newMonitorIndex)

  Run, komorebic.exe move-to-monitor %MONITOR_KMR_INDEX%, Hide

  notifyCurrentMonitorAndWorkspace()
}

handleMoveWindow(direction) {
  WinGetPos, currentX, currentY,,, A

  Run, komorebic.exe move %direction%, , Hide

  Sleep, PROCESS_DELAY
  WinGetPos, newX, newY,,, A
  
  isActiveWinPositionChanged := (currentX != newX) || (currentY != newY)
  
  if (!isActiveWinPositionChanged) {
      switch direction {
        ; move to monitor
        case "left", "right":
          handleMoveToMonitorByDirection(direction)
        ; move to workspace
        case "up", "down":
          handleMoveToWorkspaceByDirection(direction)
    }
  }
}

handleChangeLayoutKey() {
  changeLayout()
  notifyCurrentLayout()
}
#Include %A_ScriptDir%


getWorkspaceIndex(monitorKmrIndex) {
    return WORKSPACE_INDEXES[monitorKmrIndex]
}

setWorkspaceIndex(monitorKmrIndex, workspaceIndex) {
    WORKSPACE_INDEXES[monitorKmrIndex] := workspaceIndex
}

setWorkspaceIndexByDirection(direction) {
    currentMonitorKmrIndex := getMonitorKmrIndex()
    currentWorkspaceIndex := getWorkspaceIndex(currentMonitorKmrIndex)

    newWorkspaceIndex :=

    switch direction {
        case "up":
            newWorkspaceIndex := (currentWorkspaceIndex = MAX_WORKSPACE_INDEX)
                ? currentWorkspaceIndex
                : (currentWorkspaceIndex + 1)
        case "down":
            newWorkspaceIndex := (currentWorkspaceIndex = MIN_WORKSPACE_INDEX)
                ? currentWorkspaceIndex
                : (currentWorkspaceIndex - 1)
    }
    
    setWorkspaceIndex(currentMonitorKmrIndex, newWorkspaceIndex)
    return
}

focusWorkspaceByDirection(direction) {
    setWorkspaceIndexByDirection(direction)
    
    currentMonitorKmrIndex := getMonitorKmrIndex()
    workspaceIndex := getWorkspaceIndex(currentMonitorKmrIndex)

    Run, komorebic.exe focus-workspace %workspaceIndex%, , Hide
}

moveWindowToWorkspaceByDirection(direction) {
    setWorkspaceIndexByDirection(direction)

    monitorKmrIndex := getMonitorKmrIndex()
    workspaceIndex := getWorkspaceIndex(monitorKmrIndex)

    Run, komorebic.exe move-to-workspace %workspaceIndex%, , Hide
}
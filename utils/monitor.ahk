#Include %A_ScriptDir%


toMonitorAhkIndex(monitorKmrIndex) {
    return MONITOR_KMR_INDEXES_MAP[monitorKmrIndex]
}

toMonitorKmrIndex(monitorAhkIndex) {
    return MONITOR_AHK_INDEXES_MAP[monitorAhkIndex]
}

getMonitorKmrIndex() {
    return MONITOR_KMR_INDEX
}

setMonitorKmrIndex(monitorKmrIndex) {
    MONITOR_KMR_INDEX := monitorKmrIndex
}

setMonitorKmrIndexByDirection(direction) {
    currentMonitorKmrIndex := getMonitorKmrIndex()

    newMonitorIndex :=

    switch direction {
        case "left":
            newMonitorIndex := (currentMonitorKmrIndex = MIN_MONITOR_KMR_INDEX) 
                ? currentMonitorKmrIndex 
                : (currentMonitorKmrIndex - 1)
        case "right":
            newMonitorIndex := (currentMonitorKmrIndex = MAX_MONITOR_KMR_INDEX) 
                ? currentMonitorKmrIndex
                : (currentMonitorKmrIndex + 1)
    }
    
    setMonitorKmrIndex(newMonitorIndex)
    return
}

getCurrentMonitorAhkIndex() {
	SysGet, monitorsCount, MonitorCount
    WinGetActiveStats, winTitle, W, H, winX, winY

    ; this value depends on params `invisible-borders` and `workspace-padding` from `config.ahk`
    ; it can be recognize by AHK's `Window Spy` (`Active Window Position`)
    offset := 3
    offsettedWinX := winX + offset

	Loop %monitorsCount% {
        SysGet, monitor, MonitorWorkArea, %a_index%

        isLeftMonitor := a_index = 1
        isRightMonitor := a_index = monitorsCount
        
        ; window can be more left then monitorLeft
        if (isLeftMonitor && (offsettedWinX < monitorLeft)) {
            return %a_index%
        }
        ; window can be more right then monitorRight
        if (isRightMonitor && (offsettedWinX > monitorRight)) {
            return %a_index%
        }
		if (offsettedWinX >= monitorLeft && offsettedWinX < monitorRight) {
			return %a_index%
        }
	}
}

calculateMonitorCenterX(monitorKmrIndex) {
    monitorAhkIndex := toMonitorAhkIndex(monitorKmrIndex)

    SysGet, monitor, MonitorWorkArea, %monitorAhkIndex%

    centerX :=

    if (Abs(monitorRight) > Abs(monitorLeft)) {
        centerX := (monitorRight - monitorLeft) / 4 + monitorLeft
    }
    if (Abs(monitorRight) < Abs(monitorLeft)) {
        centerX := (monitorLeft - monitorRight) / 4 + monitorRight
    }

    return centerX
}

calculateMonitorCenterY(monitorKmrIndex) {
    monitorAhkIndex := toMonitorAhkIndex(monitorKmrIndex)
    
    SysGet, monitor, MonitorWorkArea, %monitorAhkIndex%

    return (monitorBottom - monitorTop) / 2
}

moveMouseToMonitorByDirection(direction) {
    setMonitorKmrIndexByDirection(direction)

    newMonitorKmrIndex := getMonitorKmrIndex()

    centerX := calculateMonitorCenterX(newMonitorKmrIndex)
    centerY := calculateMonitorCenterY(newMonitorKmrIndex)

    CoordMode, Mouse, Screen 
    MouseMove, centerX, centerY
}

moveWindowToMonitorByDirection(direction) {
    setMonitorKmrIndexByDirection(direction)
    Run, komorebic.exe move-to-monitor %MONITOR_KMR_INDEX%, Hide
}

; ; Unusable
; focusMonitorByDirection(direction) {
;     setMonitorKmrIndexByDirection(direction)
;     monitorKmrIndex = getMonitorKmrIndex()

;     Run, komorebic.exe focus-monitor %monitorKmrIndex%, Hide
; }
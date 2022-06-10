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
    WinGetActiveStats, winTitle, W, H, winX, winY
	SysGet, monitorsCount, MonitorCount

	Loop %monitorsCount% {
        SysGet, monitor, MonitorWorkArea, %a_index%

        isLeftMonitor := a_index = 1
        isRightMonitor := a_index = monitorsCount
        
        ; window can be more left then monitorLeft
        if (isLeftMonitor && (winX < monitorLeft)) {
            return %a_index%
        }
        ; window can be more left then monitorRight
        if (isRightMonitor && (winX > monitorRight)) {
            return %a_index%
        }
		if (winX >= monitorLeft && winX < monitorRight) {
			return %a_index%
        }
	}
}

calculateMonitorCenterX(monitorKmrIndex) {
    monitorAhkIndex := toMonitorAhkIndex(monitorKmrIndex)

    SysGet, monitor, MonitorWorkArea, %monitorAhkIndex%

    centerX :=

    if (Abs(monitorRight) > Abs(monitorLeft)) {
        centerX := (monitorRight - monitorLeft) / 2 + monitorLeft
    }
    if (Abs(monitorRight) < Abs(monitorLeft)) {
        centerX := (monitorLeft - monitorRight) / 2 + monitorRight
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

    newKomMonitorIndex := getMonitorKmrIndex()

    centerX := calculateMonitorCenterX(newKomMonitorIndex)
    centerY := calculateMonitorCenterY(newKomMonitorIndex)

    CoordMode, Mouse, Screen 
    MouseMove, centerX, centerY
}

moveWindowToMonitorByDirection(direction) {
    setMonitorKmrIndexByDirection(direction)
    Run, komorebic.exe move-to-monitor %MONITOR_KMR_INDEX%, Hide
}

; Unusable
; focusMonitorByDirection(direction) {
;     setMonitorKmrIndexByDirection(direction)
;     monitorKmrIndex = getMonitorKmrIndex()

;     Run, komorebic.exe focus-monitor %monitorKmrIndex%, Hide
; }
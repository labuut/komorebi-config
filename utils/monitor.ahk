#Warn
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

getMonitorKmrIndexByDirection(direction) {
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
    
    return newMonitorIndex
}

getActiveMonitorAhkIndexByCursor() {
    Coordmode, Mouse, Screen
    MouseGetPos, xCoord, yCoord 

	SysGet, monitorsCount, MonitorCount

	Loop %monitorsCount% {
        SysGet, monitor, Monitor, %a_index%

        isActiveMonitor := (xCoord >= monitorLeft)
            && (xCoord < monitorRight)
            && (yCoord >= monitorTop) 
            && (yCoord < monitorBottom)

        if (isActiveMonitor) {
			return %a_index%ActiveMon := A_Index
		}
	}
}

calculateXCoordInCurrentMonitor(monitorKmrIndex) {
    monitorAhkIndex := toMonitorAhkIndex(monitorKmrIndex)

    SysGet, monitor, MonitorWorkArea, %monitorAhkIndex%

    xCoord :=

    if (Abs(monitorRight) > Abs(monitorLeft)) {
        xCoord := (monitorRight - monitorLeft) / 10 + monitorLeft
    }
    if (Abs(monitorRight) < Abs(monitorLeft)) {
        xCoord := (monitorLeft - monitorRight) / 10 + monitorRight
    }

    return xCoord
}

calculateYCoordInCurrentMonitor(monitorKmrIndex) {
    monitorAhkIndex := toMonitorAhkIndex(monitorKmrIndex)
    
    SysGet, monitor, MonitorWorkArea, %monitorAhkIndex%

    return (monitorBottom - monitorTop) / 2
}

moveMouseToMonitorByDirection(direction) {
    newMonitorKmrIndex := getMonitorKmrIndex()

    xCoord := calculateXCoordInCurrentMonitor(newMonitorKmrIndex)
    yCoord := calculateYCoordInCurrentMonitor(newMonitorKmrIndex)

    CoordMode, Mouse, Screen 
    MouseMove, xCoord, yCoord
}

checkIsScreenEmpty() {
    MouseGetPos,,, winId
    WinGetClass, winCLass, ahk_id %winId%

    return winCLass = "Progman"
}

; ; Unusable
; focusMonitorByDirection(direction) {
;     setMonitorKmrIndexByDirection(direction)
;     monitorKmrIndex = getMonitorKmrIndex()

;     Run, komorebic.exe focus-monitor %monitorKmrIndex%, Hide
; }
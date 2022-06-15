#Warn
#Include %A_ScriptDir%\utils\index.ahk


; ! Alt
; ^ Ctrl
; # Win / LWin, the left Windows key
; + Shift

;; WINDOWS:
; Change focus (Win + Arrows):
#Left::handleChangeFocus("left")
#Right::handleChangeFocus("right")
#Up::handleChangeFocus("up")
#Down::handleChangeFocus("down")

; Move active window (Win + Ctrl + Arrows):
#^Left::handleMoveWindow("left")
#^Right::handleMoveWindow("right")
#^Up::handleMoveWindow("up")
#^Down::handleMoveWindow("down")

; Resize active window (Win + Alt + Arrows):
#!Left::Run, komorebic.exe resize-axis horizontal decrease, , Hide return
#!Right::Run, komorebic.exe resize-axis horizontal increase, , Hide return
#!Up::Run, komorebic.exe resize-axis vertical increase, , Hide return
#!Down::Run, komorebic.exe resize-axis vertical decrease, , Hide return

; Toggle monocle mode for the focused window (Win + F):
#f::Run, komorebic.exe toggle-monocle, , Hide return

; Swap window with master (Win + Enter):
#Enter::Run, komorebic.exe promote, , Hide return

;; WORKSPACES:
; Change workspace (Win + Digit)
#1::handleFocusWorkspaceByIndex(0)
#2::handleFocusWorkspaceByIndex(1)
#3::handleFocusWorkspaceByIndex(2)
#4::handleFocusWorkspaceByIndex(3)
#5::handleFocusWorkspaceByIndex(4)

; Move window to workspace (Win + Ctrl + Digit)
#^1::handleMoveToWorkspaceByIndex(0)
#^2::handleMoveToWorkspaceByIndex(1)
#^3::handleMoveToWorkspaceByIndex(2)
#^4::handleMoveToWorkspaceByIndex(3)
#^5::handleMoveToWorkspaceByIndex(4)

; Change workspace in order (Win + PgDn/PgUp)
#PgUp::handleFocusWorkspaceByDirection("up")
#PgDn::handleFocusWorkspaceByDirection("down")

; Move window to workspace in order (Win + Ctrl + PgDn/PgUp)
#^PgUp::handleMoveToWorkspaceByDirection("up")
#^PgDn::handleMoveToWorkspaceByDirection("down")

;; MONITORS: 
; Change monitor in order (Win + Home/End)
#Home::handleFocusMonitorByDirection("left")
#End::handleFocusMonitorByDirection("right")

; Move to monitor in order (Win + Home/End)
#^Home::handleMoveToMonitorByDirection("left")
#^End::handleMoveToMonitorByDirection("right")

;; LAYOUTS:
; Change layout in circle (see `LAYOUTS`) (Win + [)
#$[::handleChangeLayoutKey()

; Flip horizontally/vertically (Win + X/Y):
#x::Run, komorebic.exe flip-layout horizontal, , Hide return
#y::Run, komorebic.exe flip-layout vertical, , Hide return

; Force a retile if things get janky (Win + Alt + R):
#!r::Run, komorebic.exe retile, , Hide return

; Float the focused window (Win + Alt + F):
#!f::Run, komorebic.exe toggle-float, , Hide return

;; SERVICE:
; Komorebi start/stop (Win + Alt/Ctrl + K)
#!k::Run, komorebic.exe start, , Hide return
#^k::Run, komorebic.exe stop, , Hide return














#Include %A_ScriptDir%\utils\index.ahk


; ! Alt
; ^ Ctrl
; # Win / LWin, the left Windows key
; + Shift

;; WINDOWS;
; Change focus (Win + Arrows):
#Left::handleChangeFocusKey("left")
#Right::handleChangeFocusKey("right")
#Up::handleChangeFocusKey("up")
#Down::handleChangeFocusKey("down")

; Move active window (Win + Ctrl + Arrows):
#^Left::handleMoveKey("left")
#^Right::handleMoveKey("right")
#^Up::handleMoveKey("up")
#^Down::handleMoveKey("down")

; Resize active window (Win + Alt + Arrows):
#!Left::Run, komorebic.exe resize-axis horizontal decrease, , Hide return
#!Right::Run, komorebic.exe resize-axis horizontal increase, , Hide return
#!Up::Run, komorebic.exe resize-axis vertical increase, , Hide return
#!Down::Run, komorebic.exe resize-axis vertical decrease, , Hide return

; Toggle monocle mode for the focused window (Win + F):
#f::Run, komorebic.exe toggle-monocle, , Hide return

; Swap window with master (Win + Enter):
#Enter::Run, komorebic.exe promote, , Hide return

;; LAYOUTS:
; Change layout in circle (see LAYOUTS array)
#!l::handleChangeLayoutKey()

; Flip horizontally (Win + X):
#x::Run, komorebic.exe flip-layout horizontal, , Hide return

; Flip vertically (Win + Y):
#y::Run, komorebic.exe flip-layout vertical, , Hide return

; Force a retile if things get janky (Win + Alt + R):
#!r::Run, komorebic.exe retile, , Hide return

; Float the focused window (Win + Alt + F):
#!f::Run, komorebic.exe toggle-float, , Hide return

;; SERVICE:
; Komorebi start/stop (Win + Alt/Ctrl + K)
#!k::Run, komorebic.exe start, , Hide return
#^k::Run, komorebic.exe stop, , Hide return

; TEST
; #m::
; Run, komorebic.exe manage, , Hide
; return














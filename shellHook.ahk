#Persistent

#Include %A_ScriptDir%\handlers.ahk
#Include %A_ScriptDir%\utils\index.ahk

Gui +LastFound 
hWnd := WinExist()

DllCall( "RegisterShellHookWindow", UInt,Hwnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )

OnMessage( MsgNum, "shellMessage" )

return

shellMessage( wParam,lParam ) {
  HSHELL_WINDOWACTIVATED := 4
  HSHELL_RUDEAPPACTIVATED := 32772 ; 0x8004
  
  if (wParam = HSHELL_WINDOWACTIVATED || wParam = HSHELL_RUDEAPPACTIVATED) {
    ; ToolTip, wParam: %wParam%
    ; handleChangeActiveWindow()
  }
}
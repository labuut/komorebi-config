#Include %A_ScriptDir%


shellMessage(wParam, lParam) {
    WinGetTitle, title, ahk_id %lParam%

    HSHELL_WINDOWACTIVATED := 4
    HSHELL_RUDEAPPACTIVATED := 32772 ; 0x8004
    
    if (wParam = HSHELL_WINDOWACTIVATED || wParam = HSHELL_RUDEAPPACTIVATED) {
        onChangeActiveWindow()
    }
}

; https://www.autohotkey.com/board/topic/66726-method-to-detect-active-window-change/
detectActiveWindowIsChanged() {
    Gui +LastFound
    hWnd := WinExist()

    DllCall("RegisterShellHookWindow", UInt, Hwnd)

    MsgNum := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")

    OnMessage(MsgNum, "shellMessage")
    return
}
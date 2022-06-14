; Mouse
Run, komorebic.exe focus-follows-mouse enable, , Hide
Run, komorebic.exe mouse-follows-focus enable, , Hide

; Window margins
Run, komorebic.exe invisible-borders 14 0 28 14, , Hide

; Workspaces (zero-indexed)
; Monitor 0 (from left)
Run, komorebic.exe ensure-workspaces 0 3, , Hide 

Run, komorebic.exe workspace-name 0 0 main2, , Hide
Run, komorebic.exe workspace-name 0 1 chat, , Hide
Run, komorebic.exe workspace-name 0 2 empty, , Hide

Run, komorebic.exe workspace-padding 0 0 1, , Hide
Run, komorebic.exe workspace-padding 0 1 1, , Hide
Run, komorebic.exe workspace-padding 0 2 1, , Hide

Run, komorebic.exe workspace-layout 0 0 columns, , Hide
Run, komorebic.exe workspace-layout 0 1 columns, , Hide
Run, komorebic.exe workspace-layout 0 2 columns, , Hide

; Monitor 1 (from left)
Run, komorebic.exe ensure-workspaces 1 4, , Hide 

Run, komorebic.exe workspace-name 1 0 main1, , Hide
Run, komorebic.exe workspace-name 1 1 files, , Hide
Run, komorebic.exe workspace-name 1 2 anki, , Hide
Run, komorebic.exe workspace-name 1 4 fun, , Hide

Run, komorebic.exe workspace-padding 1 0 1, , Hide
Run, komorebic.exe workspace-padding 1 1 1, , Hide
Run, komorebic.exe workspace-padding 1 2 1, , Hide
Run, komorebic.exe workspace-padding 1 3 1, , Hide

Run, komorebic.exe workspace-layout 1 0 columns, , Hide
Run, komorebic.exe workspace-layout 1 1 columns, , Hide
Run, komorebic.exe workspace-layout 1 2 columns, , Hide
Run, komorebic.exe workspace-layout 1 3 columns, , Hide

; App rules
; specified monitor/workspace:
Run, komorebic.exe workspace-rule exe Telegram.exe 0 1, , Hide
Run, komorebic.exe workspace-rule exe Discord.exe 0 1, , Hide
; Run, komorebic.exe workspace-rule exe Zoom.exe 0 1, , Hide
Run, komorebic.exe workspace-rule exe Steam.exe 1 3, , Hide

; force to manage app:
; Run, komorebic.exe float-rule exe powershell.exe, , Hide

; float apps:
Run, komorebic.exe float-rule class TaskManagerWindow, , Hide
Run, komorebic.exe float-rule title Calculator, , Hide
Run, komorebic.exe float-rule title "Control Panel", , Hide
Run, komorebic.exe float-rule exe wincompose.exe, , Hide
; Run, komorebic.exe float-rule class SunAwtDialog, , Hide ; float IntelliJ popups, matching on class

; apps that close to the tray:
Run, komorebic.exe identify-tray-application exe Discord.exe, , Hide
Run, komorebic.exe identify-tray-application exe Telegram.exe, , Hide
Run, komorebic.exe identify-tray-application exe Zoom.exe, , Hide
Run, komorebic.exe identify-tray-application exe Steam.exe, , Hide

; apps that have overflowing borders:
Run, komorebic.exe identify-border-overflow exe Discord.exe, , Hide

; Manage forcibly these applications that don't automatically get picked up by komorebi
; Run, komorebic.exe manage-rule exe TIM.exe, , Hide

; resize-delta
Run, komorebic.exe resize-delta 300, , Hide


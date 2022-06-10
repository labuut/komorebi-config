#SingleInstance Force

global PROCESS_DELAY := 200

; Monitors
global MIN_MONITOR_KMR_INDEX = 0
global MAX_MONITOR_KMR_INDEX = 1
global INIT_MONITOR_KMR_INDEX = 1
global MONITOR_KMR_INDEX := INIT_MONITOR_KMR_INDEX
; { ahkIndex: komorebiIndex }
global MONITOR_AHK_INDEXES_MAP = {  1: 0
                                  , 2: 1
                                  , 3: 2 }
; { komorebiIndex: ahkIndex }
global MONITOR_KMR_INDEXES_MAP = {  0: 1
                                  , 1: 2
                                  , 2: 3 }

; Workspaces
global MIN_WORKSPACE_INDEX = 0
global MAX_WORKSPACE_INDEX = 4
global INIT_WORKSPACE_INDEX = 0
; { monitor: workspaceIndex }
global WORKSPACE_INDEXES = {  0: INIT_WORKSPACE_INDEX
                            , 1: INIT_WORKSPACE_INDEX
                            , 2: INIT_WORKSPACE_INDEX }


; DllCall("GetModuleHandle", "Str", "kernel32", "Ptr")
; 获得动态链接库 kernel32 模块句柄
; 返回值Long，如执行成功成功，则返回模块句柄。零表示失败。会设置GetLastError

; DllCall("GetProcAddress", "Ptr", 模块句柄, "AStr", 函数名字, "Ptr")
; 通过模块句柄获得模块函数地址
; 返回模块地址 0x??????

; 在下面的示例中, 如果 DLL 还没有装载, 使用 LoadLibrary 代替 GetModuleHandle.
; MulDivProc := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "kernel32", "Ptr"), "AStr", "MulDiv", "Ptr")
; Loop 500
;     DllCall(MulDivProc, "Int", 3, "Int", 4, "Int", 3)

; WhichButton := DllCall("MessageBox", "Int", 0, "Str", "Press Yes or No", "Str", "Title of box", "Int", 4)
; MsgBox "You pressed button #" WhichButton
global MyStruct := BufferAlloc(16,0)

; DllCall("user32.dll", "int", "GetLastInputInfo", "ptr", DllStructGetPtr($LastInputInfo))

Home::{

    WhichButton := DllCall("GetLastInputInfo", "Ptr", MyStruct)
    OutputDebug 11111
    OutputDebug MyStruct
    OutputDebug WhichButton

}

; xy := DllCall("GetMessagePos","Ptr")

; OutputDebug xy ":aa"

; OnMessage(0x11, "WM_QUERYENDSESSION")
; OnMessage 0x201, "WM_LBUTTONDOWN"

; return

WM_LBUTTONDOWN(wParam, lParam, *)
{
    ENDSESSION_LOGOFF := 0x80000000
    if (lParam & ENDSESSION_LOGOFF) ; User is logging off.
        EventType := "Logoff"
    else ; System is either shutting down or restarting.
        EventType := "Shutdown"
    try
    {
        ; Set a prompt for the OS shutdown UI to display.  We do not display
        ; our own confirmation prompt because we have only 5 seconds before
        ; the OS displays the shutdown UI anyway.  Also, a program without
        ; a visible window cannot block shutdown without providing a reason.
        BlockShutdown("Example script attempting to prevent " EventType ".")
        return false
    }
    catch
    {
        ; ShutdownBlockReasonCreate is not available, so this is probably
        ; Windows XP, 2003 or 2000, where we can actually prevent shutdown.
        Result := MsgBox(EventType " in progress. Allow it?",, "YN")
        if (Result = "Yes")
            return true ; Tell the OS to allow the shutdown/logoff to continue.
        else
            return false ; Tell the OS to abort the shutdown/logoff.
    }
}

BlockShutdown(Reason)
{
    ; If your script has a visible GUI, use it instead of A_ScriptHwnd.
    DllCall("ShutdownBlockReasonCreate", "ptr", A_ScriptHwnd, "wstr", Reason)
    OnExit("StopBlockingShutdown")
}

StopBlockingShutdown(*)
{
    OnExit(A_ThisFunc, 0)
    DllCall("ShutdownBlockReasonDestroy", "ptr", A_ScriptHwnd)
}
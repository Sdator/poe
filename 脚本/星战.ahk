    ; 脚本多次运行替换旧实例 等同重启
    #SingleInstance force 

    ; 限制在某个进程内
    ; #IfWinActive, ahk_exe PathOfExile_x64.exe

    ;home获取当前鼠标位置的颜色

    PressKey := false
    Home::
        PressKey := ! PressKey
        loop{
            SetTimer, myhalfsec, 500

            if PressKey ; 如果此状态为 true, 那么用户实际已经释放了w 键.
            {
                break
            }
        }

    Return


    myhalfsec:
        Send {Enter}
    return








    ;CMD命令执行脚本 
    ;./AutoHotkeyU64 POE.ahk
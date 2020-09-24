;~ 运行脚本： F5
;~ AutoIt检查： Ctrl+F5
;~ 编译脚本： Ctrl+F7
;~ 构建脚本： F7
;~ 运行AutoIt帮助： Ctrl+F1
;~ 运行Au3Info： Ctrl+F6
;~ 调试到MsgBox： Ctrl+Shift+D
;~ 调试到控制台： Alt+D
;~ Run Koda： Alt+M
;~ 设置命令行参数： Shift+F8
;~ 杀死正在运行的脚本： Ctrl+Pause/Break
;~ 转到定义（跳转到变量或函数声明）： F12
;~ 窥视定义（在弹出窗口中显示声明）： Alt+F12
;~ 注意：
;~ 运行，编译和生成脚本功能需要完整安装SciTE4AutoIt3和AutoIt。
;~ 搜索符号，按一下Ctrl+Shift+O以查看当前脚本中已声明函数和变量的位置

;~  CTRL-ALT-F 开启或关闭AU3Info的信息刷新
;~ ALT-N       !n

;~ $result = DllCall("user32.dll", "int", "MessageBox", "hwnd", 0, "str", "这是对话框的文本", "str", "这是对话框的标题", "int", 0)
;~ 创建 C/C++ 数据结构供 DllCall 使用.

;~ DllCall("user32.dll", "int", "GetLastInputInfo", "ptr", DllStructGetPtr($rInfo))
;~ $nLastInput = DllStructGetData($rInfo, 2)
;~ echo($nLastInput)
;~ For $v In $r
;~     echo($v)
;~ Next

$isRun=False
$isSet=False

HotkeySet("{Home}", "AutoRun")
HotkeySet("{End}", "IsRun")

;~ 休眠
While true
    Sleep(10000)
WEnd

Func IsRun()
    $isRun = Not $isRun
    ;~ 修改鼠标连续点击之间的停顿时间.
    ;~ Opt("MouseClickDelay",1)
EndFunc

;~ Opt("MouseCoordMode",0)
Func ShowWindInfo()
    ;~ 防止程序自动退出
    While true
        Sleep(500)
        $pos = MouseGetPos()            ; 当前鼠标位置
        $gcp = WinGetCaretPos()         ; 当前窗口左上角坐标 窗口插入符的坐标
        $gap = WinGetPos("[ACTIVE]")    ; 当前窗口相对于屏幕的坐标  可获得窗口实际的位置 包含预留的位置
        $sControl = ControlGetFocus("[ACTIVE]")  ;文本区域 "句柄" 返回指定窗口上键盘焦点所在的控件的类别名.
        $cgp = ControlGetPos("[ACTIVE]", "", $sControl)  ;文本区域坐标 控件相对父窗口的坐标和大小


        if(IsArray($cgp)) Then
            ;~ 窗口相对坐标
            $wPosX = $pos[0] - $gap[0]
            $wPosY = $pos[1] - $gap[1]
            ;~ 控件相对窗口坐标
            $cPosX = $pos[0] - $gcp[0]
            $cPosY = $pos[1] - $gcp[1]

            $strpos = StringFormat("鼠标坐标 -> %s : %s%s", $pos[0],$pos[1],@CRLF) _
                & StringFormat("窗口相对坐标 -> %s : %s%s", $wPosX, $wPosY,@CRLF) _
                & StringFormat("控件相对坐标 -> %s : %s%s", $cPosX, $cPosY,@CRLF) _
                & StringFormat("WinGetPos -> %s : %s ： %s : %s%s", $gap[0],$gap[1],$gap[2],$gap[3],@CRLF) _
                & StringFormat("ControlGetPos -> %s : %s : %s : %s%s", $cgp[0],$cgp[1],$cgp[2],$cgp[3],@CRLF) _
                & StringFormat("WinGetCaretPos -> %s : %s%s", $gcp[0],$gcp[1],@CRLF) _
                ;~ & StringFormat("ControlGetFocus -> %s%s", $sControl,@CRLF) _
                ;~ & StringFormat("长度 -> %s%s", UBound($cgp),@CRLF) _

            ToolTip( $strpos,@DesktopWidth/4,@DesktopHeight	/2)
        EndIf
    WEnd
EndFunc




Func ShowWindState()
    $isSet = Not $isSet
    ;~ 设置获取鼠标位置的方式为相对于窗口
    Opt("MouseCoordMode",$isSet)
    ;~ 窗口模式
    ;~  Opt("WinTitleMatchMode",4)
    ;~ 获取窗口句柄
    $wHWND = WinGetHandle ("Cunt Empire - Google Chrome")
    ;~ 获取控件句柄
    $cHWND = ControlGetHandle(HWnd($wHWND),"","[CLASS:Intermediate D3D Window; INSTANCE:1]")

    While 0
        Sleep(500)
        $pos = MouseGetPos()  ; 当前鼠标位置
        $wSize = WinGetClientSize(HWnd($wHWND)) ; 取窗口大小
        $cSize = WinGetClientSize(HWnd($cHWND)) ; 取控件大小  获取窗口客户区的大小.
        $wwgp = WinGetPos(HWnd($wHWND)) ;获取父窗口相对于 桌面的位置
        $cwgp = WinGetPos(HWnd($cHWND)) ;获取子窗口相对于 桌面的位置

        $cx =  $pos[0] - $cwgp[0]
        $cy =  $pos[1] - $cwgp[1]

        $wx =  $pos[0] - $wwgp[0]
        $wy =  $pos[1] - $wwgp[1]

        $s = StringFormat("窗口句柄 -> %s%s窗口大小 -> %s:%s%s", $wHWND, @CRLF, $wSize[0], $wSize[1], @CRLF) _
            & StringFormat("控件句柄 -> %s%s窗口大小 -> %s:%s%s", $cHWND, @CRLF, $cSize[0], $cSize[1], @CRLF) _
            & StringFormat("鼠标坐标 -> %s:%s%s", $pos[0], $pos[1], @CRLF) _
            & StringFormat("窗口坐标 -> %s:%s%s", $wx, $wy, @CRLF) _
            & StringFormat("相对坐标 -> %s:%s%s", $cx, $cy, @CRLF) _
            & StringFormat("当前模式 -> %s%s",  $isSet, @CRLF) _
            & StringFormat("ww -> %s:%s%s", $wwgp[0], $wwgp[1], @CRLF) _
            & StringFormat("cw -> %s:%s%s", $cwgp[0], $cwgp[1], @CRLF) _

        ToolTip( $s,@DesktopWidth/2, @DesktopHeight/2)
    WEnd

EndFunc


Func AutoRun()
    ;~ 获取窗口句柄
    $wHWND = WinGetHandle ("Cunt Empire - Google Chrome")
    ;~ 获取控件句柄
    $cHWND = ControlGetHandle(HWnd($wHWND),"","[CLASS:Intermediate D3D Window; INSTANCE:1]")

    $pos = MouseGetPos()  ; 当前鼠标位置
    $cwgp = WinGetPos(HWnd($cHWND)) ;获取子窗口相对于 桌面的位置
    $cx =  $pos[0] - $cwgp[0]
    $cy =  $pos[1] - $cwgp[1]

    ;~ 创建结构体
    $rInfo = DllStructCreate("uint;dword")      ; # LASTINPUTINFO
    ;~ 填充结构体数据
    DllStructSetData($rInfo, 1, DllStructGetSize($rInfo))
    ;~ 旧的状态
    Global $old=DllCall("user32.dll", "int", "GetLastInputInfo", "ptr", DllStructGetPtr($rInfo))
    Global $nLastInput=DllCall("user32.dll", "int", "GetLastInputInfo", "ptr", DllStructGetPtr($rInfo))
    While true
        ;~ 获取输入设备空闲状态
        DllCall("user32.dll", "int", "GetLastInputInfo", "ptr", DllStructGetPtr($rInfo))
        ;~ 从结构体中读取数值
        $nLastInput = DllStructGetData($rInfo, 2)
        If ( ($nLastInput==$old) And $isRun) Then ; 当没有操作 并且 允许状态
            ControlClick(HWnd($wHWND), "", "", "left", 1, $cx, $cy)
            $old=$nLastInput
            ContinueLoop
        EndIf
        $old=$nLastInput
        Sleep(500)   ; 当用户操作给 0.5秒延迟
    WEnd
EndFunc



; post window 鼠标点击消息
Func PostButtonClick($hWnd, $x, $y)
    $HWND_BROADCAST = 65535  ; BitOR($hWnd, $HWND_BROADCAST)
    $WM_LBUTTONDOWN = 0x201
    $WM_LBUTTONUP = 0x202

    DllCall("user32.dll", "int", "PostMessage", _
            "hwnd",$hWnd, _ ; 窗口句柄 默认设置为顶层窗口
            "int", $WM_LBUTTONDOWN, _ ; 事件类型 鼠标按下
            "int", 0, _ ;wParam
            "hwnd", $x + BitShift($y,-16)) ;lParam
EndFunc   ;==>PostButtonClick




Func echo($v)
    $s = StringFormat("====== %s =====%s", $v, @CR)
    ConsoleWrite($s)
EndFunc




;~ #include <GUIConstants.au3>
;~ $IDC = 0
;~ ;~ 注册热键
;~ ;~ HotkeySet("{Esc}", "GetPos")
;~ ;~ 创建窗口并设置标题和窗口大小
;~ GUICreate("按 Esc 更新坐标位置", 400, 400)
;~ ;~ 创建文本标签控件 初始文本、大小、位置
;~ $x=GUICtrlCreateLabel ("0", 10, 10,50)
;~ $y=GUICtrlCreateLabel ("0", 10, 30,50)
;~ ;~ 绘制窗口
;~ GUISetState()

;~ ; 运行脚本直到窗口被关闭
;~ Do
;~ $msg = GUIGetMsg()
;~ Until $msg = $GUI_EVENT_CLOSE
;~ Exit


;~ Func GetPos()
;~     $a=GUIGetCursorInfo()
;~     GUIctrlSetData($x,$a[0])
;~     GUIctrlSetData($y,$a[1])
;~ EndFunc

;~ MsgBox(0, "第二个脚本！", "此对话框从函数中调出！")


;~ 函数调用
;~ TestFunc()
Func TestFunc()
    MsgBox(0, "第二个脚本！", "此对话框从函数中调出！")
EndFunc
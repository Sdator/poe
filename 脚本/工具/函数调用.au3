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

HotkeySet("{Home}", "state")

;~ 防止程序自动退出
While true
    Sleep(100)
    $pos = MouseGetPos()            ; 当前鼠标位置
    $gcp = WinGetCaretPos()         ; 当前窗口左上角坐标 相对于屏幕的
    $gap = WinGetPos("[ACTIVE]")    ; 当前窗口相对于屏幕的坐标
    $sControl = ControlGetFocus("[ACTIVE]")  ;文本区域 "句柄" 返回指定窗口上键盘焦点所在的控件的类别名.
    $cgp = ControlGetPos("[ACTIVE]", "", $sControl)  ;文本区域坐标 控件相对父窗口的坐标和大小

    $cgp = ControlGetPos("[ACTIVE]", "", "[CLASS:Intermediate D3D Window; INSTANCE:1]")
    if(IsArray($cgp)) Then
        $strpos = & StringFormat("鼠标坐标 -> %s : %s%s", $pos[0],$pos[1],@CRLF) _
            & StringFormat("窗口鼠标坐标 -> %s : %s%s", $pos[0] - $gap[0], $pos[1] - $gap[1],@CRLF) _
            & StringFormat("子窗口坐标 -> %s : %s%s", $pos[0] - $gap[0]-$cgp[0],$pos[1] - $gap[1]-$cgp[1],@CRLF) _  ;子窗口相对父窗口的位置
            & StringFormat("WinGetPos -> %s : %s ： %s : %s%s", $gap[0],$gap[1],$gap[2],$gap[3],@CRLF) _
            & StringFormat("ControlGetFocus -> %s%s", $sControl,@CRLF) _
            & StringFormat("长度 -> %s%s", UBound($cgp),@CRLF) _
            & StringFormat("ControlGetPos -> %s : %s : %s : %s%s", $cgp[0],$cgp[1],$cgp[2],$cgp[3],@CRLF) _
            & StringFormat("WinGetCaretPos -> %s : %s%s", $gcp[0],$gcp[1],@CRLF) _

        ToolTip( $strpos,@DesktopWidth/2,@DesktopHeight	/2)
    EndIf

WEnd


;~ autoRun()

Func state()
    ;~ PostButtonClick(0,$pos[0],$pos[1])
    $isRun= NOT $isRun
    if($isRun) Then
        $pos = MouseGetPos()
        ;~ ControlGetPos ( "Cunt Empire - Google Chrome", "")
        ;~ PostButtonClick(0,$pos[0],$pos[1])
        echo($pos[0])
        echo($pos[1])
    EndIf
EndFunc


Func autoRun()
    ;~ 创建结构体
    $rInfo = DllStructCreate("uint;dword")      ; # LASTINPUTINFO
    ;~ 填充结构体数据
    DllStructSetData($rInfo, 1, DllStructGetSize($rInfo))
    ;~ 旧的状态
    $old=DllCall("user32.dll", "int", "GetLastInputInfo", "ptr", DllStructGetPtr($rInfo))
    $num=0
    While true
        ;~ 获取输入设备空闲状态
        DllCall("user32.dll", "int", "GetLastInputInfo", "ptr", DllStructGetPtr($rInfo))
        ;~ 从结构体中读取数值
        $nLastInput = DllStructGetData($rInfo, 2)
        If ($nLastInput>$old And $isRun) Then
            $num+=1
            echo($num)
            ;~ DllCall("user32.dll", "int", "PostMessageA", "ptr",)
        EndIf
        $old=$nLastInput
    WEnd
EndFunc



; RePost a WM_COMMAND message to a ctrl in a gui window
Func PostButtonClick($hWnd, $x, $y)
    $HWND_BROADCAST = 65535
    $WM_LBUTTONDOWN = 0x201
    $WM_LBUTTONUP = 0x202
    DllCall("user32.dll", "int", "PostMessage", _
            "hwnd", BitOR($hWnd, $HWND_BROADCAST), _ ; 窗口句柄 默认设置为顶层窗口
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
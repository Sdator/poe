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
$isPgup=False
$num=0


HotkeySet("{Home}", "AutoRun")
HotkeySet("{End}", "IsRun")
HotkeySet("{pgup}", "AutoClick")
;~ HotkeySet("{v}", "v")

$dll = DllOpen("user32.dll")
;~ 鼠标中键（三键鼠标）
$VK_MBUTTON=0X04

Func v()
    ;~ Send("{middle}",1)
    ;~ MouseDown("middle")
    $state = DllCall($dll, "int", "GetAsyncKeyState", "int", $VK_MBUTTON)
    if (IsArray($state)) Then
        $s=""
        For $v In $state
            $s = $s & @CRLF & $v
            ;~ StringFormat("上一次%s",$v , @CRLF)
        Next
        echo($s)
    EndIf
EndFunc



;~ HotkeySet("{pgdn}", "ShowWindState")

;~ 休眠
While true
    ;~ v()
    Sleep(100)
WEnd


;~ Opt("MouseCoordMode",0)
;~ 显示基础信息
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

;~ 还原设置
Func DefSet($MouseCoordMode=Default, $MouseClickDelay=Default)
    Opt("MouseCoordMode",$MouseCoordMode);~ 窗口捕获模式
    Opt("MouseClickDelay",$MouseClickDelay);~ 鼠标点击的间隔
EndFunc



Func ShowWindState()
    $isSet = Not $isSet
    ;~ 设置获取鼠标位置的方式为相对于窗口
    If ($isSet) Then
        $mode=0
    else
        $mode=2
    EndIf

    DefSet($mode)

    ;~ 窗口模式
    ;~  Opt("WinTitleMatchMode",4)
    ;~ 获取窗口句柄
    $wHWND = WinGetHandle ("Cunt Empire - Google Chrome")
    ;~ 获取控件句柄
    $cHWND = ControlGetHandle(HWnd($wHWND),"","[CLASS:Intermediate D3D Window; INSTANCE:1]")

    While 1
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

Func AutoClick()
    ;~  客户区坐标、鼠标点击间隔
    DefSet(Default,1)
    $isPgup = Not $isPgup
    While $isPgup
        MouseClick("left")
        Sleep(2000)
    WEnd
EndFunc


;~ 状态控制
Func IsRun()
    $isRun = Not $isRun
EndFunc

;~ 半后台post点击
Func AutoRun()

    ;~ Opt("MouseClickDelay",5);~ 修改鼠标点击的间隔
    ;~ Opt("MouseCoordMode",2) ;~ 使用客户区坐标
    DefSet(2,4)

    ;~ 获取窗口句柄
    $wHWND = HWnd(WinGetHandle ("Cunt Empire - Google Chrome"))
    $pos = MouseGetPos()  ; 当前鼠标位置
    $cx =  $pos[0]
    $cy =  $pos[1]

    ;~ $isRun = Not $isRun

    ;~ 已用 MouseCoordMode 配置来实现 客户区域模式下操作
    ;~ $wHWND = HWnd(WinGetHandle ("Cunt Empire - Google Chrome")) ;~ 获取窗口句柄
    ;~ $cHWND = ControlGetHandle($wHWND,"","[CLASS:Intermediate D3D Window; INSTANCE:1]");~ 获取控件句柄
    ;~ $pos = MouseGetPos()  ; 当前鼠标位置
    ;~ $cwgp = WinGetPos(HWnd($cHWND)) ;获取子窗口相对于 桌面的位置
    ;~ $cx =  $pos[0] - $cwgp[0]
    ;~ $cy =  $pos[1] - $cwgp[1]

    ;~ 创建结构体
    $rInfo = DllStructCreate("uint;dword")      ; # LASTINPUTINFO
    ;~ 填充结构体数据
    DllStructSetData($rInfo, 1, DllStructGetSize($rInfo))
    ;~ 获取结构体指针地址
    $addr = DllStructGetPtr($rInfo)

    ;~ 预先打开需要使用的 dll 直接调用预先打开的 dll 句柄
    $dll = DllOpen("user32.dll")

    ;~ 上一次输入设备的状态
    $old=0
    $time=0

    While true

        ;~ 获取输入设备空闲状态
        DllCall($dll, "int", "GetLastInputInfo", "ptr", $addr)
        ;~ 从结构体中读取数值
        $nLastInput = DllStructGetData($rInfo, 2)
        If ( ($nLastInput==$old) And $isRun ) Then ; 当没有操作 并且 允许状态
            ControlClick($wHWND, "", "", "left", 1, $cx, $cy)
            ;~ ToolTip( $time,@DesktopWidth/3, @DesktopHeight/2)
            $old = $nLastInput
            ;~ $time+=1
            ;~ If $time > 10000 Then
            ;~     Sleep(100)
            ;~     ControlClick($wHWND, "", "", "left",1, $cx+144, $cy+144)
            ;~     Sleep(100)
            ;~     $time=0
            ;~ EndIf
            ContinueLoop
        EndIf
        ;~ ToolTip( $time,@DesktopWidth/2, @DesktopHeight/2)
        $old=$nLastInput
        Sleep(2000)   ; 当用户操作给 0.5秒延迟
    WEnd
    ;~ 这里永远不会执行 所以让程序退出的时候自动释放 dll
    ;~ DllClose($dll)
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

$num=0
Func echo($v)
    ;~ $num+=1
    Sleep(100)
    ToolTip( $v,@DesktopWidth/2, @DesktopHeight/2)
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
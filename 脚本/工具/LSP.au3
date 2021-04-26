
#comments-start
SPI(服务提供者)函数集合类型：
SPI函数类型总数：4种类型,每一种类型都有自己所属的开头,例如WSC、WSP

    WSC	安装、移除、修改分层服务提供者和命名空间提供者程序
    WSP	分层服务提供者的API
    WPU	分层服务提供者使用的支持函数
    NSP	命名空间服务提供者的API

SPI提供三种协议：

    1、分层协议：处在基础协议的上一层,依靠基础协议作为通信基础。
    2、基础协议：能够独立、安全、远程端点实现数据通信的协议。
    3、协议链：将一系列基础协议和分层协议按特定顺序连接在一起。

LSP(Layered Service Provider)技术,这个技术已经被微软给废弃了,因为不安全,我记得国内很多流氓软件(比如说某某视频平台的客户端)都会给你的系统装LSP,劫持你的流量什么,导致你的网络挂掉.已经注册了的LSP可以在Autoruns工具里查看

参考
    https://blog.csdn.net/Aaron133/article/details/78005779
    https://blog.csdn.net/aaron133/article/details/78028942
    https://www.cnblogs.com/chengxuyuandashu/p/3801490.html

#comments-end


#cs
类型
    typedef DWORD *PDWORD;      有符号 32 位整数 指针
    typedef DWORD *LPDWORD;     无符号 32 位整数 指针

    L = 无符号  长整型 32位  lenth长度
    P = 指针
#ce



;~ typedef struct _WSAPROTOCOL_INFOW {
;~   DWORD            dwServiceFlags1;
;~   DWORD            dwServiceFlags2;
;~   DWORD            dwServiceFlags3;
;~   DWORD            dwServiceFlags4;
;~   DWORD            dwProviderFlags;
;~   GUID             ProviderId;
;~   DWORD            dwCatalogEntryId;
;~   WSAPROTOCOLCHAIN ProtocolChain;
;~   int              iVersion;
;~   int              iAddressFamily;
;~   int              iMaxSockAddr;
;~   int              iMinSockAddr;
;~   int              iSocketType;
;~   int              iProtocol;
;~   int              iProtocolMaxOffset;
;~   int              iNetworkByteOrder;
;~   int              iSecurityScheme;
;~   DWORD            dwMessageSize;
;~   DWORD            dwProviderReserved;
;~   WCHAR            szProtocol[WSAPROTOCOL_LEN + 1];
;~ } WSAPROTOCOL_INFOW, *LPWSAPROTOCOL_INFOW;


;~ 创建结构体 包含了两个成员
$rInfo = DllStructCreate("DWORD;DWORD;DWORD;DWORD;DWORD")
;~ 给第一个成员 设置内容 为结构体的大小
;~ DllStructSetData($rInfo, 1, 123)
;~ DllStructSetData($rInfo, 2, 255)
;~ DllStructSetData($rInfo, 3, 321)

;~ 获取结构体指针地址
$addr = DllStructGetPtr($rInfo)

If @error Then
    MsgBox(4096,"","DllStructCreate 发生错误" & @error);
    Exit
EndIf

Dim $err,$a,$b

$abc = DllCall("Ws2_32.dll", "int", "WSCEnumProtocols", _
    "int*",$a, _
    "ptr",$addr, _
    "DWORD*",$b, _
    "int*",$err)


;~ 数据结构大小：
echo("a:" & DllStructGetSize($rInfo ))
;~ 数据结构指针：
echo("b:" & DllStructGetPtr($rInfo ))
echo("c:" & $err)
echo("abc:" & $abc)
echo("aa:" & $a)
echo("bb:" & $b)

;~ 循环读取结构体
For $i = 0 To DllStructGetSize($rInfo ) Step +1
    echo($i & ":" & DllStructGetData($rInfo, $i))
Next


Func echo($s)
    ConsoleWrite($s & @CRLF)
EndFunc



;~ LPINT lpiProtocols,
;~ LPWSAPROTOCOL_INFOW lpProtocolBuffer,
;~ LPDWORD lpdwBufferLength,
;~ LPINT lpErrno



;~ DllCall("user32.dll", "bool", "PostMessage", "hwnd", $hWnd, "uint", $iMsg, "wparam", $wParam, "lparam", $lParam)


;~ BOOL PostMessageA(
;~ HWND   hWnd,
;~ UINT   Msg,
;~ WPARAM wParam,
;~ LPARAM lParam
;~ );
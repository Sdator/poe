;����֮ǰ���е�ʵ�� ������ʾ 
#SingleInstance Force
    

SetWorkingDir A_ScriptDir

url := "http://www.jiqie.com/a/re22.php"

name := InputBox("������","������մ���")

if(!name)
    name := "����"
MsgBox name

data :="
(LTrim Join&
id=%name%
id_=pihun
i_d=jiqie
id1=30
id2=905
id3=#0000FF
id4=#0000DD
id5=#0000AA
id6=#000077
)"

Pbin := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Pbin.Open("POST", url)
Pbin.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    Pbin.Send(data)
out:=SubStr(Pbin.ResponseText,13,14)
urlimg:="http://www.jiqie.com" . out
fileimg:=name . ".gif"
UrlDownloadToFile(urlimg,fileimg)

if ErrorLevel=1
    MsgBox ����
else
{
    IfExist(fileimg)
        run %fileimg%
    else
        MsgBox ����
}


#SingleInstance Force 

global isrun
global PressKey := True

*Home::
    PressKey := False
    isrun := ! isrun
return 


; �һ�ȡ��
~*RButton::
~*LButton up::
    PressKey := True
return


#IF WinActive("ahk_exe game.exe") && isrun


~*F1::
; ��ס��� ����������
~*LButton::
    PressKey := False
    ; ��ʱ��ѭ������
    SetTimer "SendKey",50
return

; ����
SendKey(){
    Send "{LButton}"
    If (PressKey){
        SetTimer , 0
    }
}

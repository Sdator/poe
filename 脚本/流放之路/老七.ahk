
#SingleInstance Force 

global PressKey := False

; r ����������
r up::
    PressKey := True
    ; ��ʱ��ѭ������
    SetTimer "SendKey",200
return

; �һ�ȡ��
~*RButton::
    PressKey := False
    Send "{r up}"
return

; ����
SendKey(){
    If (PressKey){
        Send "{r down}"
        return
    }
    SetTimer , 0
}

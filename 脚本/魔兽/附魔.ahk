
; �ű���������滻��ʵ�� ��ͬ����
#SingleInstance force 

global PressKey := false

F1::
PressKey := ! PressKey       
if PressKey
    SetTimer, fun, 500
else
    SetTimer, fun, off
Return


fun:
Click, 824,740
; Click, 778,315
; Click, 52,682
; 鞋子
; Click, 459,453
; 胸甲
; Click, 53,512
; 披风
Click, 54,453

Click, 850,270


Sleep, 6000

return



Home::
MouseGetPos, MouseX, MouseY
MsgBox, % MouseX "," MouseY
Return

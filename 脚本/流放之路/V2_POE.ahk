
/*
2019.12.25   By:�^����塢 250740270

��������
*   �첽    ��ʹ������������Ҳ�ܴ�����ǰ���� 
~   ����    ��������ԭ�еĹ��� ������ȫ���ӹ�

*/

; �����Ի����Զ��滻��ʵ��, Ч�������� Reload ����.
#SingleInstance Force 


global isrun

*F1::isrun := ! isrun

; #If WinActive("ahk_exe start_for_wegame.exe") && isrun
#IF (WinActive("ahk_exe start_for_wegame.exe") || WinActive("ahk_exe PathOfExile_x64.exe")) && isrun
    

; �ͷŵ��� + ����
~*RButton up::
    Sleep(200)
    Send "d"
Return

; ҩ + ���� + buff
*q::Send "12345d{Numpad1}{Numpad2}{Numpad3}"

; λ�� + ���� + buff
~*d::Send "q{Numpad1}{Numpad2}{Numpad3}"

; ����
*f::Send "{Numpad4}"

; ����
*v::Send "{MButton}"

;����ҩ + ���� + buff
*1::Send "q12345{Numpad1}{Numpad2}{Numpad3}d"

; �¿� ���� ����
~*2::Send "d6"
~*3::Send "d7"

/*
; �¿� �����ը��
2::
    Send {6}
Return

3::
    Send {Numpad5}
    Send {7}
Return
*/

; ���4 5���л�����
XButton1::Send "{Right}"
XButton2::Send "{Left}"


f2::Send "��"
f3::Send "ͷ"
f4::Send "��"
f5::Send "��ָ"
f6::Send "����"


/*
; ���ܼ�
; f2::Send "{enter}/2{enter}"
f3::Send "{enter}/1{enter}"
f4::Send "{enter}/c{enter}"
; f5::Send "{enter}/h{enter}"
f6::Send "{enter}/oos{enter}"

*/

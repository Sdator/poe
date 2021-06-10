/*
2021.6.11 by:绝版大叔、

*/

#SingleInstance Force

global isRun := False

#HotIf (WinActive("ahk_exe Warframe.x64.exe"))

Home::{
    huaban()
}

huaban(){
    global isRun:=!isRun
    If (isRun){
        SetTimer "jump",100
        Send "{Shift}"
        Send "{w down}"
    } else {
        SetTimer "jump",0
        Send "{w up}"
    }
    jump(){
        Send "{WheelDown}"
    }
}

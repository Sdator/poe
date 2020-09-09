#SingleInstance Force

global isOn := False

;  找色
Home::{
    isOn := !isOn
    xz()
    If (isOn)
        SetTimer "xz",10000
    Else SetTimer "xz",0

}

F3::{
    ; MouseGetPos MouseX, MouseY
    ; ; Color := PixelGetColor(MouseX, MouseY)
    ; MsgBox MouseX ":" MouseY
    i := Random(1, 4)
    isFind := ImageSearch(x, y, 0, 0, 1920, 1080, Format("*1 .\data\{1}.png", i))
    MsgBox isFind ":" i

    ; cx:=1920/2
    ; cy:=1080/2
    ; arr:=[]
    ; arr.Push([cx+400,cy+400,cx,cx])
    ; arr.Push([cx+400,cy-400,cx,cx])
    ; arr.Push([cx-400,cy-400,cx,cx])
    ; arr.Push([cx-400,cy+400,cx,cx])

    ; For k, v in arr{
    ;     MsgBox v[k]
    ; }
    ; Loop 4{
    ;     i:=A_Index
    ;     Loop 4{
    ;         MsgBox arr[i][A_Index]
    ;     }
    ; }

    ; MouseGetPos MouseX, MouseY
    ; Color := PixelGetColor(MouseX, MouseY)
}

; 捉图坐标根据全屏坐标模式
CoordMode "Pixel"

cx:=1920/2
cy:=1080/2
arr:=[]
arr.Push([cx+400,cy+400,cx,cx])
arr.Push([cx+400,cy-400,cx,cx])
arr.Push([cx-400,cy-400,cx,cx])
arr.Push([cx-400,cy+400,cx,cx])

; 挖矿
xz(){
    global arr
    i := Random(1, 4)
    ; 指定范围找色
    ; isFind := PixelSearch(Px, Py, arr[i][1],arr[i][2],arr[i][3],arr[i][4], 0x3E3B42, 3)
    ; isFind :=ImageSearch(x, y, 0, 0, 1920, 1080, *250 "\data\%0.png")
    ; MsgBox isFind
    ; %A_WorkingDir%
    ; Click Px, Py
}

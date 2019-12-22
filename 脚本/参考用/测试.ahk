#SingleInstance Force
    
global PressKey := false
Home::
    MsgBox PressKey
    PressKey := ! PressKey
    loop {
        
        SetTimer("myhalfsec",1000)
        
        if PressKey
        {
            break
        }
    }
    
Return

myhalfsec(){
    Send "d"
}



; Air 250740270 2019.12.21

#SingleInstance Force
    

*r::
    
    Loop
    {
        Sleep, 50
        ; P: 获取物理状态 (即用户是否实际按住了按键)
        GetKeyState, state, r, P
        if state = U  ; 按键已经被释放, 所以退出循环.
            break
        ; ... 此处放置您想要重复的任何动作.
        Send {r}
        
    }
    
return


; Capslock to Esc on tap, Ctrl on press
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 150)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

; Hold semicolon as a chord for vim-like navigation
*;::Input, Key, VL1
*; Up::
Input
Key := StrLen(Key)
IF A_PriorHotKey = *;
{
	SendInput, {Left %Key%}
	SendInput, {Blind};
	SendInput, {Right %Key%}
}
Key =
Return
#If GetKeyState(";","P")
h::left
j::down
k::up
l::right
d::pgdn
u::pgup
e::^right
w::^right
b::^left
0::Home
4::End
Space::BS
n::Tab
p::+Tab
m::return
o::return
#If

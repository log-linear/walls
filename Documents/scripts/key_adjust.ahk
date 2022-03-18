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

; Press LAlt for backspace, hold LAlt as a chord for vim-like navigation
*LAlt::Input, Key, VL1
*LAlt Up::
Input
Key := StrLen(Key)
IF A_PriorHotKey = *LAlt
{
	SendInput, {Left %Key%}
	SendInput, {Blind}{BS}
	SendInput, {Right %Key%}
}
Key =
Return
#If GetKeyState("LAlt","P")
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

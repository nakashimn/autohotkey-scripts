#include function.ahk
#include GUI/snippets_list/main.ahk

;Enter
<+Space::SendInput "{Enter}"
<+<^Space::SendInput "{LControl down}{Space}"
sc07B & Space::SendInput "{Enter}"

;BackSpace
sc028::BackSpace

;Delete
<+]::Send "{LShift TempUp}{Delete}"

;Escape
sc029::Escape
<+w::Escape

;Cursor
<+i::SendInput "{Up}"
<+j::SendInput "{Left}"
<+k::SendInput "{Down}"
<+l::SendInput "{Right}"
<+<^i::SendInput "{LControl Down}{Up}"
<+<^j::SendInput "{LControl Down}{Left}"
<+<^k::SendInput "{LControl Down}{Down}"
<+<^l::SendInput "{LControl Down}{Right}"
<+<!i::SendInput "{LAlt Down}{Up}"
<+<!j::SendInput "{LAlt Down}{Left}"
<+<!k::SendInput "{LAlt Down}{Down}"
<+<!l::SendInput "{LAlt Down}{Right}"
<+<^<!i::SendInput "{LControl Down}{LAlt Down}{Up}"
<+<^<!j::SendInput "{LControl Down}{LAlt Down}{Left}"
<+<^<!k::SendInput "{LControl Down}{LAlt Down}{Down}"
<+<^<!l::SendInput "{LControl Down}{LAlt Down}{Right}"
<+>+i::SendInput "{RShift Down}{Up}"
<+>+j::SendInput "{RShift Down}{Left}"
<+>+k::SendInput "{RShift Down}{Down}"
<+>+l::SendInput "{RShift Down}{Right}"
<+>+<^i::SendInput "{RShift Down}{LControl Down}{Up}"
<+>+<^j::SendInput "{RShift Down}{LControl Down}{Left}"
<+>+<^k::SendInput "{RShift Down}{LControl Down}{Down}"
<+>+<^l::SendInput "{RShift Down}{LControl Down}{Right}"
<+>+<!i::SendInput "{RShift Down}{LAlt Down}{Up}"
<+>+<!j::SendInput "{RShift Down}{LAlt Down}{Left}"
<+>+<!k::SendInput "{RShift Down}{LAlt Down}{Down}"
<+>+<!l::SendInput "{RShift Down}{LAlt Down}{Right}"
<+>+<^<!i::SendInput "{RShift Down}{LControl Down}{LAlt Down}{Up}"
<+>+<^<!j::SendInput "{RShift Down}{LControl Down}{LAlt Down}{Left}"
<+>+<^<!k::SendInput "{RShift Down}{LControl Down}{LAlt Down}{Down}"
<+>+<^<!l::SendInput "{RShift Down}{LControl Down}{LAlt Down}{Right}"
sc07B & i::Up
sc07B & j::Left
sc07B & k::Down
sc07B & l::Right

;Nunber
sc07B & q::SendInput 4
sc07B & w::SendInput 5
sc07B & e::SendInput 6
sc07B & a::SendInput 7
sc07B & s::SendInput 8
sc07B & d::SendInput 9
sc07B & x::SendInput 0
sc07B & z::SendInput "/"
sc07B & c::SendInput "."
sc07B & 4::SendInput "{+}"
sc07B & r::SendInput "-"
sc07B & f::SendInput "*"
sc07B & v::SendInput "="

;PageUp
<+<^u::SendInput "{LControl Down}{PgUp}"

;PageDown
<+<^o::SendInput "{LControl Down}{PgDn}"

;Home
<+h::SendInput "{Home}"

;Caret
<+u::SendInput "{^}"

;Backslash
<+o::send_input_toggled_by_space("{\}", "{|}")

;Dollar
<+@::SendInput "{$}"

;Coron
<+sc028::SendInput "{sc028}"

;Alt Tab
sc07B & Tab::AltTab

;Function
<+r::SendInput "{F2}"

;Window size
#<+i::SendInput "{LWin Down}{Up}"
#<+j::SendInput "{LWin Down}{Left}"
#<+k::SendInput "{LWin Down}{Down}"
#<+l::SendInput "{LWin Down}{Right}"

;" or '
<+n::send_input_toggled_by_space("{`"}", "'")

;_ or #
<+m::send_input_toggled_by_space("_", "{#}")

;[ or {
<+sc033::send_input_toggled_by_space("[", "{{}")

;] or }
<+.::send_input_toggled_by_space("]", "{}}")

;- or &
<+p::send_input_toggled_by_space("-", "&")

;= or %
<+sc027::send_input_toggled_by_space("=", "%")

;snippet select window
sc079::{
  target_selector.show()
}

;===============================================================================
;SandS
;===============================================================================
SandS_SpaceDown := 0
SandS_AnyKeyPressed := 0
*Space::{
  global SandS_SpaceDown
  global SandS_AnyKeyPressed
  SendInput "{RShift Down}"
  if (SandS_SpaceDown == 1) {
    return
  }
  SandS_SpaceDown := 1
  SandS_SpaceDownTime := A_TickCount
  SandS_AnyKeyPressed := 0
  input_hook := InputHook("L1 V", "{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}")
  input_hook.Start()
  input_hook.Wait(0.2)
  SandS_AnyKeyPressed := 1
  return
}

*Space Up::{
  global SandS_SpaceDown
  global SandS_AnyKeyPressed
  SendInput "{RShift Up}"
  SandS_SpaceDown := 0
  if (SandS_AnyKeyPressed == 0) {
    if GetKeyState("LControl", "P"){
      SendInput "{sc029}"
    }else{
      SendInput "{Space}"
    }
    Send "{RControl}"
  }
}

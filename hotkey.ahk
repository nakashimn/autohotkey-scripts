#include function.ahk
#include GUI/snippets_list/main.ahk

;===============================================================================
;Hotkey
;===============================================================================
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
<+u::SendInput "{PgUp}"
<+o::SendInput "{PgDn}"
<+<^i::SendInput "{LControl Down}{Up}"
<+<^j::SendInput "{LControl Down}{Left}"
<+<^k::SendInput "{LControl Down}{Down}"
<+<^l::SendInput "{LControl Down}{Right}"
<+<^u::SendInput "{LControl Down}{PgUp}"
<+<^o::SendInput "{LControl Down}{PgDn}"
<+<!i::SendInput "{LAlt Down}{Up}"
<+<!j::SendInput "{LAlt Down}{Left}"
<+<!k::SendInput "{LAlt Down}{Down}"
<+<!l::SendInput "{LAlt Down}{Right}"
<+<!u::SendInput "{LAlt Down}{PgUp}"
<+<!o::SendInput "{LAlt Down}{PgDn}"
<+<^<!i::SendInput "{LControl Down}{LAlt Down}{Up}"
<+<^<!j::SendInput "{LControl Down}{LAlt Down}{Left}"
<+<^<!k::SendInput "{LControl Down}{LAlt Down}{Down}"
<+<^<!l::SendInput "{LControl Down}{LAlt Down}{Right}"
<+<^<!u::SendInput "{LControl Down}{LAlt Down}{PgUp}"
<+<^<!o::SendInput "{LControl Down}{LAlt Down}{PgDn}"
<+>+i::SendInput "{Shift Down}{Up}"
<+>+j::SendInput "{Shift Down}{Left}"
<+>+k::SendInput "{Shift Down}{Down}"
<+>+l::SendInput "{Shift Down}{Right}"
<+>+u::SendInput "{Shift Down}{PgUp}"
<+>+o::SendInput "{Shift Down}{PgDn}"
<+>+<^i::SendInput "{Shift Down}{LControl Down}{Up}"
<+>+<^j::SendInput "{Shift Down}{LControl Down}{Left}"
<+>+<^k::SendInput "{Shift Down}{LControl Down}{Down}"
<+>+<^l::SendInput "{Shift Down}{LControl Down}{Right}"
<+>+<^u::SendInput "{Shift Down}{LControl Down}{PgUp}"
<+>+<^o::SendInput "{Shift Down}{LControl Down}{PgDn}"
<+>+<!i::SendInput "{Shift Down}{LAlt Down}{Up}"
<+>+<!j::SendInput "{Shift Down}{LAlt Down}{Left}"
<+>+<!k::SendInput "{Shift Down}{LAlt Down}{Down}"
<+>+<!l::SendInput "{Shift Down}{LAlt Down}{Right}"
<+>+<!u::SendInput "{Shift Down}{LAlt Down}{PgUp}"
<+>+<!o::SendInput "{Shift Down}{LAlt Down}{PgDn}"
<+>+<^<!i::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Up}"
<+>+<^<!j::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Left}"
<+>+<^<!k::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Down}"
<+>+<^<!l::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Right}"
<+>+<^<!u::SendInput "{Shift Down}{LControl Down}{LAlt Down}{PgUp}"
<+>+<^<!o::SendInput "{Shift Down}{LControl Down}{LAlt Down}{PgDn}"
sc07B & i::Up
sc07B & j::Left
sc07B & k::Down
sc07B & l::Right
sc07B & u::Browser_Back
sc07B & o::Browser_Forward

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

;Home
<+h::SendInput "{Home}"

;Backslash
<+/::SendInput "{\}"

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

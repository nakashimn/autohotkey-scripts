#include function.ahk
#include GUI/snippets_list/main.ahk

;===============================================================================
;Hotkey
;===============================================================================
;click
<^m::Click "Left"
sc070::Click "Left"
<^sc033::Click "Right"
<^.::Click "Right"
AppsKey::Click "Right"

;Enter
<+Space::SendInput "{Enter}"
<+<^Space::SendInput "{LControl down}{Space}"
sc07B & Space::SendInput "{Enter}"

;BackSpace
sc028::BackSpace

;Delete
]::Delete

;Escape
sc029::Escape
[::Escape

;Cursor
<+i::SendInput "{Up}"
<+j::SendInput "{Left}"
<+k::SendInput "{Down}"
<+l::SendInput "{Right}"
<+<^i::SendInput "{LControl Down}{Up}"
<+<^j::SendInput "{LControl Down}{Left}"
<+<^k::SendInput "{LControl Down}{Down}"
<+<^l::SendInput "{LControl Down}{Right}"
<+<^u::SendInput "{PgUp}"
<+<^o::SendInput "{PgDn}"
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
<+>+<^i::SendInput "{Shift Down}{LControl Down}{Up}"
<+>+<^j::SendInput "{Shift Down}{LControl Down}{Left}"
<+>+<^k::SendInput "{Shift Down}{LControl Down}{Down}"
<+>+<^l::SendInput "{Shift Down}{LControl Down}{Right}"
<+>+<!i::SendInput "{Shift Down}{LAlt Down}{Up}"
<+>+<!j::SendInput "{Shift Down}{LAlt Down}{Left}"
<+>+<!k::SendInput "{Shift Down}{LAlt Down}{Down}"
<+>+<!l::SendInput "{Shift Down}{LAlt Down}{Right}"
<+>+<^<!i::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Up}"
<+>+<^<!j::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Left}"
<+>+<^<!k::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Down}"
<+>+<^<!l::SendInput "{Shift Down}{LControl Down}{LAlt Down}{Right}"
sc07B & i::Up
sc07B & j::Left
sc07B & k::Down
sc07B & l::Right

;IME on
$1::send_input_toggled_by_space("1", "!")
$2::send_input_toggled_by_space("2", "`"")
$3::send_input_toggled_by_space("3", "#")
$4::send_input_toggled_by_space("4", "$")
$5::send_input_toggled_by_space("5", "%")
$6::send_input_toggled_by_space("6", "&")
$7::send_input_toggled_by_space("7", "'")
$8::send_input_toggled_by_space("8", "(")
$9::send_input_toggled_by_space("9", ")")
$0::send_input_toggled_by_space("0", "")
$@::send_input_toggled_by_space("@", "")

;x
<+x::SendInput "{Text}x"

;Backslash
<+/::SendInput "{\}"

;Hyphen
sc027::send_input_toggled_by_space("-", "{+}")

;: or *
<+sc028::send_input_toggled_by_space(":", "*")

;; or =
<+sc027::send_input_toggled_by_space(";", "=")

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
global SandS_IsShift := false

*Space::{
    global SandS_IsShift
    if (SandS_IsShift) {
        return
    }

    SandS_IsShift := true

    ; RShiftを押し下げ
    SendInput "{RShift Down}"
}

*Space Up::{
    global SandS_IsShift

    ; Shift解除
    SendInput "{RShift Up}"
    SandS_IsShift := false

    ; LShift または RShift が物理的に押されている（"P"）場合は単打とみなさない
    isShiftPressed := GetKeyState("LShift", "P") || GetKeyState("RShift", "P")

    ; 直前のキーが Space かつ、物理的に Shift が押されていない場合のみ Space を出力
    if (A_PriorKey == "Space" && !isShiftPressed) {
        if GetKeyState("LControl", "P") {
            SendInput "{sc029}"
        } else {
            SendInput "{Space}"
        }
        SendInput "{RControl}"
    }
}

;===============================================================================
;Browser
;===============================================================================
<^q::{
  if WinActive("ahk_exe chrome.exe") {
    SendInput "{Browser_Back}"
  } else {
    SendInput "{LControl Down}q"
  }
}

<^y::{
  if WinActive("ahk_exe chrome.exe") {
    SendInput "{Browser_Forward}"
  } else {
    SendInput "{LControl Down}y"
  }
}

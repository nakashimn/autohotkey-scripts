send_input_toggled_by_ime_and_space(input_nutral_ime_off, input_space_on_ime_off, input_nutral_ime_on, input_space_on_ime_on) {
  if (!ime_get() && !GetKeyState("Space", "P")) {
    SendInput input_nutral_ime_off
    return
  }
  else if (!ime_get() && GetKeyState("Space", "P")) {
    SendInput input_space_on_ime_off
    return
  }
  else if (ime_get() && !GetKeyState("Space", "P")) {
    SendInput input_nutral_ime_on
    return
  }
  else if (ime_get() && GetKeyState("Space", "P")) {
    SendInput input_space_on_ime_on
    return
  }
}

send_input_toggled_by_ime(input_ime_off, input_ime_on) {
  if ime_get() {
    SendInput input_ime_on
    return
  }
  SendInput input_ime_off
  return
}

send_input_toggled_by_space(input_neutral, input_space_on) {
  if GetKeyState("Space", "P") {
    SendInput input_space_on
    return
  }
  SendInput input_neutral
  return
}

ime_get(WinTitle:="A")  {
    hwnd := WinExist(WinTitle)
    if (WinActive(WinTitle)) {
        ptrSize := !A_PtrSize ? 4 : A_PtrSize
        cbSize := 4+4+(PtrSize*6)+16
        stGTI := Buffer(cbSize,0)
        NumPut("DWORD", cbSize, stGTI.Ptr,0)   ;   DWORD   cbSize;
        hwnd := DllCall("GetGUIThreadInfo", "Uint",0, "Uint", stGTI.Ptr)
                 ? NumGet(stGTI.Ptr,8+PtrSize,"Uint") : hwnd
    }
    return DllCall("SendMessage", "UInt", DllCall("imm32\ImmGetDefaultIMEWnd", "Uint",hwnd),
      "UInt", 0x0283, ;Message : WM_IME_CONTROL
      "Int", 0x0005,  ;wParam  : IMC_GETOPENSTATUS
      "Int", 0        ;lParam  : 0
    )
}

run_app(filepath, workdir:="", options:="") {
  appname := StrSplit(filepath, "\")[-1]
  pid := ProcessExist(appname)

  if WinExist("ahk_pid" pid) {
    WinActivate("ahk_pid" pid)
    return
  }

   Run(filepath, workdir, options)
  return
}

run_chrome_app(app_id, title_keyword:="dummy_keyword") {
  if WinExist(title_keyword " ahk_exe chrome.exe") {
    WinActivate()
    return
  }

  Run("chrome.exe --app-id=" app_id)
  return
}

open_page_in_chrome(url) {
  if WinExist("ahk_exe chrome.exe") {
    Run("chrome.exe --new-tab " url)
    return true
  } else {
    return false
  }
}

pop_tool_tip(text, msec) {
  ToolTip(text)
  SetTimer () => ToolTip(), -msec
}

clipboard_ip_address(ip_prefix) {
  for ip_address in SysGetIPAddresses() {
    if InStr(ip_address, ip_prefix) {
      A_Clipboard := ip_address
      return
    }
  }
}

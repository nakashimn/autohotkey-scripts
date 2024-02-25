send_input_toggled_by_space(input_neutral, input_space_on) {
  if GetKeyState("Space", "P") {
    SendInput input_space_on
    return
  }
  SendInput input_neutral
  return
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

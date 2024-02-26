#include aws.ahk
#include mysql.ahk
#include password.local.ahk
#include powershell.ahk

class TargetSelector {
  __init() {
    this.targets := [
      "AWS",
      "MySQL",
      "PowerShell",
      "Password"
    ],
    this.snippet_selectors := [
      AwsSnippetSelector(),
      MysqlSnippetSelector(),
      PowerShellSnippetSelector(),
      PasswordSnippetSelectorLocal()
    ]
    this.window := Gui()
    this.Window.Opt("-Border")
    this.window.OnEvent("Escape", this.window_hide)
    this.list := this.window.AddListBox("r5 w200", this.targets)
    this.button := this.window.AddButton("default w200", "OK")
    this.button.parent := this
    this.button.OnEvent("Click", this.button_select)
  }

  show() {
    this.window.show()
  }

  hide() {
    this.window.hide()
  }

  window_hide() {
    this.hide()
  }

  button_select(_) {
    this.parent.snippet_selectors[this.parent.list.value].show()
    this.parent.window.hide()
  }
}

target_selector := TargetSelector()

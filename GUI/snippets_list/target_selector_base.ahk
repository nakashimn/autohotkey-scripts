
class TargetSelectorBase {
  __init(targets:=[], selectors:=[]) {
    ; const
    this.targets := targets
    this.snippet_selectors := selectors

    ; instances
    this.window := Gui("-Border +ToolWindow -Caption")
    this.window.BackColor := "1D1D1D"
    WinSetTransColor("1D1D1D 220", this.window)
    this.window.SetFont("s11 c1E1E1E", "Segoe UI")
    this.window.OnEvent("Escape", this.window_hide)
    this.list := this.window.AddListBox("r3 w200", this.targets)
    this.button := this.window.AddButton("default w0 h0", "OK")
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

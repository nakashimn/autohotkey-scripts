class SnippetSelector {
  __init(keywords:=[], snippets:=[]){
    ; const
    this.keywords := keywords
    this.snippets := snippets

    ; instances
    this.window := Gui()
    this.Window.Opt("-Border")
    this.window.OnEvent("Escape", this.window_hide)
    this.list := this.window.AddListBox("r5 w200", this.keywords)
    this.button := this.window.AddButton("default w200", "OK")
    this.button.parent := this
    this.button.OnEvent("Click", this.button_select)
  }

  show() {
    this.window.show()
  }

  hide() {
    this.window.show()
  }

  window_hide() {
    this.hide()
  }

  button_select(_) {
    A_Clipboard := this.parent.snippets[this.parent.list.value]
    this.parent.window.hide()
  }
}

class SnippetSelector {
    __init(keywords:=[], snippets:=[]){
        ; const
        this.keywords := keywords
        this.snippets := snippets

        ; instances
        this.window := Gui()
        this.Window.Opt("-Border")
        this.list := this.window.AddListBox("r5 w200", this.keywords)
        this.button := this.window.AddButton("default w200", "OK")
        this.button.parent := this
        this.button.OnEvent("Click", this.select)
    }

    show() {
        this.window.show()
    }

    hide() {
        this.window.show()
    }

    select(_) {
        A_Clipboard := this.parent.snippets[this.parent.list.value]
        this.parent.window.hide()
    }
}

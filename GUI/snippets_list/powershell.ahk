#Include snippet_selector_base.ahk

class PowerShellSnippetSelector extends SnippetSelector {
  __init() {
    super.__init(
      keywords:= [
        "symlink"
      ],
      snippets := [
        "New-Item -ItemType SymbolicLink -Path <path> -Target <target>"
      ]
    )
  }
}

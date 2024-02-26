#Include snippet_selector_base.ahk

class PowerShellSnippetSelector extends SnippetSelector {
  __init() {

    ; describe snippets
    keywords:= [
      "symlink"
    ],
    snippets := [
      "New-Item -ItemType SymbolicLink -Path <path> -Target <tgt>"
    ]

    super.__init(keywords, snippets)
  }
}

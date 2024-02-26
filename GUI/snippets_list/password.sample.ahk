; copy this file as password.local.ahk and describe your settings.
#Include snippet_selector_base.ahk

class PasswordSnippetSelectorLocal extends SnippetSelector {
  __init() {

    ; describe snippets
    keywords:= [
      "passA"
    ],
    snippets := [
      "1234"
    ]

    super.__init(keywords, snippets)
  }
}

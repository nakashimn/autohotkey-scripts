#Include target_selector_base.ahk
#include password.local.ahk
#include phrase.local.ahk
#include command_selector.ahk

class TargetSelector extends TargetSelectorBase {
  __init() {
    targets := [
      "Phrase",
      "Password",
      "Command"
    ],
    snippet_selectors := [
      PhraseSnippetSelectorLocal(),
      PasswordSnippetSelectorLocal(),
      CommandSelector()
    ]

    super.__init(targets, snippet_selectors)
  }
}

target_selector := TargetSelector()

; copy this file as phrase.local.ahk and describe your settings.
#Include snippet_selector_base.ahk

class PhraseSnippetSelectorLocal extends SnippetSelector {
  __init() {

    ; describe snippets
    keywords:= [
      "phrase"
    ],
    snippets := [
      "abc"
    ]

    super.__init(keywords, snippets)
  }
}

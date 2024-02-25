#Include snippet_selector_base.ahk

class AwsSnippetSelector extends SnippetSelector {
  __init() {
    super.__init(
      keywords:= [
        "s3 copy"
      ],
      snippets := [
        "aws s3 cp <source> <target>"
      ]
    )
  }
}

#Include snippet_selector_base.ahk

class AwsSnippetSelector extends SnippetSelector {
  __init() {
    ; set local variables
    instance_id := IniRead("settings.local.ini", "AWS", "instance_id", "<ins_id>")
    region := IniRead("settings.local.ini", "AWS", "region", "<region>")
    profile := IniRead("settings.local.ini", "AWS", "profile", "default")

    ; describe snippets
    keywords:= [
      "ssm",
      "s3 copy"
    ],
    snippets := [
      "aws ssm start-session --target " . instance_id . " --region " . region . " --profile " . profile,
      "aws s3 cp <src> <tgt>"
    ]

    super.__init(keywords, snippets)
  }
}

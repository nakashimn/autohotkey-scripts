#Include target_selector_base.ahk
#include aws.ahk
#include terraform.ahk
#include linux.ahk
#include mysql.ahk
#include password.local.ahk
#include phrase.local.ahk
#include powershell.ahk

class TargetSelector extends TargetSelectorBase {
  __init() {
    targets := [
      "Phrase",
      "AWS",
      "Terraform",
      "linux",
      "MySQL",
      "PowerShell",
      "Password"
    ],
    snippet_selectors := [
      PhraseSnippetSelectorLocal(),
      AwsSnippetSelector(),
      TerraformSnippetSelector(),
      LinuxSnippetSelector(),
      MysqlSnippetSelector(),
      PowerShellSnippetSelector(),
      PasswordSnippetSelectorLocal()
    ]

    super.__init(targets, snippet_selectors)
  }
}

target_selector := TargetSelector()

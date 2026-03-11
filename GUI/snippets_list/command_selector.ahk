#Include target_selector_base.ahk
#include aws.ahk
#include terraform.ahk
#include linux.ahk
#include mysql.ahk
#include powershell.ahk

class CommandSelector extends TargetSelectorBase {
  __init() {
    targets := [
      "AWS",
      "Terraform",
      "linux",
      "MySQL",
      "PowerShell"
    ],
    snippet_selectors := [
      AwsSnippetSelector(),
      TerraformSnippetSelector(),
      LinuxSnippetSelector(),
      MysqlSnippetSelector(),
      PowerShellSnippetSelector()
    ]

    super.__init(targets, snippet_selectors)
  }
}

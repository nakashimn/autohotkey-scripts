#Include target_selector_base.ahk
#include aws.ahk
#include terraform.ahk
#include linux.ahk
#include mysql.ahk
#include postgresql.ahk
#include powershell.ahk

class CommandSelector extends TargetSelectorBase {
  __init() {
    targets := [
      "AWS",
      "Terraform",
      "linux",
      "PostgreSQL",
      "MySQL",
      "PowerShell"
    ],
    snippet_selectors := [
      AwsSnippetSelector(),
      TerraformSnippetSelector(),
      LinuxSnippetSelector(),
      PostgresqlSnippetSelector(),
      MysqlSnippetSelector(),
      PowerShellSnippetSelector()
    ]

    super.__init(targets, snippet_selectors)
  }
}

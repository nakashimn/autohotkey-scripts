#Include snippet_selector_base.ahk

class AwsSnippetSelector extends SnippetSelector {
  __init() {
    ; set local variables
    instance_id := IniRead("settings.local.ini", "AWS", "instance_id", "<ins_id>")
    region := IniRead("settings.local.ini", "AWS", "region", "<region>")
    profile := IniRead("settings.local.ini", "AWS", "profile", "default")
    ssm_role := IniRead("settings.local.ini", "AWS", "ssm_role", "<ssm_role>")

    ; describe snippets
    keywords:= [
      "aws mfa",
      "aws ssm",
      "aws ssm activate",
      "aws s3 copy"
    ],
    snippets := [
      "aws-mfa --profile "
      "aws ssm start-session --target " . instance_id . " --region " . region . " --profile " . profile,
      "aws ssm create-activation --default-instance-name <instance_name> --iam-role " . ssm_role . " --registration-limit 1 --region " . region " --profile " . profile,
      "aws s3 cp <src> <tgt> --profile " . profile
    ]

    super.__init(keywords, snippets)
  }
}

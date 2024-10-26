#Include snippet_selector_base.ahk

class TerraformSnippetSelector extends SnippetSelector {
  __init() {
    ; set local variables

    ; describe snippets
    keywords:= [
      "terraform init -reconfigure",
      "terraform init -upgrade",
      "terraform plan",
      "terraform apply"
    ],
    snippets := [
      "terraform init -reconfigure -backend-config ./terraform/",
      "terraform init -upgrade",
      "terraform plan -var-file ./tfvars/",
      "terraform apply -var-file ./tfvars/"
    ]

    super.__init(keywords, snippets)
  }
}

#Include snippet_selector_base.ahk

class LinuxSnippetSelector extends SnippetSelector {
  __init() {
    ; set local variables
    mail_address := IniRead("settings.local.ini", "Linux", "mail_address", "<mail_address>")

    ; describe snippets
    keywords:= [
      "scp",
      "find",
      "chmod",
      "vmstat",
      "ping",
      "dig",
      "ssh-keygen",
      "openssl generate rsa",
      "openssl generate rsa(nocrypt)",
      "tar zip",
      "tar unzip"
    ],
    snippets := [
      "scp -r <src> <user>@<id_address>:<dst>",
      'find -name "*.md" ',
      "chmod -R 777 ",
      "vmstat -w -t 1 -SM",
      "ping google.com",
      "dig google.com +short",
      "ssh-keygen -t rsa -b 4096 -C " . mail_address . " -f ssh_key",
      "openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 && openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub",
      "openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 -nocrypt && openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub",
      "tar -zcvf <dst> <src>",
      "tar -zxvf <src> -C <dst>"
    ]

    super.__init(keywords, snippets)
  }
}

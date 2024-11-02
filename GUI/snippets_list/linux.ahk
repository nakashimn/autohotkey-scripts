#Include snippet_selector_base.ahk

class LinuxSnippetSelector extends SnippetSelector {
  __init() {

    ; describe snippets
    keywords:= [
      "scp",
      "find",
      "chmod",
      "vmstat",
      "ping",
      "dig",
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
      "openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 && openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub",
      "openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 -nocrypt && openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub",
      "tar -zcvf <dst> <src>",
      "tar -zxvf <src> -C <dst>"
    ]

    super.__init(keywords, snippets)
  }
}

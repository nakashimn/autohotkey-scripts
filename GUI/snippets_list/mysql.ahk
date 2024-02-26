#Include snippet_selector_base.ahk

class MysqlSnippetSelector extends SnippetSelector {
  __init() {
    super.__init(
      keywords:= [
        "mysql login",
        "mysql export"
      ],
      snippets := [
        "mysql -h <host> -u <user> -P <port> -p",
        "mysql -h <host> -u <user> -P <port> -p -e <query> | sed -e 's/\t/,/g' > <csvfile>"
      ]
    )
  }
}

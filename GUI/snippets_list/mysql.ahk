#Include snippet_selector_base.ahk

class MysqlSnippetSelector extends SnippetSelector {
  __init() {
    ; set local variables
    host := IniRead("settings.local.ini", "MySQL", "host", "<host>")
    user := IniRead("settings.local.ini", "MySQL", "user", "<user>")
    port := IniRead("settings.local.ini", "MySQL", "port", "<port>")

    ; describe snippets
    keywords:= [
      "mysql login",
      "mysql export"
    ],
    snippets := [
      "mysql -h " . host . " -u " . user . " -P " . port . " -p",
      "mysql -h " . host . " -u " . user . " -P " . port . " -p -e `"<query>`" | sed -e `"s/\t/,/g`" > <csv>"
    ]

    super.__init(keywords, snippets)
  }
}

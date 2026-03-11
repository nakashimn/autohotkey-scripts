#Include snippet_selector_base.ahk

class PostgresqlSnippetSelector extends SnippetSelector {
  __init() {
    ; set local variables

    ; describe snippets
    keywords:= [
      "\l",
      "\dt",
      "\du",
      "login",
      "export csv",
      "export tsv"
    ],
    snippets := [
      "\l",
      "\dt",
      "\du",
      "psql -h {host} -p {port} -U {user} -d {db}",
      "psql -h {host} -p {port} -U {user} -d {db} -P format=csv -P footer=off -c `"\copy (SELECT * FROM {table}) TO STDOUT WITH (FORMAT csv, HEADER, FORCE_QUOTE *, ENCODING 'UTF8');`" > output.csv",
      "psql -h {host} -p {port} -U {user} -d {db} -P format=csv -P footer=off -c `"\copy (SELECT * FROM {table}) TO STDOUT WITH (FORMAT csv, DELIMITER E'\t', HEADER, FORCE_QUOTE *, ENCODING 'UTF8');`" > output.tsv"
    ]
    super.__init(keywords, snippets)
  }
}

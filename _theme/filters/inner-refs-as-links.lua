all_citations = {}
all_citations_notes = {}

function print_table_key_values(some_table)
  for key, value in pairs(some_table) do
    print(key, value)
  end
end

function load_csv_as_key_values()
  bib_inner_refs = {}
  for line in io.lines("bib_inner_refs.csv") do
      print("line")
      print(line)
      regex = "\"%s*(.-)\",\"%s*(.-)\""
      for chapter_id, chapter_url in  string.gmatch(line, regex) do
  --      print("chapter_id", chapter_id," chapter_url ",chapter_url, " yay!")
        bib_inner_refs[chapter_id] = chapter_url
      end
  end
  return bib_inner_refs
end

bib_inner_refs = load_csv_as_key_values()

function Inlines(inlines)
  local result = {}

  for _, inline in ipairs(inlines) do
    table.insert(result, inline)
    if inline.t == "Cite"  then
      linked_chapter_id = inline.citations[1].id
      if bib_inner_refs[linked_chapter_id] ~= nil then
        table.insert(
          result,
          pandoc.Space()
        )
        table.insert(
          result,
          pandoc.Link(
            { pandoc.Str("- CLICK HERE TO READ ONLINE") },
            bib_inner_refs[inline.citations[1].id]  .. ".html"
          )
        )
      end
    end
  end

  return result
end
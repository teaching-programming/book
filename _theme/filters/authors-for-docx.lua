-- Pawel wrote this

-- example data to parse:
--author:
--  - name: Author One
--    email: author@one.com
--    corresponding: true
--    affiliations: Edinburgh Medical School, University of Edinburgh
--  - name: Author Two
--    email: author@two.com
--    affiliations: Edinburgh Medical School, University of Edinburgh
-- - name: Author Three
--    email: author@three.com
--    affiliations: School of Mathematics and Maxwell Institute for the Mathematical Sciences, University of Edinburgh

io.write("AUTHORS FILTER")

local function styled_paragraph(inlines, style)
  return pandoc.Div (inlines, {["custom-style"] = style})
end

function turn_into_lines(el) -- maybe there is a better way to do this, but I'm taking each renderable component and turning it into a string.
    local parts = {}
    for _, inline in ipairs(el.content) do
        if inline.t == "Str" then
            table.insert(parts, inline.text)
        elseif inline.t == "Space" then
            table.insert(parts, " ")
        elseif inline.t == "SoftBreak" or inline.t == "LineBreak" then
            table.insert(parts, "\n")
        else
            table.insert(parts, pandoc.utils.stringify(inline))
        end
    end
    local recombined_text = table.concat(parts)
    local lines = {}
    for line in recombined_text:gmatch("[^\r\n]+") do
      table.insert(lines, line)
    end
    return lines
end

function trim(text)
  --remove spaces at beginning and end
  return (text:gsub("^%s+", ""):gsub("%s+$", ""))
end

function table_to_json(some_table)
    local result = "{"
    for k, v in pairs(some_table) do
        result = result .. '"' .. k .. '":"' .. tostring(v) .. '",'
    end
    result = result .. "}"
    return result
end

function table_of_tables_to_json(some_table_of_tables)
    local result = "{"
    for i, item in ipairs(some_table_of_tables) do
      result = result .. table_to_json(item)
    end
    return result
end

function lines_into_authors(lines)
  local authors = {}
  local current_author = {}
  
  for i, line in ipairs(lines) do
    local key_author_info = line:match("^%-?%s*([^:]+):") -- everything before ":" but ignore optional "- " at start
    local value_author_info = line:match(": ([^:]+)") -- everything after ": " 

    if i == 1 and key_author_info ~= "author" then
      return authors
    elseif i == 1 and key_author_info == "author" then
      goto jump_to_here_to_skip --because there is no 'skip/continue' in lua
    end
    
    value_author_info = trim(value_author_info)


    if key_author_info == "name" then -- we are starting a new current_author
      if current_author ~= {} then
        table.insert(authors, current_author)
        current_author = {}
      end
    end

    current_author[key_author_info] = value_author_info
   ::jump_to_here_to_skip::
  end

  --last author
  table.insert(authors, current_author)
  
  --print("AUTHORS PARSED" .. table_of_tables_to_json(authors))
  return authors
  
end

local style_map = {
  ["name"] = "AuthorName",
  ["email"] = "AuthorEmail",
  ["affiliations"] = "AuthorAffiliation",
}
function authors_as_docx_paragraphs(authors)
  
  local result = {}
  
  for i, author in ipairs(authors) do
    if author.name ~= nil then
      table.insert(
        result,
        styled_paragraph(author.name, style_map["name"])
      )
    end
    if author.affiliations ~= nil  then
      table.insert(
        result,
        styled_paragraph(author.affiliations, style_map["affiliations"])
      )
    end
    if author.email ~= nil  then
      local email_to_use = ""
      if author.corresponding then
          email_to_use = author.email .. " (*)"
      else
          email_to_use = author.email
      end
      table.insert(
        result,
        styled_paragraph(email_to_use, style_map["email"])
      )
    
    end
  end
 -- print("DONE AUTHORS!" .. #result)
  return result
end

function parse_lines_as_author_blocks(el)
    local lines = turn_into_lines(el)
    local results = {}
    if lines == nil or #lines == 0 then
        return el
    end
    
    if lines[1] ~= "author:" then -- if not authoir block, don't bother parsing
        return el
    end
  --   print("split_lines count" .. #lines)

    local authors = lines_into_authors(lines)
  --   print("authors count" .. #authors)
    
    local authors_docx_blocks = authors_as_docx_paragraphs(authors)
   -- print("authors_docx_blocks count" .. #authors_docx_blocks)

    return authors_docx_blocks
end

function Para(el)
  if not quarto.doc.is_format("docx") then
    return el
  end

  if el == nil or #pandoc.utils.stringify(el) == 0 then
    return el
  end
  --here do the thing. parse yaml into authors. then authors into docx paragraphs
  local authors_parsed_as_blocks = parse_lines_as_author_blocks(el)
  return authors_parsed_as_blocks
end







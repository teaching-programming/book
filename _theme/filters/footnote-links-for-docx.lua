-- Pawel wrote this

io.write("\nFOOTNOTES FILTER")

local function styled_paragraph(inlines, style)
  return pandoc.Div (inlines, {["custom-style"] = style})
end

function table_to_json(some_table)
    local result = "{"
    for k, v in pairs(some_table) do
        result = result .. '"' .. k .. '":"' .. tostring(v) .. '",'
    end
    result = result .. "}"
    return result
end


local utils = require 'pandoc.utils'

function Link(link)
  if not quarto.doc.is_format("docx") then
    return link
  end
  local result = {}
  -- content (human readable), target (url)
  local link_words = pandoc.utils.stringify(link.content)
  local link_url = pandoc.utils.stringify(link.target)
  if link_words ~= link_url then
    table.insert(
      result,
      pandoc.Link(link_words, link_url)
    )
    table.insert(
      result,
      pandoc.Note(link_url)
    )
  else
    return link
  end
  return result
end
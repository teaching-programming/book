-- Pawel wrote this

io.write("\nFOOTNOTES FILTER")

local function styled_paragraph(inlines, style)
  return pandoc.Div (inlines, {["custom-style"] = style})
end

function print_table_key_values(some_table)
  for key, value in pairs(some_table) do
    print(key, value)
  end
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
  
  local linking_item = pandoc.utils.stringify(link.content)
  if link.content[1]["tag"] == "Image" then
    linking_item = link.content
  end
  local link_url = pandoc.utils.stringify(link.target)

  
  if string.sub(link_url, 0, 1) == "#" then --this is inner link
        table.insert(
      result,
      pandoc.Str(linking_item)
    )
  elseif linking_item ~= link_url then
    table.insert(
      result,
      pandoc.Link(linking_item, link_url)
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
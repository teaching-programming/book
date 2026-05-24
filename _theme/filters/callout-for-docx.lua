io.write("CALLOUTS FILTER")

if quarto.doc.is_format("docx") then
  -- pdf specific output
  io.write("CALLOUTS DOC")
else
    io.write("CALLOUTS OTHER")
  -- output for other formats
end

local style_map = {
  ["note"] = "BoxHeaderInfo",
  ["warning"] = "BoxHeaderWarning",
  ["important"] = "BoxHeaderImportant",
  ["tip"] = "BoxHeaderTip",
  ["caution"] = "BoxHeaderCaution"
}

local calloutBody = "BoxBody"

--  options in callout: type, title, and content

local function styled_paragraph(inlines, style)
  return pandoc.Div (inlines, {["custom-style"] = style})
end

function Callout(el)
  if not quarto.doc.is_format("docx") then
    return el
  end

  local result = {}
  local headerStyleToUse = style_map[el.type]
  print("headerStyleToUse" .. headerStyleToUse)
  if el.title ~= nil  then
    table.insert(
      result,
      styled_paragraph(el.title, headerStyleToUse)
    )
  end
  if el.content ~= nil  then
    table.insert(
      result,
      styled_paragraph(el.content, "BoxBody")
    )
  end
  return result
end

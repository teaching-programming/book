local style_map = {
  ["callout-note"] = "BoxHeaderInfo",
  ["callout-warning"] = "BoxHeaderWarning",
  ["callout-important"] = "BoxHeaderImportant",
  ["callout-tip"] = "BoxHeaderTip",
  ["callout-caution"] = "BoxHeaderCaution"
}

local calloutBody = "BoxBody"

local title_map = {
  ["callout-note"] = "Info",
  ["callout-warning"] = "Warning",
  ["callout-important"] = "Important",
  ["callout-tip"] = "Tip",
  ["callout-caution"] = "Caution"
}

local function make_styled_para(text, style)
  return pandoc.Para(
    { pandoc.Str(text) },
    { ["custom-style"] = style }
  )
end

function Div(el)
  for class, style in pairs(style_map) do
    if el.classes:includes(class) then

      local title = title_map[class]

      -- use explicit callout title if present
      if el.attributes.title then
        title = el.attributes.title
      end

      table.insert(
        el.content,
        1,
        make_styled_para(title, style)
      )

      return el
    end
  end

  return el
end
function Div(el)
  if el.classes:includes("callout") then
    -- Replace with a simple paragraph with a custom style
    return pandoc.Para{
      -- todo, figure out how callouts hsould look and adjust this
      pandoc.Strong("NOTE: "),
      pandoc.Str(el.content[1].text)
    }
  end
end

-- if this is callout, represent as another style
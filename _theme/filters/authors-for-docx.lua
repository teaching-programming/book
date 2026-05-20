
function table_print (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end


global_meta = nil

function Meta(meta)
  io.write(" metametametametametameta ")
  local ca = meta["author"]['name']
  io.write(" meta!!! ")
  if ca then
    io.write(ca)
    table_print(meta)
    print("pandoc.utils.stringify(ca)")
    print(pandoc.utils.stringify(ca))
  end
  return meta
end

function Header(el)
  -- Only act on H1 headers
  if el.level ~= 1 then
    return nil
  end

  -- Extract the header ID
  local id = el.identifier
  if not id or id == "" then
    return nil
  end

  io.write(" id ")
  io.write(id)

  
end



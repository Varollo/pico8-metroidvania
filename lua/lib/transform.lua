local transform = {}

function transform:new(position, rotation, scale)
    local tr = {}
    setmetatable(tr, { __index = self })

    tr.position = position or vector:new()
    tr.rotation = rotation or 0
    tr.scale = scale or vector:new(1, 1)
    
    return tr
end
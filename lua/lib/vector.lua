local vector = {}

function vector:new(x, y)    
    local vec = {}
    setmetatable(vec, { __index = self })

    vec.x = x or 0
    vec.y = y or 0
    
    return vec
end
local game_obj = {}

function game_obj:update() end
function game_obj:draw() end

function game_obj:new()
    local obj = {}
    setmetatable(obj, { __index = self })
    return obj
end
local animator = {}

function animator:new(animation)
    local anim = {}
    setmetatable(anim, { __index = self })

    anim.animation = animation or {}
    anim.__i = 1

    return anim
end

function animator:draw(transform, flip_x, flip_y)
    if self.animation and #self.animation > 0 and self.animation[self.__i] then
        self.animation[self.__i]:draw(transform, flip_x, flip_y)
    end
end

function animator:add_state(state)
    add(self.animation, state)
end

function  animator:set_state(state_id)
    self.__i = state_id    
end
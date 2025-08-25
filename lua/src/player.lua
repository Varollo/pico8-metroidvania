player = game_obj:new()

player.transform = transform:new(vector:new(64, 64))
player.rigidbody = rigidbody:new()
player.animator = animator:new({
    animation:new({ 1, 2 }, 2), -- idle
    animation:new({ 3, 4 }, 6), -- move
    animation:new(5),           -- fall
})

function player:draw()
    self.animator:draw(self.transform, self.rigidbody.velocity.x < 0)
end

function player:update()
    if btn(0) then self:__move(-1)
    elseif btn(1) then self:__move(1)
    else self:__idle() end

    if self.rigidbody.velocity.y ~= 0 then
        self:__fall()
    end

    self.rigidbody:update(self.transform)

    if self.transform.position.y > 120 then
        self.transform.position.y = 120
        self.rigidbody.velocity.y = 0
    end

    if btn(5) and self.rigidbody.velocity.y == 0 then self.rigidbody.velocity.y -= 8 end
end

function player:__idle()
    self.rigidbody.drag.x = .5
    self.animator:set_state(1)
end

function player:__move(dir)
    self.rigidbody.velocity.x += .24 * dir
    self.rigidbody.drag.x = .1
    self.animator:set_state(2)
end

function player:__fall()
    self.rigidbody.drag.x = .075
    self.animator:set_state(3)
end

engine:create_obj(player)
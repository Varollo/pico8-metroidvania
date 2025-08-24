player = game_obj:new()

player.transform = transform:new(vector:new(64, 64))
player.rigidbody = rigidbody:new()
player.animator = animator:new({animation:new({ 1, 2 }, 2), animation:new({ 3, 4 }, 6)})

function player:draw()
    player.animator:draw(player.transform, player.rigidbody.velocity.x < 0)
end

function player:update()
    if btn(0) then
        player.rigidbody.velocity.x -= .16
        player.animator:set_state(2)
    elseif btn(1) then
        player.rigidbody.velocity.x += .16
        player.animator:set_state(2)
    else
        player.animator:set_state(1)
    end

    player.rigidbody:update(player.transform)

    if player.transform.position.y > 120 then
        player.transform.position.y = 120
        player.rigidbody.velocity.y = 0
    end

    if btn(5) and player.rigidbody.velocity.y == 0 then player.rigidbody.velocity.y -= 8 end
end

engine:create_obj(player)
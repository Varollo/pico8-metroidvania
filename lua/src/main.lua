function _init()
	palt(11, true)
	palt(0, false)
    engine.create_obj(player)
end

function _update()
	engine:update()
end

function _draw()
	cls()
	engine:draw()	
end
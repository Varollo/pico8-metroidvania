local animation = {}

function animation:new(frames, fps)
    local sprt = {}
    setmetatable(sprt, { __index = self })
    
    sprt.frames = frames or {}
    sprt.fps = fps or 4
    sprt.__last_frame_time = 0
    sprt.__i = 1
    
    return sprt
end

function animation:draw(transform, flip_x, flip_y)
    flip_x = flip_x or false
    flip_y = flip_y or false

    local spr_id = -1
    
    if type(self.frames) == "table" then
        local t = time()
        if t - self.__last_frame_time >= 1.0 / self.fps then
            self.__i = (self.__i + 1) % #self.frames
            self.__last_frame_time = t
        end
        spr_id = self.frames[self.__i + 1]
    else
        spr_id = self.frames
    end
    spr(
        spr_id,
        transform.position.x, transform.position.y,
        transform.scale.x, transform.scale.y,
        flip_x, flip_y
    )
end
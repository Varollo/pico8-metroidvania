local animation = {}

function animation:new(frames, fps, wait_completion)
    local sprt = {}
    setmetatable(sprt, { __index = self })
    
    sprt.wait = wait_completion or false
    sprt.frames = frames or {}
    sprt.fps = fps or 4
    sprt.__last_frame_time = 0
    sprt.__i = 1
    
    return sprt
end

function animation:set_i(i)
    self.__i = i
end

function animation:draw(transform, flip_x, flip_y)
    flip_x = flip_x or false
    flip_y = flip_y or false
    
    spr(
        self.frames[self.__i],
        transform.position.x, transform.position.y,
        transform.scale.x, transform.scale.y,
        flip_x, flip_y
    )

    local t = time()
    if t - self.__last_frame_time >= 1.0 / self.fps then
        self.__i += 1

        if self.__i > #self.frames then
            if self.wait then
                self.__i = #self.frames
            else
                self.__i = 1
            end
        end

        self.__last_frame_time = t
    end
end
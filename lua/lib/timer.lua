local timer = {}

function timer:new(duration)
    local t = {}
    setmetatable(t, { __index = self })

    t.duration = duration
    t.__start_t = time()

    return t
end

function timer:start()
    self.__start_t = time()
end

function timer:done()
    return time() - self.__start_t >= self.duration
end
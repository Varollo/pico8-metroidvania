local engine = {}

engine.__objs = {}

function engine:update()
    for i=1, #self.__objs do
        local obj = self.__objs[i]
        if obj and obj.update then
            obj:update()
        end
    end
end

function engine:draw()
    for i=1, #self.__objs do
        local obj = self.__objs[i]
        if obj and obj.draw then
            obj:draw()
        end
    end
end

function engine:create_obj(obj)
    
    if obj and (obj.draw or obj.update) then
        add(self.__objs, obj)        
    end
end

function engine:destroy_obj(obj)
    del(self.__objs, obj)
end
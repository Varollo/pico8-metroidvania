local rigidbody = {}

function rigidbody:new()
    local rb = {}
    setmetatable(rb, { __index = self })

    rb.gravity = vector:new(0, .98)
    rb.acceleration = rb.gravity
    rb.velocity = vector:new()
    rb.drag = vector:new(.1, 0)

    return rb
end

function rigidbody:update(transform)
    self.velocity.x += self.acceleration.x
    self.velocity.y += self.acceleration.y
    
    self.velocity.x *= 1 - self.drag.x
    self.velocity.y *= 1 - self.drag.y
    
    transform.position.x += self.velocity.x
    transform.position.y += self.velocity.y
    
    self.acceleration = self.gravity
end
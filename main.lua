if arg[2] == "debug" then
    require("lldebugger").start()
end



function love.load()
    Object = require "classic"
    
    local Rectangle = require "rectangle"
    local Circle = require "circle"
    -- Create a new Rectangle object.
    r1 = Rectangle(100, 100, 200, 50)

    r2 = Circle(350, 80, 40)
end

function love.update(dt)
    r1:update(dt)
    r2:update(dt)
end

function love.draw(dt)
    r1:draw(r1)
    r2:draw(r2)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end

if arg[2] == "debug" then
    require("lldebugger").start()
end
--==================================================

function love.load()
    Object = require "classic"
    require "player"

    player = Player()
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end





























--==================================================

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end

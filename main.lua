if arg[2] == "debug" then
    require("lldebugger").start()
end
--==================================================

local game = require("game")

function love.load()
    game.load()
end

function love.update(dt)
    game.update(dt)
end

function love.draw()
    game.draw()
end

function love.mousepressed(x, y, button)
    game.mousepressed(x, y, button)
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

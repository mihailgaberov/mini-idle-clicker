if arg[2] == "debug" then
    require("lldebugger").start()
end
--==================================================

function love.load()
    Object = require "classic"
    require "player"
    require "enemy"
    require "bullet"

    player = Player()
    enemy = Enemy()
    listOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i, v in ipairs(listOfBullets) do
        v:update(dt)

        v:checkCollision(enemy)
         --If the bullet has the property dead and it's true then..
        if v.dead then
            --Remove it from the list
            table.remove(listOfBullets, i)
        end
    end
end

function love.draw()
    player:draw()
    enemy:draw()

    for i, v in ipairs(listOfBullets) do
        v:draw()
    end
end

function love.keypressed(key)
    player:keyPressed(key)
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

if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()
    -- Remember: camelCasing!
    listOfRectangles = {}
end

function createRect()
    rect = {}
    rect.x = 100
    rect.y = 100
    rect.width = 70
    rect.height = 90
    rect.speed = 100

    -- Put the new rectangle in the list
    table.insert(listOfRectangles, rect)
end

function love.keypressed(key)
    -- Remember, 2 equal signs (==) for comparing!
    if key == "space" then
        createRect()
    end
end

function love.update(dt)
    for i,v in ipairs(listOfRectangles) do
        v.x = v.x + v.speed * dt
    end
end

function love.draw(dt)
    for i,v in ipairs(listOfRectangles) do
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
    end
end









local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end

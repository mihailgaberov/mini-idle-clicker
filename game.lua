local game = {}

local upgrades = require("upgrades")

game.gold = 0
game.clickPower = 1

local button = {
    x = 350,
    y = 250,
    width = 100,
    height = 100
}

function game.load()
    upgrades.init()
end

function game.update(dt)
    -- Placeholder for future logic
end

function game.draw()
    -- Draw gold
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(love.graphics.newFont(24))
    love.graphics.printf("Gold: " .. math.floor(game.gold), 0, 20, love.graphics.getWidth(), "center")

    -- Draw click button
    love.graphics.setColor(0.2, 0.6, 1)
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)

    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("CLICK", 0, button.y + 35, love.graphics.getWidth(), "center")

    -- Draw upgrades
    upgrades.draw(game)
end

function game.mousepressed(x, y, buttonPressed)
    if buttonPressed == 1 and
       x > button.x and x < button.x + button.width and
       y > button.y and y < button.y + button.height then
        game.gold = game.gold + game.clickPower
    end

    upgrades.mousepressed(x, y, buttonPressed, game)
end

return game

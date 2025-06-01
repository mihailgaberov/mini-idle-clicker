local upgrades = {}

-- Define available upgrades
local list = {
    {
        name = "+1 Click Power",
        cost = 10,
        effect = 1,
        purchased = false
    },
    {
        name = "+5 Click Power",
        cost = 50,
        effect = 5,
        purchased = false
    }
}

function upgrades.init()
    -- Positioning the upgrades on screen
    for i, upg in ipairs(list) do
        upg.x = 50
        upg.y = 120 + (i - 1) * 60
        upg.w = 200
        upg.h = 40
    end
end

function upgrades.draw(game)
    love.graphics.setFont(love.graphics.newFont(18))
    for _, upg in ipairs(list) do
        -- Draw button background
        love.graphics.setColor(0.3, 0.3, 0.3)
        love.graphics.rectangle("fill", upg.x, upg.y, upg.w, upg.h)

        -- Draw border
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", upg.x, upg.y, upg.w, upg.h)

        -- Label
        local label = upg.name .. " ($" .. upg.cost .. ")"
        if upg.purchased then
            label = upg.name .. " ✓"
        end
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(label, upg.x + 10, upg.y + 10)
    end
end

function upgrades.mousepressed(x, y, button, game)
    if button ~= 1 then return end

    for _, upg in ipairs(list) do
        if not upg.purchased and
           x > upg.x and x < upg.x + upg.w and
           y > upg.y and y < upg.y + upg.h then
            if game.gold >= upg.cost then
                game.gold = game.gold - upg.cost
                game.clickPower = game.clickPower + upg.effect
                upg.purchased = true
            end
        end
    end
end

return upgrades

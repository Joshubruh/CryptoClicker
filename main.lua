function love.load()
    score = 0
    buttonLocY = 520
    buttonLocX = 285
    buttonScaleX = 250
    buttonScaleY = 75
    hideOnHub = 0
    showOnHub = 9999
    showOnShop = 9999
    area = "click"
    gpuLevel = 1
    gpuCost = 1
    multiplier = 1
    ableToUpgradeGPU = true
    perClick = 1

    buttonText = love.graphics.newFont("Prototype.ttf", 20)
    scoreText = love.graphics.newFont("Prototype.ttf", 48)
    hubText = love.graphics.newFont("Prototype.ttf", 36)
    bg = love.graphics.newImage("btcTitle.png")
    buttonClick = love.graphics.newImage("minebutton2.png")
    gpuButton = love.graphics.newImage("GPUButton.png")
end

function love.draw()  -- Draws objects to screen

    love.graphics.setBackgroundColor(0,15,10)

    love.graphics.draw(bg, hideOnHub, 0)
    love.graphics.draw(buttonClick, buttonLocX, buttonLocY, 0, 0.5, 0.5)

    love.graphics.draw(gpuButton, showOnShop, 140, 0, 0.5, 0.5)

    -- Draws score text
    love.graphics.setFont(scoreText)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Score: "..score, 0, 530)

    love.graphics.setFont(hubText)
    love.graphics.print("Score per click: "..perClick, showOnShop, 460)
    love.graphics.setColor(1, 1, 1)

    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(hubText)
    love.graphics.print("Welcome to the Window Hub! Keybinds\n can be used to switch between panes!", showOnHub, 150)
    love.graphics.setFont(buttonText)
    love.graphics.print("S = Shop\nC = Click\nAfter you leave, H = get back here (Hub)", showOnHub, 250)
    love.graphics.setColor(1, 1, 1)

    love.graphics.setColor(0, 0, 0)
    love.graphics.print("1 = Upgrade GPU.  Cost = "..gpuCost.."   GPU Level = "..gpuLevel, showOnShop, 0)
    love.graphics.print("Read README file on \nrepo for instructions!", 575, 550)
    love.graphics.setColor(1, 1, 1)
end

function love.update(dt) -- Executes every frame (60/s)
    if love.keyboard.isDown("h") then
        buttonLocX = 9999
        showOnHub = 0
        showOnClick = 9999
        showOnShop = 9999
        area = "hub"
    end
    if love.keyboard.isDown("c") then
        buttonLocX = 285
        showOnClick = 0
        showOnHub = 9999
        showOnShop = 9999
        area = "click"
    end
    if love.keyboard.isDown("s") then
        buttonLocX = 9999
        showOnHub = 9999
        showOnShop = 10
        area = "shop"
        end

    score = math.floor(score)
    gpuCost = math.floor(gpuCost)
end

function love.mousepressed(x,y, button, istouch, presses) -- Executed every mouse click
     if love.mouse.getX() >= buttonLocX and love.mouse.getX() <= buttonLocX + buttonScaleX and love.mouse.getY() >= buttonLocY and love.mouse.getY() <= buttonLocY + buttonScaleY then
        perClick = 1 * (gpuLevel)^1.1
        score = score + perClick
     end -- Above if statement makes score only increment if mouse is clicked within button
     if love.mouse.getX() >= showOnShop and love.mouse.getX() <= showOnShop + 250 and love.mouse.getY() >= 160 and love.mouse.getY() <= 160 + 50 and area == "shop" then
        if score > gpuCost then
            gpuCost = gpuLevel ^ 1.3
            score = score - gpuCost
            gpuLevel = gpuLevel + 1
        end
     end
    end

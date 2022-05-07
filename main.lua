function love.load()
    score = 0
    buttonLocY = 520
    buttonLocX = 285
    buttonScaleX = 250
    buttonScaleY = 75

    buttonText = love.graphics.newFont("Prototype.ttf", 20)
    scoreText = love.graphics.newFont("Prototype.ttf", 48)
    bg = love.graphics.newImage("btcTitle.png")
    buttonClick = love.graphics.newImage("minebutton2.png")
end

function love.draw()  -- Draws objects to screen

    love.graphics.setColor(0,0,0)
    love.graphics.setColor(1,1,1)

    love.graphics.draw(bg, 0, 0)
    love.graphics.draw(buttonClick, buttonLocX, buttonLocY, 0, 0.5, 0.5)

    -- Draws score text
    love.graphics.setFont(scoreText)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Score: "..score, 0, 530)
    love.graphics.setColor(1, 1, 1)
end

function love.update(dt) -- Executes every frame (60/s)
    
end

function love.mousepressed(x,y, button, istouch, presses) -- Executed every mouse click
     if love.mouse.getX() >= buttonLocX and love.mouse.getX() <= buttonLocX + buttonScaleX and love.mouse.getY() >= buttonLocY and love.mouse.getY() <= buttonLocY + buttonScaleY then
         score = score + 1
     end -- Above if statement makes score only increment if mouse is clicked within button
end

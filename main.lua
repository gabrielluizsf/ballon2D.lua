local physics = require("physics")
physics.start()
--physics.setDrawMode('debug')
--physics.setDrawMode('hybrid')

local _WC = display.contentCenterX
local _HC = display.contentCenterY
local _W  = display.contentWidth
local _H  = display.contentHeight

local count = 0
local maxCount = 0

local bg = display.newImageRect('assets/background.png', 360, 570)
bg.x = _WC
bg.y = _HC

local balloon = display.newImageRect('assets/balloon.png', 112, 112)
balloon.x = _WC
balloon.y = _H * 1/4
      
local platform = display.newImageRect('assets/platform.png', 300, 50)
platform.x = _WC
platform.y = _H

physics.addBody(balloon, 'dynamic', {radius = 50, bounce = 0.3})
physics.addBody(platform, 'static')

local score = display.newText(count, _WC, 20, native.systemFont, 40)
score:setFillColor(0, 0, 0)

local maxScoreText = display.newText(maxCount, _HC, 5, native.systemFont, 20)
maxScoreText:setFillColor(255, 0, 0)

local function updateMaxScore()
    local path = system.pathForFile("maxscore.txt", system.DocumentsDirectory) 
    local fileR = io.open(path, "r")  
    if fileR then  
        local contents = fileR:read("*all")  
        maxCount = tonumber(contents)  
        maxScoreText.text = maxCount 
        io.close(fileR)  
    end
    
    local fileW = io.open(path, "w") 
    if fileW then 
        fileW:write(maxCount)  
        io.close(fileW)  
    end
end

local function pushBalloon()
    balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
    count = count + 1
    score.text = count
    if count > maxCount then
        maxCount = count
        updateMaxScore()
    end
end

balloon:addEventListener('tap', pushBalloon)

local function constrain()
    if balloon.y < 0 then
        balloon.y = 0
        balloon:applyLinearImpulse(0, 4, balloon.x, balloon.y)
    end
end    

Runtime:addEventListener('enterFrame', constrain)
local physics = require("physics")
physics.start()
--physics.setDrawMode('debug')
--physics.setDrawMode('hybrid')

local _WC = display.contentCenterX
local _HC = display.contentCenterY
local _W  = display.contentWidth
local _H  = display.contentHeight

local count = 0
local maxCount = 0

local bg = display.newImageRect('assets/background.png', 360, 570)
bg.x = _WC
bg.y = _HC

local balloon = display.newImageRect('assets/balloon.png', 112, 112)
balloon.x = _WC
balloon.y = _H * 1/4
      
local platform = display.newImageRect('assets/platform.png', 300, 50)
platform.x = _WC
platform.y = _H

physics.addBody(balloon, 'dynamic', {radius = 50, bounce = 0.3})
physics.addBody(platform, 'static')

local score = display.newText(count, _WC, 20, native.systemFont, 40)
score:setFillColor(0, 0, 0)

local function pushBalloon()
    balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
    count = count + 1
    score.text = count
    if count > maxCount then
        maxCount = count
    end
end

balloon:addEventListener('tap', pushBalloon)

local function constrain()
    if balloon.y < 0 then
        balloon.y = 0
        balloon:applyLinearImpulse(0, 4, balloon.x, balloon.y)
    end
end    

Runtime:addEventListener('enterFrame', constrain)


-- Include dkjson library to encode and decode tables as string
local json = require("dkjson")

-- Get input
local data = json.decode(getInput()) or {}

--# Rendering
-- Load fonts
local infoFont = loadFont('RobotoMono', 12)
local activeFont = loadFont('RobotoMono', 16)
local messageFont = loadFont('Play-Bold', 52)

-- Get screen resolution and create a layer
local rx, ry = getResolution()
local layer = createLayer()


-- Draw data package content
setNextTextAlign(layer, AlignH_Left, AlignV_Baseline)
addText(layer, infoFont, "Script Parameters", 8, 16)

local y = 30
-- For each field of the data package draw
for k, field in pairs(data) do
    setNextTextAlign(layer, AlignH_Left, AlignV_Baseline)
    addText(layer, infoFont, k .. ' = ' .. json.encode(field), 16, y)
    y = y+14
end

-- Draw instructions
setNextTextAlign(layer, AlignH_Center, AlignV_Baseline)
addText(layer, activeFont, "Click on the screen for an exciting new message!", 0.5*rx, ry-20)


-- Get dimensions of the message text
local width, _ = getTextBounds( messageFont, data.message or '')
width = width + 32
local height = 72

-- Draw the background box of the message text
setNextStrokeColor( layer, 1, 1, 1, 1)
setNextStrokeWidth( layer, 1)
setNextFillColor( layer, 0, 0, 0, 0)
addBoxRounded( layer, 0.5*(rx-width), 0.5*(ry-height), width, height, 6)

-- Draw the message text
setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
addText(layer, messageFont, data.message or '', 0.5*rx, 0.5*ry)


-- Request a run at each 2 frame
requestAnimationFrame(2)
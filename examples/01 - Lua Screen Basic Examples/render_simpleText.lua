-- List all lines of text
local lines = {
    "Lua screen units are great!",
    "They can render lots of contents...",
    "even really smooth, complex animations!",
    "They're very fast.",
    "They're not as easy to use as HTML,",
    "...but once you get the hang of them...",
    "you'll be unstoppable.",
}

-- Load the font with its name and its size
local fontSize = 32
local font = loadFont('Play', fontSize)

local layer = createLayer()

-- For each line draw the text
local y = fontSize + 16
for i, line in ipairs(lines) do
    addText(layer, font, line, 16, y)
    y = y + fontSize + 2
end
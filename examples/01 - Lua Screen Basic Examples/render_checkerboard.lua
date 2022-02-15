local resX, resY = getResolution()
local tilesX, tilesY = 32, 16

-- Determine the tile dimensions
local tileW, tileH = resX / tilesX, resY / tilesY
local layer = createLayer()

-- For each step in Y
for y = 0, tilesY - 1 do
    local color = y % 2

    -- For each step in X
    for x = 0, tilesX - 1 do

        -- Draw a box with white or black color
        if color == 0 then
            setNextFillColor(layer, 1, 1, 1, 1)
        else
            setNextFillColor(layer, 0, 0, 0, 1)
        end
        addBox(layer, x * tileW, y * tileH, tileW, tileH)
        color = (color + 1) % 2
    end
end
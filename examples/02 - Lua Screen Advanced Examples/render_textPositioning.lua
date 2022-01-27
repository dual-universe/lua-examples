local fontName = 'Play'
local fontSize = 32
local font = loadFont(fontName, fontSize)
local fontDebug = loadFont('FiraMono', 12)
local back = createLayer()
local layer = createLayer()
local rx, ry = getResolution()
local ascender, descender = getFontMetrics(font)

local text = "??"
frame = (frame or 0) + 1

setDefaultFillColor(layer, Shape_Text, 1, 1, 1, 1)
setDefaultFillColor(layer, Shape_Circle, 1, 0, 0, 1)

function drawTextBox (x, y, alignH, alignV)
    local w, h, ascent, descent = getTextBounds(font, text)

    if alignH == AlignH_Left then
        x = x
    elseif alignH == AlignH_Center then
        x = x - w/2
    elseif alignH == AlignH_Right then
        x = x - w
    end

    if alignV == AlignV_Ascender then
        y = y
        h = ascender - descender
    elseif alignV == AlignV_Top then
        y = y
    elseif alignV == AlignV_Middle then
        h = ascender - descender
        y = y - h/2
    elseif alignV == AlignV_Baseline then
        y = y - ascent
    elseif alignV == AlignV_Bottom then
        y = y - h
    elseif alignV == AlignV_Descender then
        h = ascender - descender
        y = y - h
    end

    setNextFillColor(back, 0.1, 0.5, 1.0, 1.0)
    setNextStrokeWidth(back, 1)
    addBox(back, x, y, w, h)
end

function main ()
    if frame % 2 == 0 then
        text = "acemnor "
    else
        text = "aCjÅkö[]|!r "
    end

    -- display debug info about font
    if true then
        local infoLines = {
            string.format("     font : %s", fontName),
            string.format("     size : %d", fontSize),
            string.format(" ascender : %d", ascender),
            string.format("descender : %d", descender),
        }

        for i, line in ipairs(infoLines) do
            setNextTextAlign(layer, AlignH_Left, AlignV_Top)
            addText(layer, fontDebug, line, 16, 16 + (i - 1) * 12)
        end
    end

    local alignHs = {
        'AlignH_Left',
        'AlignH_Center',
        'AlignH_Right',
    }

    local alignVs = {
        'AlignV_Ascender',
        'AlignV_Top',
        'AlignV_Middle',
        'AlignV_Baseline',
        'AlignV_Bottom',
        'AlignV_Descender',
    }

    -- draw text boxes with various alignments
    local sx = 300
    local sy = 80
    local x0 = rx/2 - sx * (#alignHs-1)/2
    local y0 = ry/2 - sy * (#alignVs-1)/2
    for y, alignVName in ipairs(alignVs) do
        for x, alignHName in ipairs(alignHs) do
            local px = x0 + sx * (x - 1)
            local py = y0 + sy * (y - 1)
            local alignV = _ENV[alignVName]
            local alignH = _ENV[alignHName]
            drawTextBox(px, py, alignH, alignV)
            setNextTextAlign(layer, alignH, alignV)
            addText(layer, font, text, px, py)
            addCircle(layer, px, py, 3)
        end
    end

    -- draw AlignH labels
    for x, alignH in ipairs(alignHs) do
        setNextTextAlign(layer, _ENV[alignH], AlignV_Descender)
        setNextFillColor(layer, 0.5, 0.5, 0.5, 1)
        addText(layer, fontDebug, alignH, x0 + (x - 1)*sx, y0 - 16)
    end

    -- draw AlignV labels
    for y, alignV in ipairs(alignVs) do
        setNextTextAlign(layer, AlignH_Right, _ENV[alignV])
        setNextFillColor(layer, 0.5, 0.5, 0.5, 1)
        addText(layer, fontDebug, alignV, x0 - 16, y0 + (y - 1)*sy)
    end    
end

if not isFontLoaded(font) then
    requestAnimationFrame(10)
else
    main()
    requestAnimationFrame(120)
end
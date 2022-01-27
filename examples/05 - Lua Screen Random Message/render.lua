local json = require('dkjson')
local params = json.decode(getInput()) or {}

message = params.message or '[ no message ]'
fontSize = params.fontSize or 64
color = params.color or {r=1.0,g=0,b=0.3}

--------------------------------------------------------------------------------

local font = loadFont('Play-Bold', fontSize)
local rx, ry = getResolution()
local layer = createLayer()
local cx, cy = getCursor()

local sx, sy = getTextBounds(font, message)
setDefaultStrokeColor(layer, Shape_Line, 1, 1, 1, 0.5)
setNextShadow(layer, 64, color.r, color.g, color.b, 0.4)
setNextFillColor(layer, color.r, color.g, color.b, 1.0)
addBoxRounded(layer, (rx-sx-16)/2, (ry-sy-16)/2, sx+16, sy+16, 8)
setNextFillColor(layer, 0, 0, 0, 1)
setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
addText(layer, font, message, rx/2,ry/2)

--------------------------------------------------------------------------------

local fontCache = {}
function getFont (font, size)
    local k = font .. '_' .. tostring(size)
    if not fontCache[k] then fontCache[k] = loadFont(font, size) end
    return fontCache[k]
end

function drawUsage ()
    local font = getFont('FiraMono', 16)
    setNextTextAlign(layer, AlignH_Center, AlignV_Top)
    addText(layer, font, "Activate for an exciting new message!", rx/2, ry - 32)
end

function drawCursor ()
    if cx < 0 then return end
    if getCursorDown() then
        setDefaultShadow(layer, Shape_Line, 32, color.r, color.g, color.b, 0.5)
    end
    addLine(layer, cx - 12, cy - 12, cx + 12, cy + 12)
    addLine(layer, cx + 12, cy - 12, cx - 12, cy + 12)
end

function prettyStr (x)
    if type(x) == 'table' then
        local elems = {}
        for k, v in pairs(x) do
            table.insert(elems, string.format('%s = %s', prettyStr(k), prettyStr(v)))
        end
        return string.format('{%s}', table.concat(elems, ', '))
    else
        return tostring(x)
    end
end

function drawParams ()
    local font = getFont('RobotoMono', 11)
    setNextTextAlign(layer, AlignH_Left, AlignV_Bottom)
    addText(layer, font, "Script Parameters", 16, 16)
    local y = 32
    for k, v in pairs(params) do
        setNextTextAlign(layer, AlignH_Left, AlignV_Bottom)
        addText(layer, font, k .. ' = ' .. prettyStr(v), 24, y)
        y = y + 12
    end
end

--------------------------------------------------------------------------------

drawUsage()
drawCursor()
drawParams()

requestAnimationFrame(1)
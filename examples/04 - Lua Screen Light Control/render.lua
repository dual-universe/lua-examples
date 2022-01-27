font = loadFont('Play-Bold', 32)
rx, ry = getResolution()
cx, cy = getCursor()
layer = createLayer()
click = getCursorPressed()

--------------------------------------------------------------------------------

if not Button then
    local mt = {}
    mt.__index = mt
    function Button (text, x, y)
        return setmetatable({
            text = text,
            x = x,
            y = y,
        }, mt)
    end

    function mt:draw ()
        local sx, sy = self:getSize()
        local x0 = self.x - sx/2
        local y0 = self.y - sy/2
        local x1 = x0 + sx
        local y1 = y0 + sy
        
        local r, g, b = 0.3, 0.7, 1.0
        if cx >= x0 and cx <= x1 and cy >= y0 and cy <= y1 then
            r, g, b = 1.0, 0.0, 0.4
            if click then setOutput(self.text) end
        end
        
        setNextShadow(layer, 64, r, g, b, 0.3)
        setNextFillColor(layer, 0.1, 0.1, 0.1, 1)
        setNextStrokeColor(layer, r, g, b, 1)
        setNextStrokeWidth(layer, 2)
        addBoxRounded(layer, self.x - sx/2, self.y - sy/2, sx, sy, 4)
        setNextFillColor(layer, 1, 1, 1, 1)
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        addText(layer, font, self.text, self.x, self.y)
    end

    function mt:getSize ()
        local sx, sy = getTextBounds(font, self.text)
        return sx + 32, sy + 16
    end

    function mt:setPos (x, y)
        self.x, self.y = x, y
    end
end

function drawFree (elems)
    for i, v in ipairs(elems) do v:draw() end
end

function drawListV (elems, x, y)
    for i, v in ipairs(elems) do
        local sx, sy = v:getSize()
        v:setPos(x, y)
        v:draw()
        y = y + sy + 4
    end
end

function drawUsage ()
    local font = loadFont('FiraMono', 16)
    setNextTextAlign(layer, AlignH_Center, AlignV_Top)
    addText(layer, font, "Activate board to enable buttons!", rx/2, ry - 32)
end

function drawCursor ()
    if cx < 0 then return end
    addLine(layer, cx - 12, cy - 12, cx + 12, cy + 12)
    addLine(layer, cx + 12, cy - 12, cx - 12, cy + 12)
end

--------------------------------------------------------------------------------

local buttons = {
    Button('Light 0', 128, 90),
    Button('Light 1', 128, 290),
    Button('Light 2', 128, 490),
}

drawFree(buttons)

drawUsage()
drawCursor()

requestAnimationFrame(5)
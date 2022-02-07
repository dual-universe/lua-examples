-- Initialize
if not Slider then


    -- Returns a new slider class
    Slider = {}
    Slider.__index = Slider
    function Slider:new(x, y, width, length, min, max, value, label)
        self = {
            x = x or 0,
            y = y or 0,
            l = length or 100,
            w = width or 20,
            min = min or 0,
            max = max or 1,
            ratio = 0,
            label = label or "",
            drag = false,
            color = {1,1,1}
        }
        self.ratio = math.max(0, math.min(1, (value or self.min)/(self.max-self.min)))

        -- Set the value of the slider
        function self:setValue(val)
            if type(val) == 'number' then
                self.value = math.max(self.min, math.min(self.max, val))
            end
        end

        -- Get the value of the slider
        function self:getValue(val)
            return self.ratio*(self.max - self.min) + self.min
        end

        -- Draws the slider on the screen using the given layer
        function self:draw(layer)
            -- Localize object data
            local x, y, w, l = self.x, self.y, self.w, self.l
            local min, max, ratio = self.min, self.max

            local font = loadFont('Play', 14)

            -- Get cursor data
            local mx, my = getCursor()
            local pressed = getCursorPressed()
            local released = getCursorReleased()

            -- Determine if the cursor is on the bar and detect if the mouse is down
            if (mx >= x and mx <= x+w) and (my >= y and my <= y+l) then

                if pressed then self.drag = true end
            end

            -- Set the ratio based on the cursor position
            if self.drag then
                self.ratio = math.max(0, math.min(1, 1 - (my-y)/l))
                if released then
                    self.drag = false
                end
            end

            local ratio = self.ratio
            local h = ratio*(max-min)
            local color = self.color

            -- Draw the slider
            setDefaultStrokeColor(layer, Shape_BoxRounded, 1, 1, 1, 1)
            setDefaultStrokeWidth(layer, Shape_BoxRounded, 0.1)

            setNextFillColor(layer, 0.1, 0.1, 0.1, 1)
            addBoxRounded(layer, x, y, w, l, 0)

            setNextFillColor(layer, color[1], color[2], color[3], 1)
            addBoxRounded(layer, x, y+(1-ratio)*l, w, l*ratio, 0)

            setNextFillColor(layer, 0.5, 0.5, 0.5, 1)
            addBoxRounded(layer, x-3, y+(1-ratio)*l -3, w+6, 6, 0)

            -- Draw label and value display
            local label = self.label
            setNextTextAlign( layer, AlignH_Center, AlignV_Middle)
            addText( layer, font, label, x+0.5*w, y-14)

            local display = string.format('%.2f', ratio*(max - min) + min)
            setNextTextAlign( layer, AlignH_Center, AlignV_Middle)
            addText( layer, font, display, x+0.5*w, y+l+14)
        end


        return setmetatable(self, Slider)
    end

end


-- Get screen resolution
local rx, ry = getResolution()

-- Draw the 3 sliders
if not _init then
    local r, g, b = 0.21, 0.32, 0.48

    sliderRed = Slider:new(rx*0.8, ry*0.2, 16, ry*0.6, 0, 1, r, "Red")
    sliderRed.color = { 1, 0, 0}
    sliderGreen = Slider:new(rx*0.85, ry*0.2, 16, ry*0.6, 0, 1, g, "Green")
    sliderGreen.color = { 0, 1, 0}
    sliderBlue = Slider:new(rx*0.9, ry*0.2, 16, ry*0.6, 0, 1, b, "Blue")
    sliderBlue.color = { 0, 0, 1}

    _init = true
end

-- Set the background color based on sliders value
setBackgroundColor( sliderRed.ratio, sliderGreen.ratio, sliderBlue.ratio, 1)
local layer = createLayer()

setNextFillColor( layer, 0.05, 0.05, 0.05, 1)
addBoxRounded( layer, rx*0.75 +8, ry*0.1, rx*0.2, ry*0.8, 16)

sliderRed:draw( layer)
sliderGreen:draw( layer)
sliderBlue:draw( layer)

requestAnimationFrame(1)
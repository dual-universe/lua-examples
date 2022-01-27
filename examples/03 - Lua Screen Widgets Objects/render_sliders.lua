------------------------------------
-- Slider widget example
-- Usage:
--     Creates a slider style widget with a minimum and maximum value.
-- 
-- Init:
--     widget = Slider(x,y,width,length,minValue,maxValue,defaultValue,label)
-- Return fractional value of the slider position:
--     widget:getFraction()
-- Force set the value of the slider:
--     widget:setValue(value)
-- Draw the slider:
--     widget:draw(layer)
-- Return the value of slider:
--     widget.value
------------------------------------

if not Slider then
    -- Object definition: Lets start by creating a meta table with some properties
    local slider = {}
    slider.__index = slider
    function Slider(x, y, width, length, min, max, defaultValue, label)
        self = {}
        self.x = x or 0
        self.y = y or 0
        self.l = length or 100
        self.w = width or 20
        self.min = min or 0
        self.max = max or 1
        self.value = math.max(self.min, math.min(self.max, defaultValue)) or self.min
        self.label = label or ""
        self.doDrag = false
        return setmetatable(self, slider)
    end
    
    -- example helper method that returns the position of the slider between a value of 0 and 1
    function slider:getFraction()
        return (self.value - self.min) / (self.max - self.min)
    end
    
    -- example set method that allows us to set the value of the slider
    function slider:setValue(val)
        self.value = math.max(self.min, math.min(self.max, val))
    end
    
    -- example draw method that draws the slider on the screen using the given layer and stored properties
    function slider:draw(layer)
        -- Collect some cursor data
        local cx, cy = getCursor()
        local cPressed = getCursorPressed()
        local cReleased = getCursorReleased()
        
        -- Determine if the handle for this slider was just clicked or released
        if cPressed and cx >= self.x and cx <= (self.x + self.w) and cy >= self.y + self.l - (self:getFraction() * self.l) and cy <= self.y + (self.w / 5) + self.l - (self:getFraction() * self.l) + (2 * self.w / 5) then
            self.doDrag = true
        elseif cReleased == true or cx == -1 then
            self.doDrag = false
        end
    
        -- If we are currently dragging the handle we should update the position and value of the slider.
        if self.doDrag then
            local vy = 1 - ((cy - self.y - self.w / 5) / self.l)
            self.value = math.max(self.min, math.min(self.max, self.min + ((self.max - self.min) * vy)))
        end
        
        -- Finaly lets draw the entire slider on the screen
        
        -- Draw the background vertical bar (You could change the color below this line, or make a property for it)
        setNextFillColor(layer, 0.5, 0.5, 1, 1)
        addBoxRounded(layer, self.x + (self.w / 2.5), self.y + self.w / 5, self.w / 5, self.l, math.min(self.w / 10, self.l / 10))
        
        -- Draw the handle (You could change the color below this line, or make a property for it)
        setNextFillColor(layer, 0.7, 0.7, 1, 1)
        addBoxRounded(layer, self.x, self.y + self.l - (self:getFraction() * self.l), self.w, self.w / 2.5, self.w / 10)
        
        -- Lets load a font for this slider, if you want lots of sliders, you may want to load the font outside this object to avoid to many fonts.
        local font = loadFont("Montserrat", self.w / 5)
        
        -- Fetch the dimensions of the label and value we are about to draw
        local lw,lh = getTextBounds(font, self.label)
        local vw,vh = getTextBounds(font, math.floor(self.value * 100) * 0.01)
        
        -- draw the label above the slider
        addText(layer, font, self.label, self.x + (self.w / 2) - (lw / 2), self.y - (lh * 0.5))
        
        -- draw the value on the handle
        setNextFillColor(layer, 0.1, 0.1, 0.1, 1)
        addText(layer, font, math.floor(self.value * 100) * 0.01, self.x + (self.w / 2) - (vw / 2), self.y + self.l - (self:getFraction() * self.l) + (self.w / 5) + (vh / 2))
    end
end

------------------------------------
-- Display
------------------------------------

-- Collect the screen resolution for positioning
local rx, ry = getResolution()

-- Create two layers, one for the background square, the other for the sliders
local backgroundLayer = createLayer()
local sliderLayer = createLayer()

-- Run this portion only once on screen startup, this creates the slider objects
if not init then
    init = true
    sliderRed   = Slider(rx/5-25,   ry/8,50, ry/8*6, 0, 1, 0.2, "Red")
    sliderGreen = Slider(rx/5*2-25, ry/8,50, ry/8*6, 0, 1, 0.4, "Green")
    sliderBlue  = Slider(rx/5*3-25, ry/8,50, ry/8*6, 0, 1, 0.6, "Blue")
    sliderAlpha = Slider(rx/5*4-25, ry/8,50, ry/8*6, 0, 1, 0.8, "Alpha")
end

-- every frame, draw the 4 slider
sliderRed:draw(sliderLayer)
sliderGreen:draw(sliderLayer)
sliderBlue:draw(sliderLayer)
sliderAlpha:draw(sliderLayer)

-- every frame, draw the background square using the slider values as colour properties for the fill
setNextFillColor(backgroundLayer, sliderRed.value, sliderGreen.value, sliderBlue.value, sliderAlpha.value)
addBoxRounded(backgroundLayer,25,25,rx-50,ry-50,20)

-- render cost profiler
if true then
    local layer = createLayer()
    local font = loadFont('Play-Bold', 14)
    setNextFillColor(layer, 1, 1, 1, 1)
    addText(layer, font, string.format('render cost : %d / %d', getRenderCost(), getRenderCostMax()), 8, 16)
end

-- refresh the screen at a high rate to keep the slider elements responsive
requestAnimationFrame(1)
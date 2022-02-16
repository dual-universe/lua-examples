-- Include event library
local event = require('utils/event')
local json = require('dkjson')

--# Button class definition called only at the first frame
if not Button then

    -- getEllipsis( font, text, maxWidth)
    -- Return a shorten text string by with with ... at the end
    function getEllipsis(font, text, maxWidth)
        local width = getTextBounds(font, '...')

        for i = 1, #text do
            local line = getTextBounds(font, text:sub(1,i)) + width
            if line > maxWidth then
                return text:sub(1,i-1)..'...'
            end
        end
        return text
    end


    Button = {}
    Button.__index = Button
    -- Button object constructor
    -- .x : X component of the position
    -- .y : Y component of the position
    -- .width : Width of the button
    -- .height : Height of the button
    -- .caption : Associated text caption
    -- .onPressed = event:new() : Event triggered when the button is pressed
    -- .onDown = event:new() : Event triggered when the button is hold down
    -- .onReleased = event:new() : Event triggered when the button is released
    -- .onHover = event:new() : Event triggered when the button is hovered
    -- .onLeave = event:new() : Event triggered when the button is leave
    function Button:new(x, y, width, height, caption)
        local self = {
            x = x or 0,
            y = y or 0,
            w = width or 100,
            h = height or 20,
            caption = caption or "",
            onPressed = event:new(),
            onDown = event:new(),
            onReleased = event:new(),
            onEnter = event:new(),
            onLeave = event:new(),
            clicked = false,
            hover = false
        }

        --Handle button events
        function self:compute(mx,my)
            local x, y, w, h = self.x, self.y, self.w, self.h
            
            if mx>x and mx<x+w and my>y and my<y+h then
                if getCursorPressed() then
                    self.onPressed:emit(self,mx,my)
                    self.clicked = true
                elseif getCursorReleased() then
                    self.onReleased:emit(self,mx,my)
                    self.clicked = false
                elseif getCursorDown() then
                    self.onDown:emit(self,mx,my)
                    self.clicked = true
                end
                
                if not self.hover then
                    self.onEnter:emit(self,mx,my)
                    self.hover = true
                end
            elseif self.hover then
                self.onLeave:emit(self,mx,my)
                self.hover = false
            end
        end

        -- Draws the button on the screen using the given layer
        function self:draw(layer, font)
            -- Localize object data
            local x, y, w, h = self.x, self.y, self.w, self.h
            local min, max = self.min, self.max

            --# Draw the button
            -- Define box default strokes style
            setDefaultStrokeColor(layer, Shape_BoxRounded, 1, 1, 1, 1)
            setDefaultStrokeWidth(layer, Shape_BoxRounded, 0.1)

            -- If the button is clicked change the background
            if self.clicked then
                setNextFillColor(layer, 0.1, 0.1, 0.1, 1)
            else
                setNextFillColor(layer, 0.3, 0.3, 0.3, 1)
            end
            addBoxRounded(layer, x, y, w, h, 4)

            -- Draw caption and value display          
            local caption = getEllipsis(font, self.caption, w-12)
            local font = font or nil

            setNextTextAlign( layer, AlignH_Center, AlignV_Middle)
            addText( layer, font, caption, x+0.5*w, y+0.5*h)
        end


        return setmetatable(self, Button)
    end

end


-- Get screen resolution
local rx, ry = getResolution()
local mx, my = getCursor()

-- Load fonts
local infoFont = loadFont('RobotoMono', 12)
local medium = loadFont('Play', 20)

--# Initialization called only at the first frame
if not _init then
    _display = {"Don't click me!","No! What did I say?!","STOP!! I SAID STOP !","STOP!! I'M BLOCKING MYSELF NOW"}
    _k = 1

    -- Draw the 3 buttons
    _button = Button:new(0.5*rx - 190, 0.5*ry - 21, 380, 48, _display[_k])
    _state = ''
    
    --Add the action on the actions event.
    --event:addAction( call, enabled, limit)
    _button.onPressed:addAction( function(self,x,y)
        _state = 'Pressed'
        _k = _k+1
        _button.caption = _display[_k]
    end, true, 3)
    --In this case we limit the action to 3 calls.

    _button.onDown:addAction( function(self,x,y)
        _state = 'Down'
    end, true)
    _button.onReleased:addAction( function(self,x,y)
        _state = 'Released'
    end, true)
    _button.onEnter:addAction( function(self,x,y)
        _state = 'Enter'
    end, true)
    _button.onLeave:addAction( function(self,x,y)
        _state = 'Leave'
    end, true)

    _init = true
end

--# Rendering
local layer = createLayer()

-- Compute button
_button:compute(mx,my)
    
-- Draw buttons
_button:draw( layer, medium)

-- Draw state text
setNextTextAlign(layer, AlignH_Center, AlignV_Baseline)
addText(layer, infoFont, _state, 0.5*rx, 0.8*ry)

-- Draw button statistics
setNextTextAlign(layer, AlignH_Left, AlignV_Baseline)
addText(layer, infoFont, "Button Parameters", 8, 16)

local y = 30
for k, field in pairs(_button) do
    local t = type(field)
    
    -- Do only display numbers, string and boolean values
    if t ~= 'function' and t ~= 'table' then
        setNextTextAlign(layer, AlignH_Left, AlignV_Baseline)
        addText(layer, infoFont, k .. ' = ' .. json.encode(field), 16, y)
        y = y+14
    end
end

-- Request a run at each frame
requestAnimationFrame(1)
-- Initialize
if not Toggle then

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


    -- Returns a new slider class
    Toggle = {}
    Toggle.__index = Toggle
    function Toggle:new(x, y, width, height, state, label)
        self = {
            x = x or 0,
            y = y or 0,
            w = width or 100,
            h = height or 20,
            label = label or "",
            onToggle = nil
        }
        local state = state or true
        
        -- Set the value of the slider
        function self:setState(val)
            if type(val) == 'boolean' then
                state = val
            end
        end

        -- Get the value of the slider
        function self:getState(val)
            return state
        end
        

        -- Draws the slider on the screen using the given layer
        function self:draw(layer, font)
            -- Localize object data
            local x, y, w, h = self.x, self.y, self.w, self.h
            local min, max = self.min, self.max

            -- Get cursor data
            local mx, my = getCursor()
            local pressed = getCursorPressed()
            local released = getCursorReleased()

            -- Determine if the cursor is on the button and switch the state
            if (mx >= x and mx <= x+w) and (my >= y and my <= y+h) then
                if pressed then
                    state = not state
                    
                    if self.onToggle then
                        self:onToggle()
                    end
                end
            end

            -- Draw the slider
            setDefaultStrokeColor(layer, Shape_BoxRounded, 1, 1, 1, 1)
            setDefaultStrokeWidth(layer, Shape_BoxRounded, 0.1)

            if state then
                setNextFillColor(layer, 0.3, 0.3, 0.3, 1)
            else
                setNextFillColor(layer, 0.1, 0.1, 0.1, 1)
            end
            addBoxRounded(layer, x, y, w, h, 1)

            -- Draw label and value display          
            local label = getEllipsis(font, self.label, w-12)
            local font = font or nil

            setNextTextAlign( layer, AlignH_Center, AlignV_Middle)
            addText( layer, font, label, x+0.5*w, y+0.5*h)
        end


        return setmetatable(self, Toggle)
    end

end


-- Get screen resolution
local rx, ry = getResolution()
local small = loadFont('Play', 16)

-- Draw the 3 sliders

if not _init then
    toggleA = Toggle:new(0.5*rx - 100, 0.4*ry - 16, 200, 32, true, "Toggle A")
    toggleB = Toggle:new(0.5*rx - 100, 0.5*ry - 16, 200, 32, true, "Toggle B")
    toggleC = Toggle:new(0.5*rx - 100, 0.6*ry - 16, 200, 32, true, "Toggle C")
    
    
    toggleA.onToggle = function(self) logMessage('"' .. self.label .. '" state is '..tostring(self.getState())) end
    toggleB.onToggle = function(self) logMessage('"' .. self.label .. '" state is '..tostring(self.getState())) end
    toggleC.onToggle = function(self) logMessage('"' .. self.label .. '" state is '..tostring(self.getState())) end

    _init = true
end

local layer = createLayer()
toggleA:draw( layer, small)
toggleB:draw( layer, small)
toggleC:draw( layer, small)

requestAnimationFrame(1)
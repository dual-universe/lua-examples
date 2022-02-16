
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
    -- .onClick : Function called when the button is clicked
    function Button:new(x, y, width, height, caption)
        local self = {
            x = x or 0,
            y = y or 0,
            w = width or 100,
            h = height or 20,
            caption = caption or "",
            onClick = nil
        }

        -- Draws the button on the screen using the given layer
        function self:draw(layer, font)
            -- Localize object data
            local x, y, w, h = self.x, self.y, self.w, self.h
            local min, max = self.min, self.max

            -- Get cursor data
            local mx, my = getCursor()
            local down = getCursorDown()
            local released = getCursorReleased()

            local clicked = false
            -- Determine if the cursor is on the button and switch the state
            if (mx >= x and mx <= x+w) and (my >= y and my <= y+h) then
                
                if down then
                    clicked = true
                    
                -- Call the onClick function when the mouse button is released
                elseif released then
                    if self.onClick then
                        -- Provide cursor position in arguments
                        self:onClick( mx, my)
                    end
                end
                
            end

            --# Draw the button
            -- Define box default strokes style
            setDefaultStrokeColor(layer, Shape_BoxRounded, 1, 1, 1, 1)
            setDefaultStrokeWidth(layer, Shape_BoxRounded, 0.1)

            -- If the button is clicked change the background
            if clicked then
                setNextFillColor(layer, 0.1, 0.1, 0.1, 1)
            else
                setNextFillColor(layer, 0.3, 0.3, 0.3, 1)
            end
            addBoxRounded(layer, x, y, w, h, 1)

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
local medium = loadFont('Play', 20)

--# Initialization called only at the first frame
if not _init then

    -- Draw the 3 buttons
    buttonRed = Button:new(0.5*rx - 100, 0.35*ry - 16, 220, 42, "Toggle light Red")
    buttonGreen = Button:new(0.5*rx - 100, 0.5*ry - 16, 220, 42, "Toggle light Green")
    buttonBlue = Button:new(0.5*rx - 100, 0.65*ry - 16, 220, 42, "Toggle light Blue")
    
    buttonRed.onClick = function(self) setOutput('lightRed') end
    buttonGreen.onClick = function(self) setOutput('lightGreen') end
    buttonBlue.onClick = function(self) setOutput('lightBlue') end

    _init = true
end

--# Rendering
local layer = createLayer()

-- Draw buttons
buttonRed:draw( layer, medium)
buttonGreen:draw( layer, medium)
buttonBlue:draw( layer, medium)

-- Request a run at each frame
requestAnimationFrame(1)
--Local libs used in this example
local event = require('utils/event')
local rslib = require('rslib')

--Layers instanciation and font loading
local font = loadFont('RefrigeratorDeluxe',20)
local back = createLayer()
local front = createLayer()
local fore = createLayer()
local rx,ry = getResolution()
local mx,my = getCursor()

--Default styles definition
setDefaultFillColor(back,Shape_BoxRounded,0.2,0.2,0.3,1)

setDefaultFillColor(front,Shape_Text,1,1,1,1)
setDefaultFillColor(fore,Shape_Text,1,193/255,32/255,1)


--Background color definition
setBackgroundColor(15/255,25/255,40/255)


--[EXAMPLE] Button class definition
local function addButton(x,y,w,h,text,ft)
    --Pubic properties
    local self = {}
    self.text = text or ""
    self.font = ft or nil
    self.onPressed = event:new()
    self.onDown = event:new()
    self.onReleased = event:new()
    self.onHover = event:new()
    self.onLeave = event:new()
    
    --Local properties
    local _x,_y,_w,_h = x,y,w,h
    local _lines = {}
    local _hover = false
    
    
    local _asc, _desc = 0,0
    if self.font then
        _asc,_desc = getFontMetrics(font)
        _lines = rslib.getTextWrapped(font, text, _w)
    end
    
    --Set the caption of the button
    function self:setText(text)
        if self.font then
            _lines = rslib.getTextWrapped(self.font, text, _w)
        end
    end
    
    --Handle button events
    function self:compute(x,y)
        if x>_x and x<_x+_w and y>_y and y<_y+_h then
            if getCursorPressed() then
                self.onPressed:emit(self,x,y)
            elseif getCursorReleased() then
                self.onReleased:emit(self,x,y)
            elseif getCursorDown() then
                self.onDown:emit(self,x,y)
            end
            _hover = true
            self.onHover:emit(self,x,y)
        elseif _hover then
            self.onLeave:emit(self,x,y)
            _hover = false
        end
    end
    
    --Draw the button
    function self.draw(self)
        local x,y,w,h,txt,ft = _x, _y, _w, _h, self.text, self.font
        local layer = _hover and fore or front
        addBoxRounded(back,_x,_y,_w,_h,6)
        
        if ft then
            for k,l in pairs(_lines) do
                local ty = y + h*0.5 - (#_lines-1)*(_asc+_desc)*0.5 + _asc*(k-1)
                setNextTextAlign( layer, AlignH_Center, AlignV_Middle)
                addText( layer, ft, l, x+w/2, ty)
            end
        end
    end
    
    return self
end


---# Initialization - Executed only at the first frame
if not _init then
    display = {"Don't click me!","No! What did I say?!","STOP!! I SAID STOP !","STOP!! I'M BLOCKING MYSELF NOW"}
    k = 1
    
    --Create the button
    btn_print = addButton(rx/2 -93, ry/2 -28, 186, 56, display[1], font)
        
    --Add the action on the onPressed event.
    --event:addAction( call, enabled, limit)
    btn_print.onPressed:addAction(function(self,x,y)
            k = k+1
            self:setText(display[k])
        end, true, 3)
    --In this case, we limit the action to 3 invoke and is disabled after.
    
    _init = true
end

---# Computation
btn_print:compute(mx,my)

---# Rendering
btn_print:draw()

requestAnimationFrame(10)
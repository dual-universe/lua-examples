-- Link the screen unit and three lights to the programming board
-- Name the slots in the programming board respectively: screen, light0, light1, light2

local handlers = {}
handlers['Light 0'] = function() light0.toggle() end
handlers['Light 1'] = function() light1.toggle() end
handlers['Light 2'] = function() light2.toggle() end

local output = screen.getScriptOutput()
if #output > 0 then
    screen.clearScriptOutput()
    if handlers[output] then handlers[output]() end
end

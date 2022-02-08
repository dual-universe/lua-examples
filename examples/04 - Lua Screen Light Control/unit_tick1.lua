-- Define actions to do
local actions = {
    ['lightRed'] = function() lightRed.toggle() end,
    ['lightGreen'] = function() lightGreen.toggle() end,
    ['lightBlue'] = function() lightBlue.toggle() end
}

-- Get the screen output
local output = screen.getScriptOutput()

-- Execute the action according to the output
if actions[output] then
    screen.clearScriptOutput()
    
    actions[output]()
end
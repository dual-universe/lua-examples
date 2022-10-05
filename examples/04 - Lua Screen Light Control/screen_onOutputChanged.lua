-- Add to programming board's unit.tick(output) event

-- Define actions to be done when receiving a keyword
local actions = {
    ['lightRed'] = function() lightRed.toggle() end,
    ['lightGreen'] = function() lightGreen.toggle() end,
    ['lightBlue'] = function() lightBlue.toggle() end
}

-- Check if an action is defined
if actions[output] then
    -- Clear screen output
    screen.clearScriptOutput()

    -- Execute the action
    actions[output]()
end
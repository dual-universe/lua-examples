-- Add to programming board's screen.onMouseDown(*,*).

-- Select message randomly
local message = _messages[math.random(1, #_messages)]

-- Get some data for the examples
-- The player id
local id = unit.getMasterPlayerId()
-- The player name
local username = system.getPlayerName(id)
-- The player position
local position = vec3(unit.getMasterPlayerPosition())

-- Prepare input package
local package = {
    message = message,
    id = id,
    name = username,
    pos = position
}

-- Encode the package data with dkjson library
local input = json.encode(package)

-- Send the data package to the screen in input
screen.setScriptInput(input)
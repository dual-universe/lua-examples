-- Lets select a random value between 0 and 360 degrees as the endpoint for the wheel
local value = math.random() * 360

-- We can optionally also send some prizes along from the board, or you could use the ones from the screen unit by removing this.
local prizes = {
    {"Prize 1",1,0,1},
    {"Prize 2",0,1,1},
    {"Prize 3",1,1,0},
    {"Prize 4",1,0,1},
    {"Prize 5",0,1,1},
    {"Prize 6",1,1,0},
    {"Prize 7",1,0,1},
--    {"Disabled Prize",0,1,1},
--    {"Disabled Prize",1,1,0},
    {"Fool's Luck, Spin Again!",1,0.5,0.5},
}
-- Send the values to the screen when the board is run
screen.setScriptInput(json.encode({v=value,p=prizes}))

-- Shut down the board, it's work is done now.
unit.exit()
-- This area sets the default prizes for the wheel, but these are replaced by optionally sent prizes from the control unit.
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
-----------------------------------------------
-- We need a few tools and constants
local json = require("dkjson")
local rx, ry = getResolution()
local math = math
local degToRad = 0.0174533
local font = loadFont("Play", 18)

-- We also need to initialize a few variables that will be carried between animation frames
if not angle then angle = 0 end
if not mod then mod = 1 end
if target == nil then
    target = 0
end

-- Let's get the data from the input buffer sent by the programming board.
local input = json.decode(getInput())

-- Now we need receive the random number that the programming board generated from the input buffer, which should always be a value between 0 and 360 degrees
local randomNr = tonumber(input) or tonumber(input.v)
if randomNr ~= target then
    target = randomNr -- 0 to 360
    angle = 0 -- Reset the angle so we start a new spin
end

-- calculate the spin value (3600 basically means we add 10 full spins to the wheel)
if target > 0 then
    spin = 3600 + target
end

-- calculate the angle that the wheel needs to have from the spin
if angle < spin then
    angle = angle + math.min(37, math.max((spin - angle)/200,0.01)) -- We set a min and a max, which defines the min and max speed of the spin
end

-- Lets create a layer to draw to.
local l = createLayer()

-- Lets check if we have prizes received from the programming board, if we do, overwrite the prize list
if not tonumber(input) and input.p ~= nil and #input.p > 0 then prizes = input.p end

-- As we do need to fill a circle we ideally want a minimum of 12 prizes on the board.
-- So if we have less than 12 prizes, we just duplicate all the prizes around the board until we have at least 12.
if #prizes < 12 then
    local prizeCount, dupe = #prizes, 11 / #prizes
    for d=1, dupe do
        for p = 1, prizeCount do
            prizes[#prizes + 1] = prizes[p]
        end
    end
end

-- Lets calculate how many degrees a single prize should take up by dividing 360 degrees by the number of prizes
local wedgeSize = 360 / #prizes

-- Lets draw some prizes on the board
for i=0, #prizes-1, 1 do
    local l = createLayer() -- We create a new layer for each prize
    local x, y = rx * 0.5, ry * 0.5 -- Find the center of the wheel
    local mult = 0.35 -- This is a color multiplier thats applied to the board to dim the prizes not under the arrow
    if (((i*wedgeSize)+(angle%360)+(wedgeSize/2))%360) < wedgeSize then mult = 2 end -- This increases the color multiplier, if the arrow is over the current prize.
    setNextFillColor(l, prizes[i+1][2]*mult, prizes[i+1][3]*mult, prizes[i+1][4]*mult, 1) -- Sets the color from the prize information and the multiplier above.
    addTriangle(l, -- Now we draw the triangle on the layer, they are all drawn the same, in the same orientation, we rotate them using the layer later.
        x, y,
        x + (math.sin((90 - (wedgeSize / 2)) * degToRad) * ry * 0.45), y + (math.cos((90 - (wedgeSize / 2))  * degToRad) * ry * 0.45),
        x + (math.sin((90 + (wedgeSize / 2)) * degToRad) * ry * 0.45), y + (math.cos((90 + (wedgeSize / 2))  * degToRad) * ry * 0.45)
    )
    setNextTextAlign(l, AlignH_Left, AlignV_Middle) -- Set the text label for the prize
    setNextStrokeColor(l, 0, 0, 0, 0.6) -- Set the stroke color for the text
    setNextStrokeWidth(l, 2) -- set the stroke width for the text
    setNextFillColor(l, 3, 3, 3, 1) -- Set the text color
    addText(l, font, prizes[i+1][1], x + y * 0.18, y) -- Add the text label to the prize
    setLayerOrigin(l, x, y) -- Now we define the center of the layer to be the center of the wheel, allowing us to pivot the prize around the center
    setLayerRotation(l, ((i*wedgeSize)+angle)*degToRad) -- Now we rotate the entire prize layer into place, and then repeat all the above for loop for the next prize.
end

-- Decoration time, let's add the dots on the wheel by adding another layer
local l = createLayer()

-- For every 10 degrees we will add a dot
for i=0, 359, 10 do
    local x, y, a = rx * 0.5, ry * 0.5, i-angle
    setNextFillColor(l, 5, 5, 5, 1)
    addCircle(l, x + (math.sin(a * degToRad) * ry * 0.42), y + (math.cos(a * degToRad) * ry * 0.42), 3)
end

-- Let's draw the arrow to indicate where the prize selection sits on the wheel
if spin - angle < 0.01 then -- If the wheel is no longer spinning, let's make the arrow white.
    setNextFillColor(l, 5, 5, 5, 1)
else
    setNextFillColor(l, 0, 5, 0, 1) -- If the wheel is still spinning, let's make the arrow green
    requestAnimationFrame(1) -- If the wheel is still spinning, let's also ask for another animation. But also prevents asking for animation frames if the spin ended.
end

-- Actually draw the arrow
addTriangle(l,
    rx * 0.5 + ry * 0.4, ry * 0.5,
    rx * 0.5 + ry * 0.44, ry * 0.48,
    rx * 0.5 + ry * 0.44, ry * 0.52
)

-- Lets draw the center dot
setNextFillColor(l, 5, 5, 5, 1)
addCircle(l,
    rx * 0.5, ry * 0.5,
    20 
)

-- Now lets draw the border around the wheel using a transparent circle, but a solid thick stroke around it.
setNextFillColor(l, 0, 0, 0, 0)
setNextStrokeColor(l, 1, 0, 5, 1)
setNextStrokeWidth(l, 25)
addCircle(l,
    rx * 0.5, ry * 0.5,
    ry * 0.43
)
local ballCount = 5000
local speed = 20

local rx, ry = getResolution()


--# Initialization called only at the first frame
if not _init then

    function randF (a, b)
        return a + (b - a) * math.random()
    end

    function randExp ()
        return -math.log(1.0 - math.random())
    end

    -- Create 'ballCount' times ball
    _balls = {}
    for i = 1, ballCount do

        -- Define the ball
        -- .x : X component of the position of the ball
        -- .y : Y component of the position of the ball
        -- .r : Radius of the ball
        -- .vX : X component of the velocity of the ball
        -- .vrY : Y component of the velocity of the ball
        -- .colR : Red component of the color of the ball
        -- .colG : Green component of the color of the ball
        -- .colB : Blue component of the color of the ball
        -- .colA : Alpha component of the color of the ball
        local b = {
            x = randF(0, rx),
            y = randF(0, ry),
            r = 1 + 1.0 * math.log(1.0 - math.random()) ^ 2.0,
            vx = randF(-1, 1) * randExp(),
            vy = randF(-1, 1) * randExp(),
            colR = 1.0 * math.random(),
            colG = 0.1 * math.random(),
            colB = 0.4 * math.random(),
            colA = math.random()
        }

        -- Add the ball to the balls array
        _balls[#_balls +1] = b
    end

    _init = true
end


--# Compute balls movements
local dv = speed * getDeltaTime()

-- For each balls, apply the movement and bounce on borders
for _, b in ipairs(_balls) do
    b.x = b.x + dv * b.vx
    b.y = b.y + dv * b.vy
    if b.x < 0 or b.x > rx then
        b.x = b.x - dv * b.vx
        b.vx = -b.vx
    end
    if b.y < 0 or b.y > ry then
        b.y = b.y - dv * b.vy
        b.vy = -b.vy
    end
end


--# Render
local layer = createLayer()

-- For each balls draw a circle
for _, b in ipairs(_balls) do
    setNextFillColor(layer, b.colR, b.colG, b.colB, b.colA)
    addCircle(layer, b.x, b.y, b.r)
end

-- Request a run at each frame
requestAnimationFrame(1)
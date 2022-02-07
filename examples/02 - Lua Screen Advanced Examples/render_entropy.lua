local ballCount = 5000
local speed = 20

local rx, ry = getResolution()

-- Initialize
if not _init then

    function randF (a, b)
        return a + (b - a) * math.random()
    end

    function randExp ()
        return -math.log(1.0 - math.random())
    end

    -- Create balls
    _balls = {}
    for i = 1, ballCount do
        local b = {
            x = randF(0, rx),
            y = randF(0, ry),
            r = 1 + 1.0 * math.log(1.0 - math.random()) ^ 2.0,
            vx = randF(-1, 1) * randExp(),
            vy = randF(-1, 1) * randExp(),
            cx = 1.0 * math.random(),
            cy = 0.1 * math.random(),
            cz = 0.4 * math.random(),
            ca = math.random()
        }
        _balls[#_balls +1] = b
    end

    _init = true
end

-- Compute balls movements
local dt = speed * getDeltaTime()

for _, b in ipairs(_balls) do
    b.x = b.x + dt * b.vx
    b.y = b.y + dt * b.vy
    if b.x < 0 or b.x > rx then
        b.x = b.x - dt * b.vx
        b.vx = -b.vx
    end
    if b.y < 0 or b.y > ry then
        b.y = b.y - dt * b.vy
        b.vy = -b.vy
    end
end

-- Render
local layer = createLayer()

-- Render balls
for _, b in ipairs(_balls) do
    setNextFillColor(layer, b.cx, b.cy, b.cz, b.ca)
    addCircle(layer, b.x, b.y, b.r)
end

requestAnimationFrame(1)
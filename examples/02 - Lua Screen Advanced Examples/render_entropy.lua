local ballCount = 5000
local speed = 20

local rx, ry = getResolution()

--[[ init ]]--------------------------------------------------------------------

if not init then
    init = true

    function randF (a, b)
        return a + (b - a) * math.random()
    end
        
    function randExp ()
        return -math.log(1.0 - math.random())
    end

    balls = {}
    for i = 1, ballCount do
        local e = {}
        e.x = randF(0, rx)
        e.y = randF(0, ry)
        e.r = 1 + 1.0 * math.log(1.0 - math.random()) ^ 2.0
        e.vx = randF(-1, 1) * randExp()
        e.vy = randF(-1, 1) * randExp()
        e.cx = 1.0 * math.random()
        e.cy = 0.1 * math.random()
        e.cz = 0.4 * math.random()
        e.ca = math.random()
        table.insert(balls, e)
    end
end

--[[ simulation ]]--------------------------------------------------------------

local dt = speed * getDeltaTime()

for _, v in ipairs(balls) do
    v.x = v.x + dt * v.vx
    v.y = v.y + dt * v.vy
    if v.x < 0 or v.x > rx then
        v.x = v.x - dt * v.vx
        v.vx = -v.vx
    end
    if v.y < 0 or v.y > ry then
        v.y = v.y - dt * v.vy
        v.vy = -v.vy
    end
end

--[[ rendering ]]---------------------------------------------------------------

local l = createLayer()

-- render balls
for _, e in ipairs(balls) do
    setNextFillColor(l, e.cx, e.cy, e.cz, e.ca)
    addCircle(l, e.x, e.y, e.r)
end

-- render title
local font = loadFont('Play-Bold', 64)
addText(l, font, '{{ E N T R O P Y }}', 32, ry - 32)

requestAnimationFrame(1)

--------------------------------------------------------------------------------
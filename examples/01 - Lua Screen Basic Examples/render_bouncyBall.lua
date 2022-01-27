local resX, resY = getResolution()
local dt = 100 * getDeltaTime()

-- initialize ball position once
if not init then
    init = true
    ball = {}
    ball.x = resX * math.random()
    ball.y = resY * math.random()
    ball.vx = 2 * math.random() - 1
    ball.vy = 2 * math.random() - 1
    ball.radius = math.min(resX, resY) / 8
end

-- animate ball position
ball.x = ball.x + ball.vx * dt
ball.y = ball.y + ball.vy * dt
if ball.x < ball.radius or ball.x > (resX-ball.radius) then
    ball.x = ball.x - ball.vx * dt
    ball.vx = -ball.vx
end
if ball.y < ball.radius or ball.y > (resY-ball.radius) then
    ball.y = ball.y - ball.vy * dt
    ball.vy = -ball.vy
end

-- render
local layer = createLayer()
addCircle(layer, ball.x, ball.y, ball.radius)
requestAnimationFrame(1)
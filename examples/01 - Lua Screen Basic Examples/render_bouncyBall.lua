local resX, resY = getResolution()
local dt = 100 * getDeltaTime()

--# Initialization called only at the first frame
if not _init then
    _init = true
    
    _time = getTime()
    _lastPos = {}
    
    -- Define the ball object
    -- .x : Position of the ball
    -- .y : Position of the ball
    -- .vel : Velocity of the ball
    -- .dirX : X component of the direction of motion of the ball
    -- .dirY : Y component of the direction of motion of the ball
    -- .radius : Radius of the ball
    _ball = {
        x = resX * math.random(),
        y = resY * math.random(),
        vel = 16,
        dirX = math.random() - 0.5,
        dirY = math.random() - 0.5,
        radius = math.min(resX, resY) / 24
    }
end


--# Save the ball position for trace
if getTime() - _time > 0.1 then
    -- Insert the ball position in the trace table
    table.insert(_lastPos, 1, {_ball.x, _ball.y})

    -- Limit the trace amount to 8
    if #_lastPos > 8 then table.remove(_lastPos,9) end
    _time = getTime()
end


--# Apply movement to the ball
-- X axis
_ball.x = _ball.x + _ball.dirX * _ball.vel * dt
-- Make it bounce if it does reach the left/right borders
if _ball.x < _ball.radius or _ball.x > (resX-_ball.radius) then
    _ball.x = _ball.x - _ball.dirX * _ball.vel * dt
    _ball.dirX = -_ball.dirX
end

-- Y axis
_ball.y = _ball.y + _ball.dirY * _ball.vel * dt
-- Make it bounce if it does reach the top/bottom borders
if _ball.y < _ball.radius or _ball.y > (resY-_ball.radius) then
    _ball.y = _ball.y - _ball.dirY * _ball.vel * dt
    _ball.dirY = -_ball.dirY
end


--# Render
local layer = createLayer()

-- Draw each ball trace
for i,pos in ipairs(_lastPos) do
    setNextFillColor(layer, 1, 1, 1, 0.2)
    addCircle(layer, pos[1], pos[2],(1-i/#_lastPos) * _ball.radius)
end

-- Draw the ball
addCircle(layer, _ball.x, _ball.y, _ball.radius)

-- Request a run at each frame
requestAnimationFrame(1)
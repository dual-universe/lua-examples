local resX, resY = getResolution()
local dt = 100 * getDeltaTime()

-- initialize ball position once
if not _init then
    _init = true
    
    _time = getTime()
    _lastPos = {}
    
    -- define the ball object
    _ball = {
        x = resX * math.random(),
        y = resY * math.random(),
        vel = 16,
        dirX = math.random() - 0.5,
        dirY = math.random() - 0.5,
        radius = math.min(resX, resY) / 24
    }
end

-- save the ball position
if getTime() - _time > 0.1 then
    table.insert(_lastPos, 1, {_ball.x, _ball.y})
    if #_lastPos > 8 then table.remove(_lastPos,9) end
    _time = getTime()
end


-- animate ball position
_ball.x = _ball.x + _ball.dirX * _ball.vel * dt
if _ball.x < _ball.radius or _ball.x > (resX-_ball.radius) then
    _ball.x = _ball.x - _ball.dirX * _ball.vel * dt
    _ball.dirX = -_ball.dirX
end

_ball.y = _ball.y + _ball.dirY * _ball.vel * dt
if _ball.y < _ball.radius or _ball.y > (resY-_ball.radius) then
    _ball.y = _ball.y - _ball.dirY * _ball.vel * dt
    _ball.dirY = -_ball.dirY
end

-- render
local layer = createLayer()

-- draw ball positions snapshots
for i,pos in ipairs(_lastPos) do
    setNextFillColor(layer, 1, 1, 1, 0.21)
    addCircle(layer, pos[1], pos[2],(1-i/#_lastPos) * _ball.radius)
end

-- draw the ball
addCircle(layer, _ball.x, _ball.y, _ball.radius)

requestAnimationFrame(1)

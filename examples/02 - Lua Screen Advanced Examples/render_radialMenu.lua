local rx, ry = getResolution()
local mx, my = getCursor()


--# Initialization called only at the first frame
if not _init then
    -- Define the radial menu properties
    _segments = 8
    _pos = {rx/2, ry/2}
    _radius = 200

    --Declare the function to check if a point is in a triangle
    function side(x1, y1, x2, y2, x, y)
        return (y2 - y1)*(x - x1) + (-x2 + x1)*(y - y1)
    end
    
    _init = true
end


--# Computations
-- Determine the angle delta for each segments
local delta = 2*math.pi/_segments

-- Determine the length of the bisector of the triangle
local dist = math.cos(delta/2)*_radius

local strokeWidth = _radius - dist +0.1 -- Add 0.1 to cover graphics angles
local hover = -1

-- Compute the distance between the cursor and the center
local d = (mx - _pos[1])^2 + (my - _pos[2])^2

-- If in the circle check if the mouse is in a triangle
if d < dist*dist then

    hover = 0
    for i = 1,_segments do
        local a = i*delta
        
        -- Compute the triangles points
        local x1, y1 = _radius*math.cos(a -delta) + _pos[1], -_radius*math.sin(a -delta) + _pos[2]
        local x2, y2 = _radius*math.cos(a) + _pos[1], -_radius*math.sin(a) + _pos[2]
        local x3, y3 = _pos[1], _pos[2]

        -- Check if the mouse is in the triangle
        local s1 = side(x1, y1, x2, y2, mx, my) >= 0;
        local s2 = side(x2, y2, x3, y3, mx, my) >= 0;
        local s3 = side(x3, y3, x1, y1, mx, my) >= 0;

        if s1 and s2 and s3 then
            hover = i
            break
        end
    end
    
end

--# Rendering
local back = createLayer()
local front = createLayer()
local font = loadFont('Play-Bold', 36)

-- For segments draw the triangle
for i = 1,_segments do
    local a = i*delta
    
    setNextStrokeWidth( back, 1)
    setNextStrokeColor( back, 0, 0, 0, 1)
    
    -- If the mouse is over the sector, changes the colour
    if hover == i then
        setNextFillColor( back, 1, 0.8, 0.8, 1)
    else
        setNextFillColor( back, i%2 == 0 and 0.4 or 0.8, 0, 0, 1)
    end

    -- Draw the triangle from the center, to  points on the exterior circle
    addTriangle( back,
        _pos[1],
        _pos[2],
        _radius*math.cos(a -delta) + _pos[1],
        -_radius*math.sin(a -delta) + _pos[2],
        _radius*math.cos(a) + _pos[1],
        -_radius*math.sin(a) + _pos[2]
    )
end

-- Draw center circle
setNextStrokeWidth( front, 6)
setNextStrokeColor( front, 0.5, 0.5, 1, 1)
setNextFillColor( front, 0, 0, 0, 1)
addCircle( front, _pos[1], _pos[2], 38)

-- Draw the boundary circle
setNextStrokeWidth( front, strokeWidth)
setNextStrokeColor( front, 0.5, 0.5, 1, 1)
setNextFillColor( front, 0, 0, 0, 0)
addCircle( front, _pos[1], _pos[2], dist)

-- If mouse is over a sector draw the numero of the sector
if hover >0 then
    setNextTextAlign( front, AlignH_Center, AlignV_Middle)
    addText( front, font, hover, _pos[1], _pos[2])
end

-- Request a refresh
requestAnimationFrame(1)
-- Get screen resolution and center coordinates
local resolutionX,resolutionY = getResolution()
local centerX,centerY = resolutionX/2, resolutionY/2

-- Draw radial menu layers
local triLayer = createLayer()
local circleLayer = createLayer()
local textLayer = createLayer()

-- Define some helpers to convert degrees to radians
local d2r = math.pi/180

-- Helper function to get distance of cursor from coordinates
function getCursorDistance(x,y)
    local curX,curY = getCursor()
    curX = curX - x
    curY = curY - y
    return math.sqrt(curX^2+curY^2)
end

-- Helper function to check if cursor is inside a radial menu section
function isCursorInside(radialCenterX,radialCenterY,radiusMin,radiusMax,degMin,degMax)
    local curX,curY = getCursor()
    curX = curX - radialCenterX
    curY = curY - radialCenterY
    local magnitude = getCursorDistance(radialCenterX,radialCenterY)
    local deg = math.atan(curY/curX)/d2r
    if curX < 0 then deg = deg + 180 end
    if curX > 0 and curY < 0 then deg = deg + 360 end
    if magnitude <= radiusMax and magnitude >= radiusMin and deg > degMin and deg < degMax then return true end
end

-- Define function that can draw a radial menu on demand
function drawRadialMenu(posX,posY,radius,steps,hide,strokeAndCenterAlpha)
    -- Define default variables
    local posX = posX or centerX
    local posY = posY or centerY
    local radius = radius or 200
    local steps = steps or 15
    if hide ~= nil then hide = hide else hide = true end
    local strokeAndCenterAlpha = strokeAndCenterAlpha or 1
    
    -- minimum of 4 segments
    steps = math.max(steps,4)
    
    -- work out the depth of the triangular facets along the circumferance and use it to determine the outer circle stroke width
    local aX,aY = radius*math.cos(0) , radius*math.sin(0) 
    local bX,bY = radius*math.cos(((360/steps)*1)*d2r) , radius*math.sin(((360/steps)*1)*d2r)
    local stroke = math.min(-(radius-math.sqrt(((aX+bX)/2)^2+((aY+bY)/2)^2)),-3)
    
    if not hide or (hide and getCursorDistance(posX,posY) < (radius)) then
            
        -- Draw triangular segments
        local alpha = 0.5
        for step=1,steps,1 do
        
            -- calculate the corners of the triangles on the radius
            local aX,aY = posX + (radius*math.cos(((360/steps)*(step-1))*d2r)) , posY + (radius*math.sin(((360/steps)*(step-1))*d2r)) 
            local bX,bY = posX + (radius*math.cos(((360/steps)*step)*d2r)) , posY + (radius*math.sin(((360/steps)*step)*d2r))
            
            -- call helper function to determine if cursor is inside the segment and change color if true
            if isCursorInside(posX,posY,radius/3,radius,((360/steps)*(step-1)),(360/steps)*step) then
                setNextFillColor(triLayer,1,1,1,1)
                
                -- create center number while the cursor is over a selection
                local font = loadFont('Montserrat', math.floor(radius/4))
                setNextFillColor(textLayer, 1, 1, 1, 1)
                addText(textLayer, font,step, posX-((radius/12)*#tostring(step)), posY+math.floor(radius/12))
            else
                setNextFillColor(triLayer,1,0,0,alpha + 0.5)
            end
            
            -- Draw the triangle based on pre-calculated coordinates and with the color now preset
            addTriangle(triLayer,posX,posY,aX,aY,bX,bY)
            
            -- flip the alpha between 1 and 0 for the next segment
            alpha = 0.5 - alpha
        end
        
        -- Create the outer stroke which should be a negative value so it overlaps the triangle facets 
        setNextStrokeColor(circleLayer,0.5,0.5,1,strokeAndCenterAlpha)
        setNextFillColor(circleLayer,0,0,0,0)
        setNextStrokeWidth(circleLayer,stroke)
        addCircle(circleLayer,posX,posY,radius)
        
        -- Create the inner stroke and fill to create the "hole" in the center at 1/4th of the radius.
        setNextStrokeColor(circleLayer,0.5,0.5,1,strokeAndCenterAlpha)
        setNextFillColor(circleLayer,0,0,0,strokeAndCenterAlpha)
        setNextStrokeWidth(circleLayer,stroke)
        addCircle(circleLayer,posX,posY,radius/4)
    
    else
    
        -- Create a transparent dot to indicate its position while its hidden.
        setNextFillColor(circleLayer,0.5,0.5,1,0.2)
        addCircle(circleLayer,posX,posY,radius/4)
        
    end
end

-- Draw three examples

-- Example 1 (large one on left) with transparency to demonstrate how the circular shape was achieved with the triangles.
drawRadialMenu(resolutionX/3,centerY,200,6,false,0.5)

-- Example 2 (Top right) Does not hide, shows the result without transparency
drawRadialMenu((resolutionX/3)*2,resolutionY/3,100,8,false)

-- Example 3 (Bottom right) Remains hidden and un-rendered until the cursor enters its area, reducing render cost by ~120000 while hidden.
drawRadialMenu((resolutionX/3)*2,(resolutionY/3)*2,80,36)

-- render cost profiler
if true then
    local layer = createLayer()
    local font = loadFont('Play-Bold', 14)
    setNextFillColor(layer, 1, 1, 1, 1)
    addText(layer, font, string.format('render cost : %d / %d', getRenderCost(), getRenderCostMax()), 8, 16)
end

-- Request a refresh
requestAnimationFrame(1)
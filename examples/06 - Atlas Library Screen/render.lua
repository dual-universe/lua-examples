-----------------------------------------------------------------------------------
-- Atlas Lua Screen
--
-- This screen provides an example of a stellar atlas based on screen rendering
-- and the local atlas.lua library.
-----------------------------------------------------------------------------------

---# Local constants class and objects definition
local atlas = require("atlas")
local json = require("dkjson")
local rslib = require("rslib")
local vec3 = require("cpml/vec3")

local system = atlas[0]

local rx,ry = getResolution()

local rear = createLayer()
local back = createLayer()
local front = createLayer()
local fore = createLayer()

local small = loadFont('Play',10)
local smallBold = loadFont('Play-Bold',10)
local normal = loadFont('Play',16)
local normalBold = loadFont('Play-Bold',16)
local medium = loadFont('Play',22)
local mediumBold = loadFont('Play-Bold',22)


---# Local functions definition
--Returns the id of the images requested to load (prevent to load multiple time the same image)
local images = {}
local function loadImages(src)
    for k,img in pairs(images) do
        if k == src then return img end
    end
    images[src] = loadImage(src)
    return images[src]
end

--Returns a concatenated string of the given table with the comma separator according to the language
local function concatList(list,lng)
    local out = {}
    for i,v in pairs(list) do
        out[i] = v[lng]
    end
    return table.concat(out,', ')
end

--Check if the given table t has the given entry u
local function contains(t, u)
    for i,v in pairs(t) do
        if v == u then return true, i end
    end
    return false
end

--Used to set the view to a given stellar body id
local function setView(id)
    local i = 0
    
    for k,b in pairs(system) do
        if b.id == id and b.systemId == 0 then
            i = k
        else
            for k,b in pairs(system) do
                if b.id == b.systemId then
                    i = k
                end
            end
        end
    end
    
    if _mode == 1 then
        _viewX = 470-(i*350)
    else
        _initShift = _viewX
        _shift = 470-(i*350)
        _time = 0
    end
end


---# Settings
-- showCursor : Set at true to display a cursor
-- _lang : Set here the default language (1: English, 2: French, 3: German)
-- _mode : Set the view mode (1: system view, 2: local view)
-- _select : Set the default selected stellar body (i.e. 2 for Alioth)

local showCursor = false
_lang = _lang or 1
_mode = _mode or 1
_select = _select or 1

local loc = {
    description = {"Description", "Description", "Beschreibung"},
    ores = {"Ores", "Minerais", "Erze"},
    biosphere = {"Biosphere", "Biosphere", "Biosphare"},
    habitability = {"Habitability", "Habitabilite", "Bewohnbarkeit"},
    classification = {"Classification", "Classification", "Klassifizierung"},
    satellites = {"Satellites", "Satellites", "Satelliten"},
    distance = {"Distance", "Distance", "Entfernung"},
    radius = {"Radius", "Rayon", "Radius"},
    gravity = {"Gravity", "Gravité", "Schwerkraft"},
    atmoThickness = {"Atmo. Thickness", "Epaiss. atmosphère", "Atmospharendicke"},
    noSatellite = {"This stellar body does not have satellites.","Ce corps stellaire ne dispose pas de satellites.","Dieser Sternkörper hat keine Satelliten."}
}


---# Initialization
_viewX = _viewX or 220
_planets = _planets or {}
_time = _time and _time+getDeltaTime() or 0
_initShift, _shift = _initShift or 0, _shift or 0

local input, dist = getInput(), 0

if not _init then
    if not system[_select] then
        _select = 1
    end

    setView(_select)

    local data = json.decode(input) or {}
    if data.pos then dist = vec3(data.pos) - vec3(planet.center) end
    _init = true
    
    for _,b in pairs(system) do
        if b.systemId == 0 then
            if b.satellites then
                table.sort (b.satellites, function (b1, b2) return system[b1].positionInSystem < system[b1].positionInSystem end )
            end
            
            _planets[#_planets+1] = b
        end
    end
    table.sort (_planets, function (b1, b2) return b1.positionInSystem < b2.positionInSystem end )
end

local planet = system[_select]
local vignette = loadImages(planet.iconPath)

---# Computation
local mx, my = getCursor()
local down, pressed = getCursorDown(), getCursorPressed()

--Compute actions on mouse clicks
if pressed then
    for k=1,3 do
        local lx = rx-84 + k*24
        if (mx-lx)^2 + (my-13) < 20^2 then
            _lang = k
        end
    end

    if _mode==2 and (mx-256)^2 + (my-32)^2 < 24^2 then
        _mode = 1
    end
end

if my>ry-60 and mx>224 and down then
    if _mode==1 then
        _viewX = 220-((mx-224)/700)*4200 + (rx-224)/2
    else
        _mode = 1
    end
end

--Slide animation when clicked on a planet
if _mode == 2 then    
    local t = _time/1
    local sqt = t * t;
    _viewX = t>=1 and _shift or _initShift + (sqt / (2.0 * (sqt - t) + 1.0))*(_shift-_initShift);
end

--Clamp the view shift
_viewX = _viewX>220 and 220 or _viewX
_viewX = _viewX<-3800 and -3800 or _viewX


---# Rendering
--Draw backgrounds and cursor circle
setBackgroundColor(5/255, 6/255, 10/255)

setNextFillColor( front, 15/255, 16/255, 20/255, 1)
addBox( front, 0, 0, 224, ry)

setNextFillColor( back, 5/255, 6/255, 10/255, 1)
addBox( back, 224, ry-60, rx-224, 60)

if showCursor then
    setNextStrokeWidth( fore, 0.1)
    setNextStrokeColor( fore, 1, 193/255, 32/255, 1)
    setNextFillColor( fore, 0,0,0,0)
    addCircle( fore, mx, my, 5)
    setNextFillColor( fore, 1, 193/255, 32/255, 1)
    addCircle( fore, mx, my, 1)
end

---Main view
--Draw the main view sun glow, only if visible on the view
if _viewX > 0 then
    setNextStrokeWidth( rear, 0)
    setNextStrokeColor( rear, 0, 0, 0, 0)
    setNextShadow( rear, 200, 255/255, 120/255, 5/255, 0.85)
    addBox( rear, _viewX-10, 0, 0, ry)
end
    
local bx,by = _viewX+300, ry/2

--Draw the thumbnail sun glow
setNextStrokeWidth( back, 0)
setNextStrokeColor( back, 0, 0, 0, 0)
setNextShadow( back, 45, 255/255, 120/255, 5/255, 0.75)
addBox( back, 200, ry-35, 0, 10)

--Draw all planets
for i,body in pairs(_planets) do
    local img = loadImages(body.iconPath)
    local hover = false
    local r = body.radius/900
    local mbx = 224+(i*350)/6

    if _mode==1 or (_mode == 2 and _select == body.id or (body.satellites and contains(body.satellites, _select))) then
        
        --Check the hover and click events in the rendering (exception made to avoid having to do the same loop in the computation part).
        if (mx-bx)*(mx-bx) + (my-by)*(my-by) < (r+18)^2 then
            hover = true
            if pressed then
                _select = body.id
                if _mode == 1 then
                    _mode = 2
                    setView(body.id)
                end
            end
        end

        --Draw the planet only if it is visible on the screen in order to optimize the rendering cost.
        if bx > -r*1.5 and bx < rx+r*1.5 then
            if hover then
                setNextStrokeWidth( rear, 0.1)
                setNextStrokeColor( rear, 1, 193/255, 32/255, 1)
            end
            setNextFillColor( rear, 0, 0, 0, 0)
            addCircle( rear, bx, by, r+18)
            
            --Draw atmosphere if the stellar body has
            if body.hasAtmosphere then
                local atm = body.atmosphereRadius/900
                
                setNextStrokeWidth( rear, 0.1)
                setNextStrokeColor( rear, 1, 1, 1, 0.03)
                setNextFillColor( rear, 1, 1, 1, 0.025)
                addCircle( rear, bx, by, atm)
            end

            --Draw back line
            setNextStrokeWidth( rear, 0.1)
            setNextStrokeColor( rear, 1, 1, 1, 0.25)
            addLine( rear, bx, 0, bx, ry)

            --Draw planet image
            if body.id == 3 then
                addImage( back, img, bx-(2*r)+8, by-(2*r)+14, 2*(2*r), 2*(2*r))
            else
                r = 1.025 * r
                addImage( back, img, bx-r, by-r, 2*r, 2*r)
            end
            
            --Draw satellites if in local view
            if _mode == 2 then
                if body.satellites then
                    
                    
                    local dsx = 0.5 * (rx-bx+r)/(#body.satellites+1)
                    local sx, sy = bx + r + dsx, by
                    for j,sid in pairs(body.satellites) do                     
                        
                        hover = false
                        local sat = system[sid]
                        local satImg = loadImages(sat.iconPath)
                        sr = sat.radius/1240
                        
                        if (mx-sx)*(mx-sx) + (my-sy)*(my-sy) < (sr+18)^2 then
                            hover = true
                            if pressed then
                                _select = sat.id
                            end
                        end

                        if hover then
                            setNextStrokeWidth( rear, 0.1)
                            setNextStrokeColor( rear, 1, 193/255, 32/255, 1)
                        end
                        setNextFillColor( rear, 0, 0, 0, 0)
                        addCircle( rear, sx, sy, sr+18)

                        if sat.hasAtmosphere then
                            atm = sat.atmosphereRadius/1240

                            setNextStrokeWidth( rear, 0.1)
                            setNextStrokeColor( rear, 1, 1, 1, 0.03)
                            setNextFillColor( rear, 1, 1, 1, 0.025)
                            addCircle( rear, sx, sy, atm)
                        end
                        
                        addImage( back, satImg, sx-sr, sy-sr, 2*sr, 2*sr)

                        setNextStrokeWidth( rear, 0.1)
                        setNextStrokeColor( rear, 1, 1, 1, 0.25)
                        addLine( rear, sx, sy + (sr+10)*(-1)^j, sx, sy + (sr+38)*(-1)^j)

                        setNextTextAlign( back, AlignH_Center, AlignV_Middle)
                        addText( back, normal, sat.name[_lang], sx, sy + (sr+48)*(-1)^j)
                        
                        sx = sx + sr + dsx
                    end                
                    
                else
                    --Otherwise, if the star body has no satellites, we display a message.
                    setNextTextAlign( back, AlignH_Center, AlignV_Middle)
                    addText( back, normal, loc.noSatellite[_lang], (rx+bx)/2, by)
                end
            end

            --Draw the planet name
            setNextTextAlign( back, AlignH_Center, AlignV_Baseline)
            addText( back, medium, body.name[_lang], bx, by+r+38)
        end
    end


    --Draw the thumbnail view
    setNextStrokeWidth( back, 0.1)
    setNextStrokeColor( back, 1, 1, 1, 0.25)
    addLine( back, mbx, ry-60, mbx, ry)
    addImage( front, img, mbx -r/8, ry-30 -r/8, 2*r/8, 2*r/8)

    --If the local view, show the back button arrow
    if _mode == 2 then
        setNextStrokeColor( fore, 1, 193/255, 32/255, 1)
        setNextStrokeWidth( fore, 1)
        addLine( fore, 250, 32, 262, 44)
        
        setNextStrokeColor( fore, 1, 193/255, 32/255, 1)
        setNextStrokeWidth( fore, 1)
        addLine( fore, 250, 32, 262, 20)
    end
    
    bx = bx +350
end


--Draw the minature view box
setNextFillColor( front, 1, 1, 1, 0.1)
addBox( front, 224+(220-_viewX)/6, ry-60, (rx-224)/6, 60)

--Draw the language selector
local langs = {'EN', 'FR', 'GE'}
for k,l in pairs(langs) do
    if _lang == k then
        setNextFillColor( fore, 1, 193/255, 32/255, 1)
    end
    addText( fore, small, l .. (k<3 and '  |' or ''), rx-96 + k*24, 18)
end


---Lateral View
--Draw all informations on the lateral panel
addText( front, medium, string.upper('| '..planet.name[_lang]), 18, 38)

local y = 50
setNextFillColor( front, 10/255, 11/255, 15/255, 1)
addBox( front, 0, y, 224, 120)

addImage( fore, vignette, 112 - 50, y+10, 100, 100)
y = y + 140


addText( front, smallBold, string.upper('| '.. loc.description[_lang]), 18, y)
local _lines = rslib.getTextWrapped( small, planet.description and planet.description[_lang] or '-', 200)
for k,l in pairs(_lines) do
    setNextFillColor( front, 1, 1, 1, 0.75)
    addText( front, small, l, 18, y+2+k*10)
end
y = y + #_lines*10 + 16

addText( front, smallBold, string.upper('| '.. loc.ores[_lang]), 18, y)
setNextFillColor( front, 1, 1, 1, 0.75)
local _lines = rslib.getTextWrapped( small, concatList(planet.ores, _lang), 200)
for k,l in pairs(_lines) do
    setNextFillColor( front, 1, 1, 1, 0.75)
    addText( front, small, l, 18, y+2+k*10)
end
y = y + #_lines*10 + 28

if planet.biosphere then
    addText( front, smallBold, string.upper('| '.. loc.biosphere[_lang]), 18, y)
    setNextFillColor( front, 1, 1, 1, 0.75)
    addText( front, small, planet.biosphere[_lang], 18, y+11)
    y = y +26
end

if planet.habitability then
    addText( front, smallBold, string.upper('| '.. loc.habitability[_lang]), 18, y)
    setNextFillColor( front, 1, 1, 1, 0.75)
    addText( front, small, planet.habitability[_lang], 18, y+11)
    y = y +26
end

if planet.classification then
    addText( front, smallBold, string.upper('| '.. loc.classification[_lang]), 18, y)
    setNextFillColor( front, 1, 1, 1, 0.75)
    addText( front, small, planet.classification[_lang], 18, y+11)
    y = y +26
end

addText( front, smallBold, string.upper('| '.. loc.satellites[_lang]), 18, y)
setNextFillColor( front, 1, 1, 1, 0.75)
addText( front, small, planet.satellites and #planet.satellites or 0, 18, y+11)
y = y +38

addText( front, smallBold, string.upper('| '.. loc.distance[_lang]), 18, y)
setNextFillColor( front, 1, 1, 1, 0.75)
addText( front, small, string.format('%.2f km', dist/1000), 18, y+11)
y = y +26

addText( front, smallBold, string.upper('| '.. loc.radius[_lang]), 18, y)
setNextFillColor( front, 1, 1, 1, 0.75)
addText( front, small, string.format('%.2f km', planet.radius/1000), 18, y+11)
y = y +26

addText( front, smallBold, string.upper('| '.. loc.gravity[_lang]), 18, y)
setNextFillColor( front, 1, 1, 1, 0.75)
addText( front, small, string.format('%.2f m/s²', planet.gravity), 18, y+11)
y = y +26

if planet.hasAtmosphere then
    addText( front, smallBold, string.upper('| '.. loc.atmoThickness[_lang]), 18, y)
    setNextFillColor( front, 1, 1, 1, 0.75)
    addText( front, small, string.format('%.2f m', planet.atmosphereThickness), 18, y+11)
end

---# Request animation frame
requestAnimationFrame(1)
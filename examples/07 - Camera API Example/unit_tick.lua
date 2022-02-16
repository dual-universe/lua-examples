--Declaration of local math functions
local acos, tan, sqrt, deg = math.acos, math.tan, math.sqrt, math.deg

--Get elements on the construct and useful positions
local ids = core.getElementIdList()
local ppos = vec3(unit.getMasterPlayerPosition())
local cpos = vec3(system.getCameraPos())
local cFwd = vec3(system.getCameraForward())

--Set tooltip info by defaults
tooltip = {name="",class="", dist=0}
target = nil

--Iterate on all elements ids
for k,id in pairs(ids) do
    local pos = vec3(core.getElementPositionById(id))

    local dir = pos-cpos
    local dist = dir:len()
    local angle = dir:angle_between(cFwd)

    local r, el = isLinked(id)
    --Check if the player is looking at the element
    if el and angle < tan((el.size or 0)/dist) or angle < tan(1/dist) then
        --Register default data info
        tooltip.name = core.getElementNameById(id)
        tooltip.class = core.getElementTypeById(id)
        tooltip.dist = dist
        tooltip.methods = {}
        tooltip.fields = {}

        --If the element is linked scan the methods and fields of the element
        if r then
            local km, kf = 1,1
            for key,p in pairs(el) do
                if type(p) == 'function' then
                    tooltip.methods[km] = {name = key, value = ''}
                    km = km+1
                else
                    tooltip.fields[kf] = {name = key, value = p}
                    kf = kf+1
                end
            end

            --Sort the methods and field by alphabetically
            table.sort(tooltip.methods, function(a,b) return a.name < b.name end)
            table.sort(tooltip.fields, function(a,b) return a.name < b.name end)
        end
    end
end
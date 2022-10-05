-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Surface Engines
-----------------------------------------------------------------------------------

require("fueledengine")

---@class SurfaceEngine
surfaceEngine = {}
surfaceEngine.__index = surfaceEngine
function SurfaceEngine()
    local self = FueledEngine()

    --- Returns the distance to the first object detected in the direction of the thrust
    ---@return number value The distance to the first obstacle in meters
    function self.getDistance() end

    --- Returns the maximum functional distance from the ground
    ---@return number value The maximum functional distance in meters
    function self.getMaxDistance() end

    return setmetatable(self, surfaceEngine)
end
-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Space Engines
--
-- Space engines are engines designed to operate optimally in the space void.
-----------------------------------------------------------------------------------

require("fueledengine")

--- Space engines are engines designed to operate optimally in the space void.
---@class SpaceEngine
spaceEngine = {}
spaceEngine.__index = spaceEngine
function SpaceEngine()
    local self = FueledEngine()

    ---@deprecated SpaceEngine.getDistance() is deprecated.
    function self.getDistance() error("SpaceEngine.getDistance() is deprecated.") end

    return setmetatable(self, spaceEngine)
end
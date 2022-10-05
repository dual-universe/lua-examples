-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Rocket Engines
--
-- Rocket engines are engines capable of producing enormous thrust in a short period of time.
-- They consume fuel but do not need time to warm up.
-----------------------------------------------------------------------------------

require("fueledengine")

--- Rocket engines are engines capable of producing enormous thrust in a short period of time.
--- They consume fuel but do not need time to warm up.
---@class RocketEngine
rocketEngine = {}
rocketEngine.__index = rocketEngine
function RocketEngine()
    local self = FueledEngine()

    ---@deprecated RocketEngine.getDistance() is deprecated.
    function self.getDistance() error("RocketEngine.getDistance() is deprecated.") end

    return setmetatable(self, rocketEngine)
end
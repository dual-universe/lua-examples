-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Airbrake
--
-- Atmospheric airbrakes are elements designed to produce thrust opposite to the movement of a construct in the atmosphere.
-- It that can be used to slow down your construct
-----------------------------------------------------------------------------------

require("brakeengine")

--- Atmospheric airbrakes are elements designed to produce thrust opposite to the movement of a construct in the atmosphere.
--- It that can be used to slow down your construct
---@class Airbrake
airbrake = {}
airbrake.__index = airbrake
function Airbrake()
    local self = BrakeEngine()

    return setmetatable(self, airbrake)
end
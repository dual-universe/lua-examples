-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Anti gravity generator
--
-- Generates graviton condensates to power anti-gravity pulsors
-----------------------------------------------------------------------------------

require("element")

--- Generates graviton condensates to power anti-gravity pulsors
---@class AntiGravityGenerator
antiGravityGenerator = {}
antiGravityGenerator.__index = antiGravityGenerator
function AntiGravityGenerator()
    local self = Element()

    --- Activate the anti-gravity generator
    function self.activate() end
    ---  Deactivate the anti-gravity generator
    function self.deactivate() end
    --- Returns the state of activation of the anti-gravity generator
    ---@return integer value 1 when the anti-gravity generator is started, 0 otherwise
    function self.isActive() end
    ---@deprecated AntiGravityGenerator.getState() is deprecated, use AntiGravityGenerator.isActive() instead.
    function self.getState() error("AntiGravityGenerator.getState() is deprecated, use AntiGravityGenerator.isActive() instead.") end

    --- Toggle the anti-gravity generator
    function self.toggle() end

    --- Returns the strength of the anti-gravitational field
    ---@return number value The power of the anti-gravitational field in Es
    function self.getFieldStrength() end

    --- Returns the current rate of compensation of the gravitational field
    ---@return number value The current rate in percentage
    function self.getCompensationRate() end

    --- Returns the current power of the gravitational field
    ---@return number value The current power in percentage
    function self.getFieldPower() end

    --- Returns the number of pulsors linked to the anti-gravity generator
    ---@return integer value The number of pulsors linked
    function self.getPulsorCount() end

    --- Set the target altitude for the anti-gravity field. Cannot be called from onFlush
    ---@param altitude number The target altitude in meters. It will be reached with a slow acceleration (not instantaneous)
    function self.setTargetAltitude(altitude) end
    ---@deprecated AntiGravityGenerator.setBaseAltitude(altitude) is deprecated, use AntiGravityGenerator.setTargetAltitude(altitude) instead.
    function self.setBaseAltitude(altitude) error("AntiGravityGenerator.setBaseAltitude(altitude) is deprecated, use AntiGravityGenerator.setTargetAltitude(altitude) instead.") end

    --- Returns the target altitude defined for the anti-gravitational field
    ---@return number value The target altitude in meters
    function self.getTargetAltitude() end

    --- Returns the current base altitude of the anti-gravitational field
    ---@return number value The current base altitude in meters
    function self.getBaseAltitude() end
    

    return setmetatable(self, antiGravityGenerator)
end
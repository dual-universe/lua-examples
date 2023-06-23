-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Engines
--
-- Adjustors are specific motors that expel gas to generate torque on your construct
-----------------------------------------------------------------------------------

require("engine")

--- Adjustors are specific motors that expel gas to generate torque on your construct
---@class Adjustor
adjustor = {}
adjustor.__index = adjustor
function Adjustor()
    local self = Engine()


    --- Start the adjustor at full power (works only when run inside a piloting controller)
    function self.activate() end

    --- Stops the adjustor (works only when run inside a piloting controller)
    function self.deactivate() end

    --- Checks if the adjustor is active
    ---@return boolean value True when the adjustor is on, false otherwise
    function self.isActive() end
    ---@deprecated Adjustor.getState() is deprecated, use Adjustor.isActive().
    function self.getState() error("Adjustor.getState() is deprecated, use Adjustor.isActive().") end

    --- Toggle the state of the adjustor
    function self.toggle() end

    --- Set the exhaust thrust of the adjustor
    ---@param thrust number The adjustor thrust in newtons (limited by the maximum thrust)
    function self.setThrust(thrust) end

    --- Returns the current exhaust thrust of the adjustor
    ---@return number value The current exhaust thrust of the adjustor in newtons
    function self.getThrust() end

    --- Returns the maximal exhaust thrust the adjustor can deliver
    ---@return number value The maximum exhaust thrust of the adjustor in newtons
    function self.getMaxThrust() end
    ---@deprecated Adjustor.getMaxThrustBase() is deprecated, use Adjustor.getMaxThrust().
    function self.getMaxThrustBase() error("Adjustor.getMaxThrustBase() is deprecated, use Adjustor.getMaxThrust().") end

    --- Returns the adjustor exhaust thrust direction in construct local coordinates
    ---@return table value The adjustor exhaust thrust direction vector in construct local coordinates
    function self.getThrustAxis() end

    --- Returns the adjustor torque axis in construct local coordinates
    ---@return table value The torque axis vector in construct local coordinates
    function self.getTorqueAxis() end

    --- Returns the adjustor exhaust thrust direction in world coordinates
    ---@return table value The adjustor thrust direction vector in world coordinates
    function self.getWorldThrustAxis() end
    ---@deprecated Adjustor.thrustAxis() is deprecated, use Adjustor.getWorldThrustAxis().
    function self.thrustAxis() error("Adjustor.thrustAxis() is deprecated, use Adjustor.getWorldThrustAxis().") end

    --- Returns the adjustor torque axis in world coordinates
    ---@return table value The torque axis vector in world coordinates
    function self.getWorldTorqueAxis() end
    ---@deprecated Adjustor.torqueAxis() is deprecated, use Adjustor.getWorldTorqueAxis().
    function self.torqueAxis() error("Adjustor.torqueAxis() is deprecated, use Adjustor.getWorldTorqueAxis().") end
 
    ---@deprecated Adjustor.isOutOfFuel() is deprecated.
    function self.isOutOfFuel() error("Adjustor.isOutOfFuel() is deprecated.") end
    ---@deprecated Adjustor.hasFunctionalFuelTank() is deprecated.
    function self.hasFunctionalFuelTank() error("Adjustor.hasFunctionalFuelTank() is deprecated.") end
    ---@deprecated Adjustor.getCurrentFuelRate()
    function self.getCurrentFuelRate() error("Adjustor.getCurrentFuelRate() is deprecated.") end
    ---@deprecated Adjustor.getFuelRateEfficiency()
    function self.getFuelRateEfficiency() error("Adjustor.getFuelRateEfficiency() is deprecated.") end
    ---@deprecated Adjustor.getFuelConsumption()
    function self.getFuelConsumption() error("Adjustor.getFuelConsumption() is deprecated.") end
    ---@deprecated Adjustor.getDistance()
    function self.getDistance() error("Adjustor.getDistance() is deprecated.") end
    ---@deprecated Adjustor.getT50() is deprecated.
    function self.getT50() error("Adjustor.getT50() is deprecated.") end

    return setmetatable(self, adjustor)
end
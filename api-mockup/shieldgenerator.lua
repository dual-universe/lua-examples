-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Shield generator
--
-- Generates a protective shield around the construct
-----------------------------------------------------------------------------------

require("element")

---@class ShieldGenerator
shieldGenerator = {}
shieldGenerator.__index = shieldGenerator
function ShieldGenerator()
    local self = Element()

    --- Emitted when we started or stopped the shield generator
    ---@param active boolean True if the element was activated, false otherwise
    self.onToggled = Event:new()
    self.toggled = Event:new()
    self.toggled:addAction(function(self, active) error("ShieldGenerator.toggled(active) event is deprecated") end, true, 1)

    --- Emitted when the shield absorbed incoming damage
    ---@param hitpoints number Damage the shield absorbed
    ---@param rawHitpoints number Total damage without taking resistances into account
    self.onAbsorbed = Event:new()
    self.absorbed = Event:new()
    self.absorbed:addAction(function(self, hitpoints, rawHitpoints) error("ShieldGenerator.absorbed(hitpoints, rawHitpoints) event is deprecated") end, true, 1)

    --- Emitted when venting started, stopped or restored some hitpoints
    ---@param active boolean True when venting is active, false otherwise
    ---@param restoredHitpoints number Hitpoints restored since the last venting step
    self.onVenting = Event:new()
    self.venting = Event:new()
    self.venting:addAction(function(self, active, restoredHitpoints) error("ShieldGenerator.absorbed(active, restoredHitpoints) event is deprecated") end, true, 1)

    --- Emitted when the shield hit points reached 0 due to damage
    self.onDown = Event:new()
    self.down = Event:new()
    self.down:addAction(function(self) error("ShieldGenerator.down() event is deprecated") end, true, 1)

    --- Emitted when the shield hit points were fully restored
    self.onRestored = Event:new()
    self.restored = Event:new()
    self.restored:addAction(function(self) error("ShieldGenerator.restored() event is deprecated") end, true, 1)


    --- Activate the shield
    function self.activate() end

    --- Deactivate the shield
    function self.deactivate() end

    --- Toggle the state of the shield
    function self.toggle() end

    --- Returns the activation state of the shield
    ---@return boolean value True when the shield is active, false otherwise
    function self.isActive() end
    ---@deprecated ShieldGenerator.getState() is deprecated, use ShieldGenerator.isActive() instead.
    function self.getState() error("ShieldGenerator.getState() is deprecated, use ShieldGenerator.isActive() instead.") end


    --- Returns the current hitpoints of the shield
    ---@return number value The current hitpoints of the shield
    function self.getShieldHitpoints() end

    --- Returns the maximal hitpoints of the shield
    ---@return number value The maximal hitpoints of the shield
    function self.getMaxShieldHitpoints() end


    --- Activate shield venting to restore hit points
    ---@return boolean state True if venting started, false if an error occurred
    function self.startVenting() end

    --- Stop shield venting
    ---@return boolean state True if venting stopped, false if an error occurred
    function self.stopVenting() end

    --- Check whether venting is in progress
    ---@return boolean state True if venting is ongoing, false otherwise
    function self.isVenting() end

    --- Returns time after which venting is possible again
    ---@return number value Remaining seconds of the venting cooldown
    function self.getVentingCooldown() end

    --- Returns maximal cooldown between venting
    ---@return number value Maximal seconds of the venting cooldown
    function self.getVentingMaxCooldown() end


    --- Returns distribution of resistance pool over resistance types
    ---@return table resistances Resistance to damage type {antimatter, electromagnetic, kinetic, thermic}
    function self.getResistances() end

    --- Distribute the resistance pool according to damage type
    ---@param antimatter number Antimatter damage resistance
    ---@param electromagnetic number Electromagnetic damage resistance
    ---@param kinetic number Kinetic damage resistance
    ---@param thermic number Thermic damage resistance
    ---@return boolean success True if resistance was distributed, false if an error occurred
    function self.setResistances(antimatter,electromagnetic,kinetic,thermic) end

    --- Returns time after which adjusting resistances is possible again
    ---@return number value Remaining time of the resistance cooldown in seconds
    function self.getResistancesCooldown() end

    --- Returns maximal cooldown between adjusting resistances
    ---@return number value The maximum time of the resistance cooldown in seconds
    function self.getResistancesMaxCooldown() end

    --- Returns total resistance pool that may be distributed
    ---@return number value Total pool of resistances
    function self.getResistancesPool() end

    --- Returns the remaining amount of the resistance pool that can be distributed
    ---@return number value Remaining resistance pool
    function self.getResistancesRemaining() end

    --- Returns ratio per damage type of recent weapon impacts after applying resistance
    ---@return table stress Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
    function self.getStressRatio() end

    --- Returns ratio per damage type of recent weapon impacts without resistance
    ---@return table stress Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
    function self.getStressRatioRaw() end

    --- Returns stress, that is the total hitpoints of recent weapon impacts after applying resistance
    ---@return number value Total stress hitpoints due to recent weapon impacts
    function self.getStressHitpoints() end

    --- Returns stress, that is the total hitpoints of recent weapon impacts without resistance
    ---@return number value Total stress hitpoints due to recent weapon impacts
    function self.getStressHitpointsRaw() end

    return setmetatable(self, shieldGenerator)
end
-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Weapon
--
-- Displays information about the weapon's state
-----------------------------------------------------------------------------------

require("element")

--- Displays information about the weapon's state
---@class Weapon
weapon = {}
weapon.__index = weapon
function Weapon()
    local self = Element()

    --- Emitted when the weapon start reloading
    ---@param ammoId integer The item id of the ammo
    self.onReload = Event:new()

    --- Emitted when the weapon has reloaded
    ---@param ammoId integer The item id of the ammo
    self.onReloaded = Event:new()

    --- Emitted when the weapon has missed its target
    ---@param targetId integer The construct id of the target
    self.onMissed = Event:new()

    --- Emitted when the weapon target has been destroyed
    ---@param targetId integer The construct id of the target
    self.onDestroyed = Event:new()

    --- Emitted when an element on the weapon target has been destroyed
    ---@param targetId integer The construct id of the target
    ---@param itemId integer The item id of the destroyed element
    self.onElementDestroyed = Event:new()

    --- Emitted when the weapon has hit
    ---@param targetId integer The construct id of the target
    ---@param damage number The damage amount dealt by the hit
    self.onHit = Event:new()


    --- Returns the item id of the currently equipped ammo
    ---@return integer value The item id of the ammunition in the weapon
    function self.getAmmo() end

    --- Returns the current amount of remaining ammunition
    ---@return integer value The remaining ammunition count (0 when reloading)
    function self.getAmmoCount() end

    --- Returns the maximum amount of ammunition the weapon can carry
    ---@return integer value The maximum amount of ammunition
    function self.getMaxAmmo() end

    --- Checks if the weapon is out of ammo
    ---@return boolean value True if the weapon is out of ammo, false otherwise
    function self.isOutOfAmmo() end

    --- Checks if the weapon is operational
    ---@return integer state 1 if the weapon is operational, otherwise 0 = broken, -1 = incompatible size
    function self.getOperationalState() end
    ---@deprecated Weapon.isOperational() is deprecated, use Weapon.getOperationalState() instead.
    function self.isOperational() error("Weapon.isOperational() is deprecated, use Weapon.getOperationalState() instead.") end


    --- Returns the current weapon status
    ---@return integer status The current status of the weapon (Idle = 1, Firing = 2, Stopping = 3, Reloading = 4, Unloading = 5, FiringBlocked = 6)
    function self.getStatus() end

    --- Returns the local id of the container linked to the weapon
    ---@return integer value The local id of the container
    function self.getContainerId() end

    --- Returns the current hit probability of the weapon for the current target
    ---@return number value The hit probability of the weapon
    function self.getHitProbability() end

    --- Returns the base weapon damage
    ---@return number value The base weapon damage in hitpoints
    function self.getBaseDamage() end

    --- Returns the optimal aim cone
    ---@return number value The optimal aim cone in degrees
    function self.getOptimalAimingCone() end

    --- Returns the optimal distance to target
    ---@return number value The optimal distance in meters
    function self.getOptimalDistance() end

    --- Returns the maximum distance to target
    ---@return number value The optimal distance in meters
    function self.getMaxDistance() end

    --- Returns the optimal tracking rate
    ---@return number value The optimal tracking rate in degrees per second
    function self.getOptimalTracking() end

    --- Returns the magazine volume
    ---@return number value The magazine volume in liters
    function self.getMagazineVolume() end

    --- Returns the weapon cycle time
    ---@return number value The weapon cycle time in seconds
    function self.getCycleTime() end

    --- Returns the weapon reload time
    ---@return number value The weapon reload time in seconds
    function self.getReloadTime() end

    --- Returns the weapon unload time
    ---@return number value The weapon unload time in seconds
    function self.getUnloadTime() end

    --- Returns the id of the current target construct of the weapon
    ---@return integer value The target construct id
    function self.getTargetId() end


    return setmetatable(self, weapon)
end

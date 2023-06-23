-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Landing Gear
--
-- A Landing Gear that can be opened or closed.
-----------------------------------------------------------------------------------

require("element")

---@class LandingGear
landingGear = {}
landingGear.__index = landingGear
function LandingGear()
    local self = Element()

    --- Deploys the landing gear
    function self.deploy() end
    ---@deprecated LandingGear.activate() is deprecated, use LandingGear.deploy() instead.
    function self.activate() error("LandingGear.activate() is deprecated, use LandingGear.deploy() instead.") end

    --- Retracts the landing gear
    function self.retract() end
    ---@deprecated LandingGear.deactivate() is deprecated, use LandingGear.retract() instead.
    function self.deactivate() error("LandingGear.deactivate() is deprecated, use LandingGear.retract() instead.") end

    --- Checks if the landing gear is deployed
    ---@return boolean value True if the landing gear is deployed, false otherwise
    function self.isDeployed() end
    ---@deprecated LandingGear.getState() is deprecated, use LandingGear.isDeployed() instead.
    function self.getState() error("LandingGear.getState() is deprecated, use LandingGear.isDeployed() instead.") end

    --- Toggle the landing gear
    function self.toggle() end

    return setmetatable(self, landingGear)
end
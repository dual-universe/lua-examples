-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Force Field
--
-- A Force Field to create an uncrossable energy barrier.
-----------------------------------------------------------------------------------

require("element")

---@class ForceField
forceField = {}
forceField.__index = forceField
function ForceField()
    local self = Element()

    --- Deploys the forcefield
    function self.deploy() end
    ---@deprecated ForceField.activate() is deprecated, use ForceField.deploy() instead.
    function self.activate() error("ForceField.activate() is deprecated, use ForceField.deploy() instead.") end

    --- Retracts the forcefield
    function self.retract() end
    ---@deprecated ForceField.deactivate() is deprecated, use ForceField.retract() instead.
    function self.deactivate() error("ForceField.deactivate() is deprecated, use ForceField.retract() instead.") end

    --- Checks if the forcefield is deployed
    ---@return boolean value True if the forcefield is deployed, false otherwise
    function self.isDeployed() end
    ---@deprecated ForceField.getState() is deprecated, use ForceField.isDeployed() instead.
    function self.getState() error("ForceField.getState() is deprecated, use ForceField.isDeployed() instead.") end

    --- Toggle the forcefield
    function self.toggle() end


    --- Returns the current length of the forcefield
    ---@return number value The current length of the forcefield
    function self.getCurrentLength() end

    --- Returns the maximum length of the forcefield
    ---@return number value The maximum length of the forcefield (between 0 and the limit of the forcefield model)
    function self.getMaxLength() end

    --- Sets the max length of the forcefield
    ---@param maxLength integer Maximum length (between 0 and the length limit)
    ---@return boolean success True if the maximum length was set, false if an error occurred
    function self.setMaxLength(maxLength) end

    --- Returns the length limit of this forcefield model
    ---@return number value The length limit of this forcefield model
    function self.getLengthLimit() end


    return setmetatable(self, forceField)
end
-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Fuel Container
--
-- Containers are elements designed to store fuel
-----------------------------------------------------------------------------------

require("container")

---@class FuelContainer
FuelContainer = {}
FuelContainer.__index = FuelContainer
function FuelContainer()
    local self = Container()

    return setmetatable(self, FuelContainer)
end
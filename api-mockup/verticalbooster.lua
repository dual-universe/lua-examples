-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Vertical Boosters
--
-- Vertical boosters are engines designed to produce powerful vertical thrust over a limited distance.
-- They consume space fuel but operate in the atmosphere and in the space void.
-----------------------------------------------------------------------------------

require("surfaceengine")

--- Vertical boosters are engines designed to produce powerful vertical thrust over a limited distance.
--- They consume space fuel but operate in the atmosphere and in the space void.
---@class VerticalBooster
verticalBooster = {}
verticalBooster.__index = verticalBooster
function VerticalBooster()
    local self = SurfaceEngine()

    return setmetatable(self, verticalBooster)
end
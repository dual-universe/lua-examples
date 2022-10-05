-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Warp Drive
--
-- Based on the principle of the Alcubierre drive, this unit creates a powerful negative energy-density field capable of distorting space-time and transport your ship at hyper speeds through space.
-----------------------------------------------------------------------------------

require("element")

--- Based on the principle of the Alcubierre drive, this unit creates a powerful negative energy-density field capable of distorting space-time and transport your ship at hyper speeds through space.
---@class WarpDrive
warpDrive = {}
warpDrive.__index = warpDrive
function WarpDrive()
    local self = Element()


    --- Initiate the warp jump process
    function self.initiate() end

    --- Returns the current status of the warp drive
    ---@return integer status The current status of the warp drive (NoWarpDrive = 1, Broken = 2, Warping = 3, ParentWarping = 4, NotAnchored = 5, WarpCooldown = 6, PvPCooldown = 7, MovingChild = 8, NoContainer = 9, PlanetTooClose = 10, DestinationNotSet = 11, DestinationTooClose = 12, DestinationTooFar = 13, NotEnoughWarpCells = 14, Ready = 15)
    function self.getStatus() end

    --- Returns the distance to the current warp destination
    ---@return number value The distance to the current warp destination
    function self.getDistance() end

    --- Returns the construct ID of the current warp destination
    ---@return integer value The construct id of the warp destination
    function self.getDestination() end

    --- Returns the name of the current warp destination construct
    ---@return string value The warp destination name
    function self.getDestinationName() end

    --- Returns the local id of the container linked to the warp drive
    ---@return integer value The local id of the container
    function self.getContainerId() end

    --- Returns the quantity of warp cells available in the linked container
    ---@return integer value The quantity of available warp cells
    function self.getAvailableWarpCells() end

    --- Returns the quantity of warp cells required to warp to the warp destination set
    ---@return integer value The quantity of required warp cells for the jump set
    function self.getRequiredWarpCells() end


    return setmetatable(self, warpDrive)
end
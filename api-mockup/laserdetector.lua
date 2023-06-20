-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Laser Detector
--
-- Detect the hit of a Laser.
-----------------------------------------------------------------------------------

require("element")

--- Detect the hit of a Laser.
---@class LaserDetector
laserDetector = {}
laserDetector.__index = laserDetector
function LaserDetector()
    local self = Element()

    --- Emitted when a laser hit the detector
    self.onHit = Event:new()
    self.laserHit = Event:new()
    self.laserHit:addAction(function(self) error("LaserDetector.laserHit() event is deprecated, use LaserDetector.onHit() instead.") end, true, 1)

    --- Emitted when all lasers stop hitting the detector
    self.onLoss = Event:new()
    self.laserRelease = Event:new()
    self.laserRelease:addAction(function(self) error("LaserDetector.laserRelease() event is deprecated, use LaserDetector.onLoss() instead.") end, true, 1)

    --- Checks if any laser is hitting the detector
    ---@return boolean value True if a laser is hitting the detector, false otherwise
    function self.isHit() end
    ---@deprecated LaserDetector.getState() is deprecated, use LaserDetector.isHit() instead.
    function self.getState() error("LaserDetector.getState() is deprecated, use LaserDetector.isHit() instead.") end

    return setmetatable(self, laserDetector)
end
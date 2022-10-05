-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Detection Zone
--
-- Detect the intrusion of any player inside the effect zone.
-----------------------------------------------------------------------------------

require("element")

--- Detect the intrusion of any player inside the effect zone.
---@class DetectionZone
detectionZone = {}
detectionZone.__index = detectionZone
function DetectionZone()
    local self = Element()

    --- Returns the detection zone radius
    ---@return number value The detection zone radius in meters
    function self.getRadius() end

    --- Returns the list of ids of the players in the detection zone
    ---@return table value The list of player ids
    function self.getPlayers() end

    --- Emitted when a player enters in the detection zone
    ---@param id integer The ID of the player. Use system.getPlayerName(id) to retrieve its name
    self.onEnter = Event:new()
    self.enter = Event:new()
    self.enter:addAction(function(self,id) error("DetectionZone.enter(id) event is deprecated, use DetectionZone.onEnter(id) instead.") end, true, 1)
    
    --- Emitted when a player leaves in the detection zone
    ---@param id integer The ID of the player. Use system.getPlayerName(id) to retrieve its name
    self.onLeave = Event:new()
    self.leave = Event:new()
    self.leave:addAction(function(self,id) error("DetectionZone.leave(id) event is deprecated, use DetectionZone.onLeave(id) instead.") end, true, 1)

    return setmetatable(self, detectionZone)
end
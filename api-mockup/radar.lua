-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Radar
--
-- Get information about the Radar and its current targets
-----------------------------------------------------------------------------------

require("element")

--- Get information about the Radar and its current targets
---@class Radar
radar = {}
radar.__index = radar
function Radar()
    local self = Element()


    --- Checks if the radar is operational
    ---@return integer state 1 if the radar is operational, otherwise: 0 = broken, -1 = bad environment, -2 = obstructed, -3 = already in use
    function self.getOperationalState() end
    ---@deprecated Radar.isOperational() is deprecated, use Radar.getOperationalState() instead.
    function self.isOperational() error("Radar.isOperational() is deprecated, use Radar.getOperationalState() instead.") end

    --- Returns the scan range of the radar
    ---@return number value The scan range
    function self.getRange() end

    --- Returns ranges to identify a target based on its core size
    ---@return table ranges The list of float values for ranges in meters as { xsRange, sRange, mRange, lRange }
    function self.getIdentifyRanges() end

    --- Returns the list of construct IDs in the scan range
    ---@return table value The list of scanned construct IDs
    function self.getConstructIds() end

    --- Returns the sort method for construct data
    ---@return integer value The sort method (Distance Ascending = 1, Distance Descending = 2, Size Ascending = 3, Size Descending = 4, Threat Ascending = 5, Threat Descending = 6)
    function self.getSortMethod() end

    --- Sets the sort method for construct data
    ---@param method integer The sort method (Distance Ascending = 1, Distance Descending = 2, Size Ascending = 3, Size Descending = 4, Threat Ascending = 5, Threat Descending = 6)
    ---@return boolean success True if the sort method was set successfully, false otherwise 
    function self.setSortMethod(method) end

    --- Returns the list of identified construct IDs
    ---@return table value The list of identified construct IDs
    function self.getIdentifiedConstructIds() end

    --- Returns the list of constructs in a given range according to the current sort method
    ---@param offset integer Offset from the first entry
    ---@param size integer Total entries to return following the offset, 0 to return all entries
    ---@param filter table (optional) The filters to be applied as a table {[bool] isMatching, [int] constructKind, [string] coreSize, [bool] isAbandoned}
    ---@param isMatching boolean (optional) True to filter out constructs with a matching transponder, false otherwise
    ---@param constructKind integer (optional) The construct kind id to filter out constructs (Universe = 1, Planet = 2, Asteroid = 3, Static = 4, Dynamic = 5, Space = 6, Alien = 7)
    ---@param coreSize string (optional) The construct core unit size to filter out constructs ('XS', 'S', 'M', 'L', 'XL')
    ---@param isAbandoned boolean (optional) True to filter out abandoned constructs, false otherwise
    ---@return table value The list of constructs tables {[integer] constructId, [string] name, [string] size, [string] constructType, [number] mass, [int] isIdentified, [int] inIdentifyRange, [number] identificationDuration, [number] remainingIdentificationTime, [int] myThreatStateToTarget, [int] targetThreatState, [number] distance, [table] worldPosition, [number] speed, [number] radialSpeed, [number] angularSpeed, [table] info}
    function self.getConstructs(offset, size, filter) end

    --- Returns the ID of the target construct
    ---@return integer value The ID of the target construct
    function self.getTargetId() end

    --- Returns the distance to the given construct
    ---@param id integer The ID of the construct
    ---@return number value The distance between the current and target construct center
    function self.getConstructDistance(id) end

    --- Returns 1 if the given construct is identified
    ---@param id integer The ID of the construct
    ---@return boolean value True if the construct is identified, false otherwise
    function self.isConstructIdentified(id) end

    --- Returns 1 if the given construct was abandoned
    ---@param id integer The ID of the construct
    ---@return boolean value True if the construct has no owner, false otherwise
    function self.isConstructAbandoned(id) end

    --- Returns the core size of the given construct
    ---@param id integer The ID of the construct
    ---@return string size The core size name; can be 'XS', 'S', 'M', 'L', 'XL'
    function self.getConstructCoreSize(id) end

    --- Returns the threat rate your construct is for the given construct
    ---@param id integer The ID of the construct
    ---@return integer threat The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
    function self.getThreatRateTo(id) end
    ---@deprecated Radar.getThreatTo(id) is deprecated, use Radar.getThreatRateTo(id) instead.
    function self.getThreatTo() error("Radar.getThreatTo(id) is deprecated, use Radar.getThreatRateTo(id) instead.") end

    --- Returns the threat rate the given construct is for your construct
    ---@param id integer The ID of the construct
    ---@return string threat The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
    function self.getThreatRateFrom(id) end
    ---@deprecated Radar.getThreatFrom(id) is deprecated, use Radar.getThreatRateFrom(id) instead.
    function self.getThreatFrom() error("Radar.getThreatFrom(id) is deprecated, use Radar.getThreatRateFrom(id) instead.") end

    --- Returns whether the target has an active Transponder with matching tags
    ---@param id integer The ID of the construct
    ---@return boolean value True if your Construct and the target have active Transponders with at least one matching tag, false otherwise
    function self.hasMatchingTransponder(id) end

    --- Returns a table with id of the owner entity (player or organization) of the given construct, if in range and if active transponder tags match for owned dynamic constructs.
    ---@param id integer The ID of the construct
    ---@return table entity A table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
    function self.getConstructOwnerEntity(id) end
    ---@deprecated Radar.getConstructOwner(id) is deprecated, use Radar.getConstructOwnerEntity(id) instead.
    function self.getConstructOwner() error("Radar.getConstructOwner(id) is deprecated, use Radar.getConstructOwnerEntity(id) instead.") end

    --- Return the size of the bounding box of the given construct, if in range
    ---@param id integer The ID of the construct
    ---@return table value The size of the construct in xyz-coordinates
    function self.getConstructSize(id) end

    --- Return the kind of the given construct
    ---@param id integer The ID of the construct
    ---@return integer kind The kind index of the construct (Universe = 1, Planet = 2, Asteroid = 3, Static = 4, Dynamic = 5, Space = 6, Alien = 7)
    function self.getConstructKind(id) end
    ---@deprecated Radar.getConstructType(id) is deprecated, use Radar.getConstructKind(id) instead.
    function self.getConstructType() error("Radar.getConstructType(id) is deprecated, use Radar.getConstructKind(id) instead.") end

    --- Returns the position of the given construct in construct local coordinates, if active transponder tags match for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return table value The position of the construct center in local construct coordinates
    function self.getConstructPos(id) end

    ---  Returns the position of the given construct in world coordinates, if in range and if active transponder tags match for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return table value The position of the construct center in world coordinates
    function self.getConstructWorldPos(id) end

    --- Returns the velocity vector of the given construct in construct local coordinates, if identified and if active transponder tags match for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return table value The velocity of the construct in local construct coordinates
    function self.getConstructVelocity(id) end

    --- Returns the velocity vector of the given construct in world coordinates, if identified and if active transponder tags match for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return table value The velocity of the construct in world coordinates
    function self.getConstructWorldVelocity(id) end

    --- Returns the mass of the given construct, if identified for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return number value The mass of the construct in kilograms
    function self.getConstructMass(id) end

    --- Return the name of the given construct, if defined
    ---@param id integer The ID of the construct
    ---@return string value The name of the construct
    function self.getConstructName(id) end

    --- Returns a table of working elements on the given construction, if identified for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return table info A table with fields : {[float] weapons, [float] radars, [float] antiGravity, [float] atmoEngines, [float] spaceEngines, [float] rocketEngines} with values between 0.0 and 1.0. Exceptionally antiGravity and rocketEngines are always 1.0 if present, even if broken
    function self.getConstructInfos(id) end

    --- Returns the speed of the given construct, if identified for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return number speed The speed of the construct relative to the universe in meters per second
    function self.getConstructSpeed(id) end

    --- Returns the angular speed of the given construct to your construct, if identified for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return number speed The angular speed of the construct relative to our construct in radians per second
    function self.getConstructAngularSpeed(id) end

    --- Returns the radial speed of the given construct to your construct, if identified for owned dynamic constructs
    ---@param id integer The ID of the construct
    ---@return number speed The radial speed of the construct relative to our construct in meters per second
    function self.getConstructRadialSpeed(id) end

    --- Emitted when a Construct enters the scan range of the radar
    ---@param id integer The ID of the construct
    self.onEnter = Event:new()
    self.enter = Event:new()
    self.enter:addAction(function(self,id) error("Radar.enter(id) event is deprecated, use Radar.onEnter(id) instead.") end, true, 1)

    --- Emitted when a construct leaves the range of the radar
    ---@param id integer The ID of the construct
    self.onLeave = Event:new()
    self.leave = Event:new()
    self.leave:addAction(function(self,id) error("Radar.leave(id) event is deprecated, use Radar.onLeave(id) instead.") end, true, 1)

    --- Emitted when a construct is identified
    ---@param id integer The ID of the construct
    self.onIdentified = Event:new()


    return setmetatable(self, radar)
end
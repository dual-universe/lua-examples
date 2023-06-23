-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Core Unit
--
-- It is the heart of your construct. It gives access to the elements of the construction and information on the environment.
-----------------------------------------------------------------------------------

require("element")

--- It is the heart of your construct. It gives access to the elements of the construction and information on the environment.
---@class CoreUnit
coreUnit = {}
coreUnit.__index = coreUnit
function CoreUnit()
    local self = Element()

    self.pvpTimer = Event:new()
    self.pvpTimer:addAction(function(self,active) error("CoreUnit.completed(active) event is deprecated, use construct.onPvPTimer(active) instead.") end, true, 1)

    self.playerBoarded = Event:new()
    self.playerBoarded:addAction(function(self,id) error("CoreUnit.playerBoarded(pid) event is deprecated, use construct.onPlayerBoarded(id) instead.") end, true, 1)

    self.VRStationEntered = Event:new()
    self.VRStationEntered:addAction(function(self,id) error("CoreUnit.VRStationEntered(pid) event is deprecated, use construct.onVRStationEntered(id) instead.") end, true, 1)

    self.constructDocked = Event:new()
    self.constructDocked:addAction(function(self,id) error("CoreUnit.constructDocked(cid) event is deprecated, use construct.onConstructDocked(id) instead.") end, true, 1)

    self.docked = Event:new()
    self.docked:addAction(function(self,id) error("CoreUnit.docked(cid) event is deprecated, use construct.onDocked(id) instead.") end, true, 1)

    self.undocked = Event:new()
    self.undocked:addAction(function(self,id) error("CoreUnit.undocked(cid) event is deprecated, use construct.onUndocked(id) instead.") end, true, 1)


    ---@deprecated CoreUnit.getConstructId() is deprecated, use construct.getId() instead.
    function self.getConstructId() error("CoreUnit.getConstructId() is deprecated, use construct.getId() instead.") end
    ---@deprecated CoreUnit.getConstructName() is deprecated, use construct.getName() instead.
    function self.getConstructName() error("CoreUnit.getConstructName() is deprecated, use construct.getName() instead.") end
    ---@deprecated CoreUnit.getConstructWorldPos() is deprecated, use construct.getWorldPosition() instead.
    function self.getConstructWorldPos() error("CoreUnit.getConstructWorldPos() is deprecated, use construct.getWorldPosition() instead.") end
    ---@deprecated CoreUnit.getWorldAirFrictionAcceleration() is deprecated, use construct.getWorldAirFrictionAcceleration() instead.
    function self.getWorldAirFrictionAcceleration() error("CoreUnit.getWorldAirFrictionAcceleration() is deprecated, use construct.getWorldAirFrictionAcceleration() instead.") end
    ---@deprecated CoreUnit.getWorldAirFrictionAngularAcceleration() is deprecated, use construct.getWorldAirFrictionAngularAcceleration() instead.
    function self.getWorldAirFrictionAngularAcceleration() error("CoreUnit.getWorldAirFrictionAngularAcceleration() is deprecated, use construct.getWorldAirFrictionAngularAcceleration() instead.") end
    ---@deprecated CoreUnit.getSchematicInfo(schematicId) is deprecated, use System.getSchematic(id) instead.
    function self.getSchematicInfo(schematicId) error("CoreUnit.getSchematicInfo() is deprecated, use System.getSchematic(id) instead.") end
    ---@deprecated CoreUnit.getAngularVelocity() is deprecated, use construct.getAngularVelocity() instead.
    function self.getAngularVelocity() error("CoreUnit.getAngularVelocity() is deprecated, use construct.getAngularVelocity() instead.") end
    ---@deprecated CoreUnit.getWorldAngularVelocity() is deprecated, use construct.getWorldAngularVelocity() instead.
    function self.getWorldAngularVelocity() error("CoreUnit.getWorldAngularVelocity() is deprecated, use construct.getWorldAngularVelocity() instead.") end
    ---@deprecated CoreUnit.getAngularAcceleration() is deprecated, use construct.getAngularAcceleration() instead.
    function self.getAngularAcceleration() error("CoreUnit.getAngularAcceleration() is deprecated, use construct.getAngularAcceleration() instead.") end
    ---@deprecated CoreUnit.getWorldAngularAcceleration() is deprecated, use construct.getWorldAngularAcceleration() instead.
    function self.getWorldAngularAcceleration() error("CoreUnit.getWorldAngularAcceleration() is deprecated, use construct.getWorldAngularAcceleration() instead.") end
    ---@deprecated CoreUnit.getVelocity() is deprecated, use construct.getVelocity() instead.
    function self.getVelocity() error("CoreUnit.getVelocity() is deprecated, use construct.getVelocity() instead.") end
    ---@deprecated CoreUnit.getWorldVelocity() is deprecated, use construct.getWorldVelocity() instead.
    function self.getWorldVelocity() error("CoreUnit.getWorldVelocity() is deprecated, use construct.getWorldVelocity() instead.") end
    ---@deprecated CoreUnit.getAbsoluteVelocity() is deprecated, use construct.getAbsoluteVelocity() instead.
    function self.getAbsoluteVelocity() error("CoreUnit.getAbsoluteVelocity() is deprecated, use construct.getAbsoluteVelocity() instead.") end
    ---@deprecated CoreUnit.getWorldAbsoluteVelocity() is deprecated, use construct.getWorldAbsoluteVelocity() instead.
    function self.getWorldAbsoluteVelocity() error("CoreUnit.getWorldAbsoluteVelocity() is deprecated, use construct.getWorldAbsoluteVelocity() instead.") end
    ---@deprecated CoreUnit.getWorldAcceleration() is deprecated, use construct.getWorldAcceleration() instead.
    function self.getWorldAcceleration() error("CoreUnit.getWorldAcceleration() is deprecated, use construct.getWorldAcceleration() instead.") end
    ---@deprecated CoreUnit.getAcceleration() is deprecated, use construct.getAcceleration() instead.
    function self.getAcceleration() error("CoreUnit.getAcceleration() is deprecated, use construct.getAcceleration() instead.") end
    ---@deprecated CoreUnit.getOrientationUnitId() is deprecated, use construct.getOrientationUnitId() instead.
    function self.getOrientationUnitId() error("CoreUnit.getOrientationUnitId() is deprecated, use construct.getOrientationUnitId() instead.") end
    ---@deprecated CoreUnit.getConstructOrientationUp() is deprecated, use construct.getOrientationUp() instead.
    function self.getConstructOrientationUp() error("CoreUnit.getConstructOrientationUp() is deprecated, use construct.getOrientationUp() instead.") end
    ---@deprecated CoreUnit.getConstructOrientationRight() is deprecated, use construct.getOrientationRight() instead.
    function self.getConstructOrientationRight() error("CoreUnit.getConstructOrientationRight() is deprecated, use construct.getOrientationRight() instead.") end
    ---@deprecated CoreUnit.getConstructOrientationForward() is deprecated, use construct.getOrientationForward() instead.
    function self.getConstructOrientationForward() error("CoreUnit.getConstructOrientationForward() is deprecated, use construct.getOrientationForward() instead.") end
    ---@deprecated CoreUnit.getConstructWorldOrientationUp() is deprecated, use construct.getWorldOrientationUp() instead.
    function self.getConstructWorldOrientationUp() error("CoreUnit.getConstructWorldOrientationUp() is deprecated, use construct.getWorldOrientationUp() instead.") end
    ---@deprecated CoreUnit.getConstructWorldOrientationRight() is deprecated, use construct.getWorldOrientationRight() instead.
    function self.getConstructWorldOrientationRight() error("CoreUnit.getConstructWorldOrientationRight() is deprecated, use construct.getWorldOrientationRight() instead.") end
    ---@deprecated CoreUnit.getConstructWorldOrientationForward() is deprecated, use construct.getWorldOrientationForward() instead.
    function self.getConstructWorldOrientationForward() error("CoreUnit.getConstructWorldOrientationForward() is deprecated, use construct.getWorldOrientationForward() instead.") end
    ---@deprecated CoreUnit.getConstructWorldUp() is deprecated, use construct.getWorldUp() instead.
    function self.getConstructWorldUp() error("CoreUnit.getConstructWorldUp() is deprecated, use construct.getWorldUp() instead.") end
    ---@deprecated CoreUnit.getConstructWorldRight() is deprecated, use construct.getWorldRight() instead.
    function self.getConstructWorldRight() error("CoreUnit.getConstructWorldRight() is deprecated, use construct.getWorldRight() instead.") end
    ---@deprecated CoreUnit.getConstructWorldForward() is deprecated, use construct.getWorldForward() instead.
    function self.getConstructWorldForward() error("CoreUnit.getConstructWorldForward() is deprecated, use construct.getWorldForward() instead.") end
    ---@deprecated CoreUnit.getPvPTimer() is deprecated, use construct.getPvPTimer() instead.
    function self.getPvPTimer() error("CoreUnit.getPvPTimer() is deprecated, use construct.getPvPTimer() instead.") end
    ---@deprecated CoreUnit.getPlayersOnBoard() is deprecated, use construct.getPlayersOnBoard() instead.
    function self.getPlayersOnBoard() error("CoreUnit.getPlayersOnBoard() is deprecated, use construct.getPlayersOnBoard() instead.") end
    ---@deprecated CoreUnit.getPlayersOnBoardInVRStation() is deprecated, use construct.getPlayersOnBoardInVRStation() instead.
    function self.getPlayersOnBoardInVRStation() error("CoreUnit.getPlayersOnBoardInVRStation() is deprecated, use construct.getPlayersOnBoardInVRStation() instead.") end
    ---@deprecated CoreUnit.getDockedConstructs() is deprecated, use construct.getDockedConstructs() instead.
    function self.getDockedConstructs() error("CoreUnit.getDockedConstructs() is deprecated, use construct.getDockedConstructs() instead.") end
    ---@deprecated CoreUnit.isPlayerBoarded(pid) is deprecated, use construct.isPlayerBoarded(id) instead.
    function self.isPlayerBoarded(pid) error("CoreUnit.isPlayerBoarded() is deprecated, use construct.isPlayerBoarded(id) instead.") end
    ---@deprecated CoreUnit.isPlayerBoardedInVRStation(pid) is deprecated, use construct.isPlayerBoardedInVRStation(id) instead.
    function self.isPlayerBoardedInVRStation(pid) error("CoreUnit.isPlayerBoardedInVRStation(pid) is deprecated, use construct.isPlayerBoardedInVRStation(id) instead.") end
    ---@deprecated CoreUnit.isConstructDocked(cid) is deprecated, use construct.isConstructDocked(id) instead.
    function self.isConstructDocked(cid) error("CoreUnit.isConstructDocked(cid) is deprecated, use construct.isConstructDocked(id) instead.") end
    ---@deprecated CoreUnit.forceDeboard(pid) is deprecated, use construct.forceDeboard(id) instead.
    function self.forceDeboard(pid) error("CoreUnit.forceDeboard(pid) is deprecated, use construct.forceDeboard(id) instead.") end
    ---@deprecated CoreUnit.forceInterruptVRSession(pid) is deprecated, use construct.forceInterruptVRSession(id) instead.
    function self.forceInterruptVRSession(pid) error("CoreUnit.forceInterruptVRSession(pid) is deprecated, use construct.forceInterruptVRSession(id) instead.") end
    ---@deprecated CoreUnit.forceUndock(cid) is deprecated, use construct.forceUndock(id) instead.
    function self.forceUndock(cid) error("CoreUnit.forceUndock(cid) is deprecated, use construct.forceUndock(id) instead.") end
    ---@deprecated CoreUnit.getBoardedPlayerMass(pid) is deprecated, use construct.getBoardedPlayerMass(id) instead.
    function self.getBoardedPlayerMass(pid) error("CoreUnit.getBoardedPlayerMass(pid) is deprecated, use construct.getBoardedPlayerMass(id) instead.") end
    ---@deprecated CoreUnit.getBoardedInVRStationAvatarMass(pid) is deprecated, use construct.getId() instead.
    function self.getBoardedInVRStationAvatarMass(pid) error("CoreUnit.getBoardedInVRStationAvatarMass(pid) is deprecated, use construct.getId() instead.") end
    ---@deprecated CoreUnit.getDockedConstructMass(cid) is deprecated, use construct.getDockedConstructMass(id) instead.
    function self.getDockedConstructMass(cid) error("CoreUnit.getDockedConstructMass(cid) is deprecated, use construct.getDockedConstructMass(id) instead.") end
    ---@deprecated CoreUnit.getParent() is deprecated, use construct.getParent() instead.
    function self.getParent() error("CoreUnit.getParent() is deprecated, use construct.getParent() instead.") end
    ---@deprecated CoreUnit.getCloseParents() is deprecated, use construct.getCloseParents() instead.
    function self.getCloseParents() error("CoreUnit.getCloseParents() is deprecated, use construct.getCloseParents() instead.") end
    ---@deprecated CoreUnit.getClosestParent() is deprecated, use construct.getClosestParent() instead.
    function self.getClosestParent() error("CoreUnit.getClosestParent() is deprecated, use construct.getClosestParent() instead.") end
    ---@deprecated CoreUnit.dock(cid) is deprecated, use construct.dock(id) instead.
    function self.dock(cid) error("CoreUnit.dock(cid) is deprecated, use construct.dock(id) instead.") end
    ---@deprecated CoreUnit.undock() is deprecated, use construct.undock() instead.
    function self.undock() error("CoreUnit.undock() is deprecated, use construct.undock() instead.") end
    ---@deprecated CoreUnit.setDockingMode(mode) is deprecated, use construct.setDockingMode(mode) instead.
    function self.setDockingMode(mode) error("CoreUnit.setDockingMode(mode) is deprecated, use construct.setDockingMode(mode) instead.") end
    ---@deprecated CoreUnit.getDockingMode() is deprecated, use construct.getDockingMode() instead.
    function self.getDockingMode() error("CoreUnit.getDockingMode() is deprecated, use construct.getDockingMode() instead.") end
    ---@deprecated CoreUnit.getParentPosition() is deprecated, use construct.getParentPosition() instead.
    function self.getParentPosition() error("CoreUnit.getParentPosition() is deprecated, use construct.getParentPosition() instead.") end
    ---@deprecated CoreUnit.getParentWorldPosition() is deprecated, use construct.getParentWorldPosition() instead.
    function self.getParentWorldPosition() error("CoreUnit.getParentWorldPosition() is deprecated, use construct.getParentWorldPosition() instead.") end
    ---@deprecated CoreUnit.getParentForward() is deprecated, use construct.getParentForward() instead.
    function self.getParentForward() error("CoreUnit.getParentForward() is deprecated, use construct.getParentForward() instead.") end
    ---@deprecated CoreUnit.getParentUp() is deprecated, use construct.getParentUp() instead.
    function self.getParentUp() error("CoreUnit.getParentUp() is deprecated, use construct.getParentUp() instead.") end
    ---@deprecated CoreUnit.getParentRight() is deprecated, use construct.getParentRight() instead.
    function self.getParentRight() error("CoreUnit.getParentRight() is deprecated, use construct.getParentRight() instead.") end
    ---@deprecated CoreUnit.getParentWorldForward() is deprecated, use construct.getParentWorldForward() instead.
    function self.getParentWorldForward() error("CoreUnit.getParentWorldForward() is deprecated, use construct.getParentWorldForward() instead.") end
    ---@deprecated CoreUnit.getParentWorldUp() is deprecated, use construct.getParentWorldUp() instead.
    function self.getParentWorldUp() error("CoreUnit.getParentWorldUp() is deprecated, use construct.getParentWorldUp() instead.") end
    ---@deprecated CoreUnit.getParentWorldRight() is deprecated, use construct.getParentWorldRight() instead.
    function self.getParentWorldRight() error("CoreUnit.getParentWorldRight() is deprecated, use construct.getParentWorldRight() instead.") end
    ---@deprecated CoreUnit.getMaxSpeed() is deprecated, use construct.getMaxSpeed() instead.
    function self.getMaxSpeed() error("CoreUnit.getMaxSpeed() is deprecated, use construct.getMaxSpeed() instead.") end
    ---@deprecated CoreUnit.getMaxAngularSpeed() is deprecated, use construct.getMaxAngularSpeed() instead.
    function self.getMaxAngularSpeed() error("CoreUnit.getMaxAngularSpeed() is deprecated, use construct.getMaxAngularSpeed() instead.") end
    ---@deprecated CoreUnit.getMaxSpeedPerAxis() is deprecated, use construct.getMaxSpeedPerAxis() instead.
    function self.getMaxSpeedPerAxis() error("CoreUnit.getMaxSpeedPerAxis() is deprecated, use construct.getMaxSpeedPerAxis() instead.") end

    ---@deprecated CoreUnit.getConstructMass() is deprecated, use construct.getMass() instead.
    function self.getConstructMass() error("CoreUnit.getConstructMass() is deprecated, use construct.getMass() instead.") end
    ---@deprecated CoreUnit.getConstructIMass() is deprecated, use construct.getInertialMass() instead.
    function self.getConstructIMass() error("CoreUnit.getConstructIMass() is deprecated, use construct.getInertialMass() instead.") end
    ---@deprecated CoreUnit.getConstructCrossSection() is deprecated, use construct.getCrossSection() instead.
    function self.getConstructCrossSection() error("CoreUnit.getConstructCrossSection() is deprecated, use construct.getCrossSection() instead.") end
    ---@deprecated CoreUnit.getMaxKinematicsParametersAlongAxis(taglist, CRefAxis) is deprecated, use construct.getMaxThrustAlongAxis(taglist, CRefAxis) instead.
    function self.getMaxKinematicsParametersAlongAxis(taglist, CRefAxis) error("CoreUnit.getMaxKinematicsParametersAlongAxis(taglist, CRefAxis) is deprecated, use construct.getMaxThrustAlongAxis(taglist, CRefAxis) instead.") end


    --- Returns the list of all the local IDs of the Elements of this construct
    ---@return table value The list of local IDs of the elements of the construct.
    function self.getElementIdList() end

    --- Returns the name of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return string value The name of the Element
    function self.getElementNameById(localId) end

    --- Returns the class of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return string value The class of the Element
    function self.getElementClassById(localId) end

    --- Returns the item id of the class of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return integer value The item ID of the item class
    function self.getElementClassIdById(localId) end

    --- Returns the display name of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return string value The display name of the Element
    function self.getElementDisplayNameById(localId) end
    ---@deprecated CoreUnit.getElementTypeById(localId) is deprecated, use CoreUnit.getElementDisplayNameById(localId) instead.
    function self.getElementTypeById(localId) error("CoreUnit.getElementTypeById(localId) is deprecated, use CoreUnit.getElementDisplayNameById(localId) instead.") end

    --- Returns the item ID of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return integer value The item ID of the Element
    function self.getElementItemIdById(localId) end

    --- Returns the current hitpoints of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return number value The current hitpoints of the Element
    function self.getElementHitPointsById(localId) end

    --- Returns the maximum hitpoints of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return number value 
    function self.getElementMaxHitPointsById(localId) end

    --- Returns the remaining restorations of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return integer value The restorations remaining for the Element
    function self.getElementRestorationsById(localId) end
    
    --- Returns the maximum restorations of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return integer value The max restorations for the Element
    function self.getElementMaxRestorationsById(localId) end

    --- Returns the mass of the Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return number value The maximum hitpoints of the Element
    function self.getElementMassById(localId) end

    --- Returns the position of the Element, identified by its local ID, in construct local coordinates.
    ---@param localId integer The local ID of the Element
    ---@return table value  The position of the Element in construct local coordinates
    function self.getElementPositionById(localId) end

    --- Returns the up direction vector of the Element, identified by its local ID, in construct local coordinates
    ---@param localId integer The local ID of the Element
    ---@return table value The up direction vector of the Element identified by its local ID, in construct local coordinates
    function self.getElementUpById(localId) end

    --- Returns the right direction vector of the Element, identified by its local ID, in construct local coordinates
    ---@param localId integer The local ID of the Element
    ---@return table value The right direction vector of the Element identified by its local ID, in construct local coordinates
    function self.getElementRightById(localId) end

    --- Returns the forward direction vector of the Element, identified by its local ID, in construct local coordinates
    ---@param localId integer The local ID of the Element
    ---@return table value The forward direction vector of the Element identified by its local ID, in construct local coordinates
    function self.getElementForwardById(localId) end

    --- Returns the status of the Industry Unit Element, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return table info If the Element is an Industry Unit, a table with fields {[int] state, [bool] stopRequested, [int] schematicId (deprecated = 0), [int] schematicsRemaining (deprecated = 0), [table] requiredSchematicIds {[int] id}, [int] requiredSchematicAmount, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount, [table] currentProducts:{{[int] id, [double] quantity},...}}
    function self.getElementIndustryInfoById(localId) end
    ---@deprecated CoreUnit.getElementIndustryStatusById(localId) is deprecated, use CoreUnit.getElementIndustryInfoById(localId) instead.
    function self.getElementIndustryStatusById(localId) error("CoreUnit.getElementIndustryStatusById(localId) is deprecated, use CoreUnit.getElementIndustryInfoById(localId) instead.") end


    --- Returns the Element IN plug map, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return table plugMap The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
    function self.getElementInPlugsById(localId) end

    --- Returns the Element OUT plug map, identified by its local ID
    ---@param localId integer The local ID of the Element
    ---@return table plugMap The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
    function self.getElementOutPlugsById(localId) end


    --- Returns the list of engine tags for an Engine Element identified by its local ID
    ---@param localId integer The local ID of the engine
    ---@return string value The CSV string of the tags
    function self.getEngineTagsById(localId) end
    ---@deprecated CoreUnit.getElementTagsById(localId) is deprecated, use CoreUnit.getEngineTagsById(localId) instead.
    function self.getElementTagsById(localId) error("CoreUnit.getElementTagsById(localId) is deprecated, use CoreUnit.getEngineTagsById(localId) instead.") end

    --- Sets the list of engine tags for an Engine Element, identified by its local ID
    ---@param localId integer The local ID of the engine
    ---@param tags string The CSV string of the tags
    ---@param ignore boolean (optional) True to ignore the default engine tags
    ---@return boolean value True if the tags have been applied, false if they have not
    function self.setEngineTagsById(localId,tags,ignore) end

    --- Sets the torque generation state for the Engine Element, identified by its local ID
    ---@param localId integer The local ID of the engine
    ---@param state boolean True to enable engine torque
    function self.setEngineTorqueById(localId,state) end

    --- Returns the torque generation state for the Engine Element, identified by its local ID
    ---@param localId integer The local ID of the engine
    ---@return boolean value True if the torque generation is enabled, false if it is not
    function self.getEngineTorqueById(localId) end

    --- Checks if the engine element is ignoring default tags, identified by its local ID
    ---@param localId integer The local ID of the engine
    ---@return boolean value True if the engine ignores default engine tags, false if not
    function self.isEngineIgnoringTagsById(localId) end


    --- Returns the altitude above sea level, with respect to the closest planet (0 in space)
    ---@return number value The altitude above sea level in meters
    function self.getAltitude() end

    --- Returns the local gravity intensity
    ---@return number value The gravitation acceleration where the construct is located in m/s²
    function self.getGravityIntensity() end
    ---@deprecated CoreUnit.g() is deprecated, use CoreUnit.getGravityIntensity() instead.
    function self.g() error("CoreUnit.g() is deprecated, use CoreUnit.getGravityIntensity() instead.") end

    --- Returns the local gravity vector in world coordinates
    ---@return table value The local gravity field vector in world coordinates in m/s2
    function self.getWorldGravity() end

    --- Returns the gravity unit vector, in world coordinates ({0,0,0} in space)
    ---@return table value The local gravity unit vector in world coordinates in meters
    function self.getWorldVertical() end

    --- Returns the id of the current close stellar body
    ---@return integer value The id of the current close stellar body
    function self.getCurrentPlanetId() end


    --- Returns the core's current stress, destroyed when reaching max stress
    ---@return number value The stress the core absorbed
    function self.getCoreStress() end

    --- Returns the maximal stress the core can bear before it gets destroyed
    ---@return number value The maximal stress before destruction
    function self.getMaxCoreStress() end

    --- Returns the core's current stress to max stress ratio
    ---@return number value The stress ratio, between 0 for no stress and 1 for destruction
    function self.getCoreStressRatio() end

    --- Emitted when core unit stress changed
    ---@param stress number Difference to previous stress value
    self.onStressChanged = Event:new()
    self.stressChanged = Event:new()
    self.stressChanged:addAction(function(self) error("CoreUnit.stressChanged event is deprecated, use CoreUnit.onStressChanged instead.") end, true, 1)


    --- Emitted when an Element is broken
    ---@param localId integer The local ID of the Element
    ---@param restorations integer The restorations remaining for the Element
    self.onElementBroken = Event:new()

    --- Emitted when an Element is restored
    ---@param localId integer The local ID of the Element
    ---@param restorations integer The restorations remaining for the Element
    self.onElementRestored = Event:new()

    --- Emitted when an Element is damaged
    ---@param localId integer The local ID of the Element
    ---@param hitpoints integer The amount of hitpoints taken in damage
    self.onElementDamaged = Event:new()

    --- Emitted when an Element is repaired
    ---@param localId integer The local ID of the Element
    ---@param hitpoints integer The amount of hitpoints repaired
    self.onElementRepaired = Event:new()


    --- Spawns a number sticker in the 3D world, with coordinates relative to the construct
    ---@param nb integer The number to display 0 to 9
    ---@param x number The x-coordinate in the construct in meters. 0 = center
    ---@param y number The y-coordinate in the construct in meters. 0 = center
    ---@param z number The z-coordinate in the construct in meters. 0 = center
    ---@param orientation string Orientation of the number. Possible values are "front", "side"
    ---@return integer index An index that can be used later to delete or move the item, -1 if error or maxnumber reached
    function self.spawnNumberSticker(nb,x,y,z,orientation) end

    --- Spawns an arrow sticker in the 3D world, with coordinates relative to the construct
    ---@param x number The x-coordinate in the construct in meters. 0 = center
    ---@param y number the y-coordinate in the construct in meters. 0 = center
    ---@param z number The z-coordinate in the construct in meters. 0 = center
    ---@param orientation string Orientation of the arrow. Possible values are "up", "down", "north", "south", "east", "west"
    ---@return integer index An index that can be used later to delete or move the item, -1 if error or max number reached
    function self.spawnArrowSticker(x,y,z,orientation) end

    --- Delete the referenced sticker
    ---@param index integer Index of the sticker to delete
    ---@return boolean success True if the sticker has been successfuly deleted, false otherwise
    function self.deleteSticker(index) end

    --- Move the referenced sticker
    ---@param index integer Index of the sticker to move
    ---@param x number The x-coordinate in the construct in meters. 0 = center
    ---@param y number The y-coordinate in the construct in meters. 0 = center
    ---@param z number The z-coordinate in the construct in meters. 0 = center
    ---@return boolean success True if the sticker has been successfuly moved, false otherwise
    function self.moveSticker(index,x,y,z) end
    
    --- Rotate the referenced sticker.
    ---@param index integer Index of the sticker to rotate
    ---@param angle_x number Rotation along the x-axis in degrees
    ---@param angle_y number Rotation along the y-axis in degrees
    ---@param angle_z number Rotation along the z-axis in degrees
    ---@return boolean success True if the sticker has been successfuly rotated, false otherwise
    function self.rotateSticker(index,angle_x,angle_y,angle_z) end


    return setmetatable(self, coreUnit)
end

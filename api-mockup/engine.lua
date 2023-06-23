-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Engines
-----------------------------------------------------------------------------------

require("element")

---@class Engine
engine = {}
engine.__index = engine
function Engine()
    local self = Element()

    --- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
    --- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
    ---@return number value The obstruction ratio of the engine
    function self.getObstructionFactor() end

    --- Returns the tags of the engine
    ---@return string value Tags of the engine, in a CSV string
    function self.getTags() end
    
    --- Set the tags of the engine
    ---@param tags string The CSV string of the tags
    ---@param ignore boolean True to ignore the default engine tags
    ---@return boolean success True if the tags have been applied, false if they have not
    function self.setTags(tags,ignore) end
    
    --- Checks if the engine is ignoring default tags
    ---@return boolean value True if the engine ignores default engine tags, false if not
    function self.isIgnoringTags() end

    return setmetatable(self, engine)
end
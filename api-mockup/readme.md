# Lua API Mockup
This mockup represents the Lua API in the Dual Universe game, it is public and free to use.
It is intended to help players developing in Lua in the game.

# Change Log
All notable changes to this mockup will be documented in this file.
 
## [1.4.0] - 2022-06-20

### Changed
 * Replaced dkjson Lua library by json.lua library to improve JSON encoding and decoding performances.
 * Fixed the problem of boolean type support in Lua. Now functions will return real booleans and accept real booleans as arguments (integers will still be functional as arguments).
 * Updated Lua environment to 5.4.4. Lua changelog:
   * new generational mode for garbage collection
   * new attributes for variables (const and to-be-closed)
   * new implementation for math.random
   * new semantics for the integer 'for' loop
   * optional 'init' argument to 'string.gmatch'
   * new function 'coroutine.close'
   * string-to-number coercions moved to the string library
   * new format '%p' in 'string.format'
 * Aligned controllers's Lua instruction limit on Lua screens instruction limit ; 2 000 000 -> 10 000 000.
 * Deprecated (but still populated) constructType that was not consistent with the current radar API in the radar construct result of the Lua function getConstructs of the Radar API.
 * Updated Flight configuration for Lua changes in version 1.4 (no gameplay changes).
 * Updated Lua atlas.

### Added
 * Added new events to the CoreUnit API to monitor element damage:
   * onElementBroken([int] localId, [int] restorations)
   * onElementRestored([int] localId, [int] restorations)
   * onElementDamaged([int] localId, [int] hitpoints)
   * onElementRepaired([int] localId, [int] hitpoints)
 * Added two new Lua function on the Core Unit API to monitoring restorations of an element with its local id
   * [int] getElementRestorationsById([int] localId): Returns the remaining restorations of the Element, identified by its local ID
   * [int] getElementMaxRestorationsById([int] localId): Returns the maximum restorations of the Element, identified by its local ID
 * Added new functions to the CoreUnit API to improve the engines control for flight systems :
   * getElementTagsById -> [string] getEngineTagsById([int] localId): Returns the list of engine tags for an Engine Element, identified by its local ID
   * [bool] setEngineTagsById([int] localId, [string] tags, [bool] ignore): Sets the list of engine tags for an Engine Element, identified by its local ID
   * setEngineTorqueById([int] localId, [bool] state): Sets the torque generation state for the Engine Element, identified by its local ID
   * [bool] getEngineTorqueById([int] localId): Returns the torque generation state for the Engine Element, identified by its local ID
 * Added getTotalMass function to the Construct API. Returns the total mass of the construct (voxels, elements, avatars and docked constructs).
 * Added a return boolean to all engine type elements setTags Lua function.
 * Added optional querying options to the radar.getConstructs function, the following filters can be used (all optional and combinable) :
   * [bool] isMatching : True to filter out constructs with a matching transponder, false otherwise
   * [int] constructKind : The construct kind id to filter out constructs (Universe = 1,Planet = 2,Asteroid = 3,Static = 4,Dynamic = 5,Space = 6,Alien = 7)
   * [string] coreSize : The construct core unit size to filter out constructs ('XS', 'S', 'M', 'L', 'XL')
   * [bool] isAbandoned : True to filter out abandoned constructs, false otherwise
 * Added the constructKind and hasMatchingTransponder fields on the radar construct result of the Lua function getConstructs of the Radar API.
 * Added new events to the CoreUnit API to monitor element damage:
   * [int] getInstructionCount(): Returns the current instruction count during this tick
   * [int] getInstructionLimit(): Returns the instruction limit before the CPU overload
 * Improved syntax coloring:
  * Added unit, system, construct, player, library and renderscript coloring entries.
  * Added operators and constants coloring.
  * Added a "usage" section in CODEX to provide more in-depth explanations of functions and events, as well as code examples.
 * Added three new Lua functions on the Core Unit API to allow to map elements plugs:
  * [int] getElementClassIdById([int] localId): Returns the item id of the class of the Element, identified by its local ID
  * [table] getElementInPlugsById([int] localId): Returns the Element IN plug map, identified by its local ID
  * [table] getElementOutPlugsById([int] localId): Returns the Element OUT plug map, identified by its local ID
 * Added three new Lua function on the generic element API:
  * [bool] isInClassId([int] classId): Checks if the element is an element of the class given by its item id
  * [bool] isInClass([string] className): Checks if the element is an element of the class given by its class name
  * [int] getClassId(): Returns the item id of the class of the Element
 * Added three new Lua functions on the Core Unit API:
  * [int] getElementClassIdById([int] localId): Returns the item id of the class of the Element, identified by its local ID
  * [table] getElementInPlugsById([int] localId): Returns the Element IN plug map, identified by its local ID
  * [table] getElementOutPlugsById([int] localId): Returns the Element OUT plug map, identified by its local ID
 * Added 12 new Lua functions on the System API:
  * [bool] isItemInClassId([int] itemId, [int] classId): Checks if the item is an item of the class identified by its item id
  * [bool] isItemInClass([int] itemId, [string] className): Checks if the given item is an item of the class given by its class name
  * [bool] isClassItem([int] itemId): Checks if the given item is a class item
  * [bool] isElementItem([int] itemId): Checks if the given item is an element
  * [bool] isMaterialItem([int] itemId): Checks if the given item is a material
  * [bool] isRawMaterialItem([int] itemId): Checks if the given item is a raw material
  * [bool] isBlueprintItem([int] itemId): Checks if the given item is a blueprint
  * [bool] isScrapItem([int] itemId): Checks if the given item is a scrap item
  * [bool] isPartItem([int] itemId): Checks if the given item is a part
  * [bool] isAmmoItem([int] itemId): Checks if the given item is an ammo item
  * [bool] isPackageItem([int] itemId): Checks if the given item is a package
  * [bool] isSchematicItem([int] itemId): Checks if the given item is a schematic
 * Added three new fields on the Item table returned by getItem function in System API ([int] classId, [int] displayClassId, [table] childsId).
 * Added a global debugging function getParams to help debugging scripts or to facilitate the development of the module API in the game.


## [1.0.0] - 2022-09-27
 
The Lua API of the Radar units have been updated to increase performances and provide a filter method.
 
### Added
 * We have improved performance when displaying many targets and radar widget performances, We have also added new Lua functions allowing for the retrieval of set portions of the radar results and to change radar data sort which are also applied to the widget.
   * [table] **getConstructs(**[int] **offset,** [int] **size)**: Returns the list of constructs in a given range according to the current sort method.
   * [int] **getSortMethod()**: Gets the sort method for construct data.
   * [0 or 1] **setSortMethod(**[int] **method)**: Sets the sort method for construct data.

### Changed on API mockup
 * Fixed bad global assignments on Player, System and Construct
 * Fixed compilation error on metatable assignment
 * Added renderScript Lua API


## [0.31.1] - 2022-07-26
 
The Lua API for industries has been reworked to integrate schematics v2.
 
### Added
 * Added new industry Lua API:
   * **setOutput(**[int] **itemId)** : Set the item to produce from its id.
   * [table] **getOutputs()** : Returns the id list of items currently produced, the first entry in the table is always the main product.
   * [table] **getInputs()** : Returns the id list of items required to run the current production.
   * [table] **getInfo()** : The complete state of the industry (the schematicsRemaining and currentProducts fields have been added).
   * [float] **updateBank()** : Send a request to get an update of the content of the schematic bank, limited to one request allowed per 30 seconds.
   * [table] **getBank()** : Returns a table describing the content of the schematic bank, as a pair item id and quantity per slot.
   * [event] **onBankUpdate()** : Emitted when the schematic bank is updated.

 * Added new system Lua API:
   * [table] **getRecipes(**[int] **itemId)** : Returns a list of recipes producing the given item from its id.
 
### Changed
 * Changed existing industry Lua API:
   * Deprecated `getCurrentSchematic` function.
   * Deprecated `setCurrentSchematic` function.
   
 * Changed existing system Lua API:
   * [table] **system.getItem(**[int] **itemId)** : Added two new fields ; `products` to list product item ids if the item is a schematic and `schematics` to list item ids of schematics producing this item.
   * Deprecated getSchematic function.
   
 * Changed existing core unit Lua API:
   * [table] **core.getElementIndustryInfoById(**[int] **localId)** : Description update (always returns the getInfo from the industry Lua API).

#### Fixes on the API mockup
 * Added missing system.print() function.
 * Fixed incorrect documentation type for core.getIndustryInfoById().state, was int instead of string.

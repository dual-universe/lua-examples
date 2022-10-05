-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- RenderScript
--
-- The following built-in functions are available for use in render scripts.
-- Along with these API functions, RenderScript also supports most native Lua functions, except for those
-- that pose a security risk
-----------------------------------------------------------------------------------

---@alias ShapeType integer
Shape_Bezier = 0
Shape_Box = 1
Shape_BoxRounded = 2
Shape_Circle = 3
Shape_Image = 4
Shape_Line = 5
Shape_Polygon = 6
Shape_Text = 7

---@alias AlignH integer
AlignH_Left = 0
AlignH_Center = 1
AlignH_Right = 2

---@alias AlignV integer
AlignV_Ascender = 0
AlignV_Top = 1
AlignV_Middle = 2
AlignV_Baseline = 3
AlignV_Bottom = 4
AlignV_Descender = 5


---@class RenderScript
screenRenderScript = {}
screenRenderScript.__index = screenRenderScript
function ScreenRenderScript()
    local self = {}

    --- Add a quadratic bezier curve to the given layer.
    --- Supported properties: shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param x1 number X coordinate of the first point of the curve (the starting point)
    ---@param y1 number Y coordinate of the first point of the curve (the starting point)
    ---@param x2 number X coordinate of the second point of the curve (the control point)
    ---@param y2 number Y coordinate of the second point of the curve (the control point)
    ---@param x3 number X coordinate of the third point of the curve (the ending point)
    ---@param y3 number Y coordinate of the third point of the curve (the ending point)
    function self.addBezier( layer, x1, y1, x2, y2, x3, y3) end

    --- Add a box to the given layer.
    --- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param x number X coordinate of the box's top-left corner
    ---@param y number Y coordinate of the box's top-left corner
    ---@param sx number Width of the box
    ---@param sy number Height of the box
    function self.addBox(layer, x, y, sx, sy) end

    --- Add a rounded box to the given layer.
    --- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param x number X coordinate of the box's top-left corner
    ---@param y number Y coordinate of the box's top-left corner
    ---@param sx number Width of the box
    ---@param sy number Height of the box
    ---@param r number Rounding radius of the box
    function self.addBoxRounded(layer, x, y, sx, sy, r) end

    --- Add a circle to the given layer.
    --- Supported properties: fillColor, shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param x number X coordinate of the circle's center
    ---@param y number Y coordinate of the circle's center
    ---@param r number Radius of the circle
    function self.addCircle(layer, x, y, r) end

    --- Add an image to the given layer.
    --- Supported properties: fillColor, rotation
    ---@param layer integer The id of the layer to which to add
    ---@param image integer The id of the image to add
    ---@param x number X coordinate of the image's top-left corner
    ---@param y number Y coordinate of the image's top-left corner
    ---@param sx number Width of the image
    ---@param sy number Height of the image
    function self.addImage(layer, image, x, y, sx, sy) end

    --- Add a sub-region of an image to the given layer.
    --- Supported properties: fillColor, rotation
    ---@param layer integer The id of the layer to which to add
    ---@param image integer The id of the image to add
    ---@param x number X coordinate of the image's top-left corner
    ---@param y number Y coordinate of the image's top-left corner
    ---@param sx number Width of the image
    ---@param sy number Height of the image
    ---@param subX number X coordinate of the top-left corner of the sub-region to draw
    ---@param subY number Y coordinate of the top-left corner of the sub-region to draw
    ---@param subSx number Width of the sub-region within the image to draw
    ---@param subSy number Height of the sub-region within the image to draw
    function self.addImageSub(layer, image, x, y, sx, sy, subX, subY, subSx, subSy) end

    --- Add a line to the given layer.
    --- Supported properties: rotation, shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param x1 number X coordinate of the start of the line
    ---@param y1 number Y coordinate of the start of the line
    ---@param x2 number X coordinate of the end of the line
    ---@param y2 number Y coordinate of the end of the line
    function self.addLine(layer, x1, y1, x2, y2) end

    --- Add a quadrilateral to the given layer.
    --- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param x1 number X coordinate of the first point of the quad
    ---@param y1 number Y coordinate of the first point of the quad
    ---@param x2 number X coordinate of the second point of the quad
    ---@param y2 number Y coordinate of the second point of the quad
    ---@param x3 number X coordinate of the third point of the quad
    ---@param y3 number Y coordinate of the third point of the quad
    ---@param x4 number X coordinate of the fourth point of the quad
    ---@param y4 number Y coordinate of the fourth point of the quad
    function self.addQuad(layer, x1, y1, x2, y2, x3, y3, x4, y4) end

    --- Add a string of text to the given layer.
    --- See setNextTextAlign for information on controlling text anchoring.
    --- Supported properties: fillColor, shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param font integer The id of the font to use
    ---@param text string The string of text to be added
    ---@param x number X coordinate of the text anchor
    ---@param y number Y coordinate of the text anchor
    function self.addText(layer, font, text, x, y) end

    --- Add a triangle to the given layer.
    --- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
    ---@param layer integer The id of the layer to which to add
    ---@param x1 number X coordinate of the first point of the triangle
    ---@param y1 number Y coordinate of the first point of the triangle
    ---@param x2 number X coordinate of the second point of the triangle
    ---@param y2 number Y coordinate of the second point of the triangle
    ---@param x3 number X coordinate of the third point of the triangle
    ---@param y3 number Y coordinate of the third point of the triangle
    function self.addTriangle(layer, x1, y1, x2, y2, x3, y3) end

    --- Create a new layer that will be rendered on top of all previously-created layers
    ---@return integer index The id that can be used to uniquely identify the layer for use with other API functions
    function self.createLayer() end

    --- Return the number of fonts available to be used by render script
    ---@return integer value The total number of fonts available
    function self.getAvailableFontCount() end

    --- Return the name of the nth available font
    ---@param index integer A number between 1 and the return value of getAvailableFontCount
    ---@return string value The name of the font, which can be used with the loadFont function
    function self.getAvailableFontName(index) end

    --- Return the screen location that is currently raycasted by the player
    ---@return number x, number y A tuple containing the (x, y) coordinates of the cursor, or (-1, -1) if the screen is not currently raycasted
    function self.getCursor() end

    --- Return the status of the mouse button
    ---@return boolean value True if the mouse cursor is currently pressed down on the screen, false otherwise
    function self.getCursorDown() end

    --- Return the status of the mouse button
    ---@return boolean value True if the mouse cursor has been pressed down on the screen at any time since the last script execution, false otherwise
    function self.getCursorPressed() end

    --- Return the status of the mouse button
    ---@return boolean value True if the mouse cursor has been released on the screen at any time since the last script execution, false otherwise
    function self.getCursorReleased() end

    --- Return the time, in seconds, since the screen was last updated.
    --- Useful for creating timing-based animations. Since screens are not guaranteed to be updated at any specific
    --- time interval it is more reliable to update animations based on this timer than based on a frame counter.
    ---@return number value Time, in seconds, since the last screen update
    function self.getDeltaTime() end

    --- Return informational metrics of a font
    --- Can be used for advanced text layout, although setNextTextAlign is all that is needed in most use cases.
    ---@param font integer The font to query
    ---@return number ascender, number descender A tuple containing the maximal ascender and descender, respectively, of the given font
    function self.getFontMetrics(font) end

    --- Return the currently-set size for the given font
    ---@param font integer The font to query
    ---@return number value The font size in vertical pixels
    function self.getFontSize(font) end

    --- Return the width and height of an image.
    ---@param image integer The image to query
    ---@return number width, number height A tuple containing the width and height, respectively, of the image, or (0, 0) if the image is not yet loaded
    function self.getImageSize(image) end

    --- Return the screen's current input string
    ---@return string value The input string, as set by the screen unit API function setScriptInput, or an empty string if there is no current input
    function self.getInput() end

    --- Return the locale in which the game is currently running
    ---@return string value The locale, currently one of "en-US", "fr-FR", or "de-DE"
    function self.getLocale() end

    --- Return the current render cost of the script
    ---@return number value The cost of all rendering operations performed by the render script so far (at the time of the call to this function)
    function self.getRenderCost() end

    --- Return the current render cost limit
    ---@return number value The render cost limit. A script that exceeds this limit (in one execution) will not render correctly and will instead throw an error. Note that this value may change between version releases
    function self.getRenderCostMax() end

    --- Return the screen's current resolution.
    --- Ideally, your render scripts should be written to adapt to the resolution, as it may change in the future
    ---@return integer width, integer height A tuple containing the (width, height) of the screen's render surface, in pixels
    function self.getResolution() end

    --- Compute and return the bounding box of a text string rendered with a specific font
    ---@param font integer The font with which to render
    ---@param text string The text string to render
    ---@return number width, number height A tuple containing the width and height, respectively, of the bounding box
    function self.getTextBounds(font, text) end

    --- Return the time, in seconds, relative to the first execution
    ---@return number value Time, in seconds, since the render script started running
    function self.getTime() end

    --- Return the load status of an image.
    --- Note that render scripts will still render even when not all images are loaded (the call to addImage will
    --- silently fail). You can use this function to do something else instead, such as draw a placeholder or
    --- loading bar while images load
    ---@param image integer The image to query
    ---@return boolean value True if the image is fully loaded and ready to use, false otherwise
    function self.isImageLoaded(image) end

    --- Load an image to be used with addImage from the given URL
    ---@param url string The URL of the image to be loaded; Novaquark CDN restrictions apply as usual
    ---@return integer value The id that can be used to uniquely identify the image for use with other API functions
    function self.loadImage(url) end

    --- Load a font to be used with addText
    ---@param name string The name of the font to load; see the font list section for available font names
    ---@param size integer The size, in vertical pixels, at which the font will render. Note that this size can be changed during script execution with the setFontSize function
    ---@return integer value The id that can be used to uniquely identify the font for use with other API functions
    function self.loadFont(name, size) end

    --- Log a message for debugging purposes. If the "enable output in Lua channel" box is
    --- checked on the editor panel for the given screen, the message will be displayed in the Lua channel,
    --- otherwise, this function does nothing. The checkbox is off by default, so you must explicitly enable this on
    --- a screen to see debug output
    ---@param message string The message to log, as a string
    function self.logMessage(message) end

    --- Request that this screen should be redrawn in a certain number of frames.
    --- A screen that requires highly-fluid animations should call requestAnimationFrame(1) before it returns.
    --- Usage of this function has a significant performance impact on the screen unit system, so scripts should
    --- try to request updates as infrequently as possible.
    --- A screen with unchanging (static) contents should not call this function at all.
    ---@param frames integer The (approximate) number of frames after which the render script will run again and the screen will be redrawn
    function self.requestAnimationFrame(frames) end

    --- Set the background color of the screen
    ---@param r number Red component, between 0 and 1
    ---@param g number Green component, between 0 and 1
    ---@param b number Blue component, between 0 and 1
    function self.setBackgroundColor(r, g, b) end

    --- Set the default fill color for all subsequent shapes of the given type added to the given layer
    ---@param layer integer The layer for which the default will be set
    ---@param shapeType ShapeType The type of shape to which the default will apply
    ---@param r number Red component, between 0 and 1
    ---@param g number Green component, between 0 and 1
    ---@param b number Blue component, between 0 and 1
    ---@param a number Alpha component, between 0 and 1
    function self.setDefaultFillColor(layer, shapeType, r, g, b, a) end

    --- Set the default rotation for all subsequent shapes of the given type added to the given layer
    ---@param layer integer The layer for which the default will be set
    ---@param shapeType ShapeType The type of shape to which the default will apply
    ---@param rotation number Rotation, in radians; positive is counter-clockwise, negative is clockwise
    function self.setDefaultRotation(layer, shapeType, rotation) end

    --- Set the default shadow for all subsequent shapes of the given type added to the given layer
    ---@param layer integer The layer for which the default will be set
    ---@param shapeType ShapeType The type of shape to which the default will apply
    ---@param radius number The distance that the shadow extends from the shape's border
    ---@param r number Red component, between 0 and 1
    ---@param g number Green component, between 0 and 1
    ---@param b number Blue component, between 0 and 1
    ---@param a number Alpha component, between 0 and 1
    function self.setDefaultShadow(layer, shapeType, radius, r, g, b, a) end

    --- Set the default stroke color for all subsequent shapes of the given type added to the given layer
    ---@param layer integer The layer for which the default will be set
    ---@param shapeType ShapeType The type of shape to which the default will apply
    ---@param r number Red component, between 0 and 1
    ---@param g number Green component, between 0 and 1
    ---@param b number Blue component, between 0 and 1
    ---@param a number Alpha component, between 0 and 1
    function self.setDefaultStrokeColor(layer, shapeType, r, g, b, a) end

    --- Set the default stroke width for all subsequent shapes of the given type added to the given layer
    ---@param layer integer The layer for which the default will be set
    ---@param shapeType ShapeType The type of shape to which the default will apply
    ---@param strokeWidth number Stroke width, in pixels
    function self.setDefaultStrokeWidth(layer, shapeType, strokeWidth) end

    --- Set the default text alignment of all subsequent text strings on the given layer
    ---@param layer integer The layer for which the default will be set
    ---@param alignH AlignH Specifies the horizontal anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignH_Left, AlignH_Center, AlignH_Right
    ---@param alignV AlignV Specifies the vertical anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignV_Ascender, AlignV_Top, AlignV_Middle, AlignV_Baseline, AlignV_Bottom, AlignV_Descender
    function self.setDefaultTextAlign(layer, alignH, alignV) end

    --- Set the size at which a font will render.
    --- Impacts all subsequent font-related calls, including addText, getFontMetrics, and getTextBounds.
    ---@param font integer The font for which the size will be set
    ---@param size integer The new size, in vertical pixels, at which the font will render
    function self.setFontSize(font, size) end

    --- Set a clipping rectangle applied to the layer as a whole.
    --- Layer contents that fall outside the clipping rectangle will not be rendered, and those that are
    --- partially within the rectangle will be 'clipped' against it. The clipping rectangle is applied
    --- before layer transformations. Note that clipped contents still count toward the render cost.
    ---@param layer integer The layer for which the clipping rectangle will be set
    ---@param x number X coordinate of the clipping rectangle's top-left corner
    ---@param y number Y coordinate of the clipping rectangle's top-left corner
    ---@param sx number Width of the clipping rectangle
    ---@param sy number Height of the clipping rectangle
    function self.setLayerClipRect(layer, x, y, sx, sy) end

    --- Set the transform origin of a layer; layer scaling and rotation are applied relative to this origin
    ---@param layer integer The layer for which the origin will be set
    ---@param x number X coordinate of the layer's transform origin
    ---@param y number Y coordinate of the layer's transform origin
    function self.setLayerOrigin(layer, x, y) end

    --- Set a rotation applied to the layer as a whole, relative to the layer's transform origin
    ---@param layer integer The layer for which the rotation will be set
    ---@param rotation number Rotation, in radians; positive is counter-clockwise, negative is clockwise
    function self.setLayerRotation(layer, rotation) end

    --- Set a scale factor applied to the layer as a whole, relative to the layer's transform origin.
    --- Scale factors are multiplicative, so that a scale >1 enlarges the size of the layer, 1.0 does nothing, and
    --- <1 reduces the size of the layer.
    ---@param layer integer The layer for which the scale factor will be set
    ---@param sx number Scale factor along the X axis
    ---@param sy number Scale factor along the Y axis
    function self.setLayerScale(layer, sx, sy) end

    --- Set a translation applied to the layer as a whole
    ---@param layer integer The layer for which the translation will be set
    ---@param tx number Translation along the X axis
    ---@param ty number Translation along the Y axis
    function self.setLayerTranslation(layer, tx, ty) end

    --- Set the fill color of the next rendered shape on the given layer; has no effect on shapes that do not support a fill color
    ---@param layer integer The layer to which this property applies
    ---@param r number Red component, between 0 and 1
    ---@param g number Green component, between 0 and 1
    ---@param b number Blue component, between 0 and 1
    ---@param a number Alpha component, between 0 and 1
    function self.setNextFillColor(layer, r, g, b, a) end

    --- Set the rotation of the next rendered shape on the given layer; has no effect on shapes that do not support rotation
    ---@param layer integer The layer to which this property applies
    ---@param rotation number Rotation, in radians; positive is counter-clockwise, negative is clockwise
    function self.setNextRotation(layer, rotation) end

    --- Set the rotation of the next rendered shape on the given layer; has no effect on shapes that do not support rotation
    ---@param layer integer The layer to which this property applies
    ---@param rotation number Rotation, in degrees; positive is counter-clockwise, negative is clockwise
    function self.setNextRotationDegrees(layer, rotation) end

    --- Set the shadow of the next rendered shape on the given layer; has no effect on shapes that do not support a shadow
    ---@param layer integer The layer to which this property applies
    ---@param radius number The distance that the shadow extends from the shape's border
    ---@param r number Red component, between 0 and 1
    ---@param g number Green component, between 0 and 1
    ---@param b number Blue component, between 0 and 1
    ---@param a number Alpha component, between 0 and 1
    function self.setNextShadow(layer, radius, r, g, b, a) end

    --- Set the stroke color of the next rendered shape on the given layer; has no effect on shapes that do not support a stroke color
    ---@param layer integer The layer to which this property applies
    ---@param r number Red component, between 0 and 1
    ---@param g number Green component, between 0 and 1
    ---@param b number Blue component, between 0 and 1
    ---@param a number Alpha component, between 0 and 1
    function self.setNextStrokeColor(layer, r, g, b, a) end

    --- Set the stroke width of the next rendered shape on the given layer; has no effect on shapes that do not support a stroke width
    ---@param layer integer The layer to which this property applies
    ---@param strokeWidth number Stroke width, in pixels
    function self.setNextStrokeWidth(layer, strokeWidth) end

    --- Set the text alignment of the next rendered text string on the given layer.
    --- By default, text is anchored horizontally on the left, and vertically on the baseline
    ---@param layer integer The layer to which this property applies
    ---@param alignH AlignH Specifies the horizontal anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignH_Left, AlignH_Center, AlignH_Right
    ---@param alignV AlignV Specifies the vertical anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignV_Ascender, AlignV_Top, AlignV_Middle, AlignV_Baseline, AlignV_Bottom, AlignV_Descender
    function self.setNextTextAlign(layer, alignH, alignV) end

    --- Set the script's output string, which can be retrieved via a programming board with the screen unit API function getScriptOutput
    ---@param output string The output string
    function self.setOutput(output) end

    return setmetatable(self, screenRenderScript)
end

RenderScript = ScreenRenderScript()


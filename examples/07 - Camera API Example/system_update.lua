 --If not looking at any element, do not draw on update
 if tooltip.name=="" then return end

 --Compute the tooltip frame height
local height = 90+ (#tooltip.methods + #tooltip.fields)*14

--Build the interface in SVG
local svg = {
    [[<style>* {border:1px solid red} #node{ transform: translate(50%, 50%);} svg {position: absolute; left:0px; top:0px;}]],
    [[text {font-size:1vh; text-anchor:start; fill:#ccc}]],
    [[text#eName {font-size:1.25vh; fill:#fff}]],
    [[text#eClass {fill:#ccc; }]],
    [[text.pName {fill:#fff; }]],
    [[text.pValue {text-anchor:end; fill:#ccc; }]],
    [[</style>]],
    [[<svg width=100% height=100% viewBox="0 0 1920 1080">
    <g id="node">]],
        string.format([[<rect x=150 y=%.2f fill=rgba(0,0,0,0.5) width=300 height=%.2f />]], -height/2, height),
        string.format([[<text id="eName" x=160 y=%.2f >%s</text>]], -height/2 +20, tooltip.name),
        string.format([[<text id="eClass" font-style="italic" x=170 y=%.2f >%s</text>]], -height/2 + 40, tooltip.class),
        string.format([[<text id="eName" x=160 y=%.2f >Methods</text>]], -height/2 + 60)
}

--Compose the list of methods of the element
local cSVG, yMethods = #svg, 0
if tooltip.methods then
    for k,m in pairs(tooltip.methods) do
        yMethods = -height/2 + 60 + k*14
        svg[cSVG+k] = string.format('<text class="pName" x=170 y=%.2f >%s</text>',
            yMethods,
            m.name
        )
    end
end

cSVG = #svg+1
yMethods = yMethods +20
svg[cSVG] = string.format([[<text id="eName" x=160 y=%.2f >Fields</text>]], yMethods)

--Compose the list of fields of the element
if tooltip.fields then
    for k,f in pairs(tooltip.fields) do
        local sValue = ""
        local yFields = yMethods + k*14

        if type(f.value) == 'number' then
            sValue = string.format('%.4f', f.value)
        elseif type(f.value) == 'boolean' then
      
           sValue = string.format('%s', f.value and 'true' or 'false')
        elseif type(f.value) == 'string' then
            sValue = f.value
        else
            sValue = tostring(f.value)
        end

        svg[cSVG+k] = string.format('<text class="pName" x=170 y=%.2f >%s</text><text class="pValue" x=440 y=%.2f >%s</text>',
            yFields,
            f.name,
            yFields,
            sValue
        )
    end
end

svg[#svg+1] = [[</g></svg>]]

--Concat and display the SVG
system.setScreen(table.concat(svg))
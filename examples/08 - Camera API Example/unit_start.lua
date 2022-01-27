--Declaration of globals
tooltip = {name="",class="", dist=0, methods={}, fields={}}
target = nil
slotIndustry.size = 1.25 --Setup the size of the linked industrie element, with the slot named slotIndustry

--Custom function declaration
function isLinked(id)
    for k,s in pairs(unit) do
        if type(s) == 'table' and s.getId and s.getId() == id then
            return true, s
        end
    end
    return false
end

--Initial setup
system.showScreen(1)
unit.hide()

unit.setTimer('compute',0.02)
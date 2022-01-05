require 'Items/Distributions'
require 'Items/SuburbsDistributions'

local function BSD_onPreDistributionMerge()
    print("[BSD] removing cigarettes from zombie Distributions")
    -- need to identify base distributions: other mods sometimes end up before this in the table,
    -- and sometimes after, so no hardcoded index is correct
    for k,v in pairs(Distributions) do
        if v.all and v.all.inventoryfemale and v.all.inventorymale then
            print("  Removing from distribution at index " .. k)
            RemoveItemFromDistribution(v.all.inventoryfemale, "Cigarettes")
            RemoveItemFromDistribution(v.all.inventorymale, "Cigarettes")
        end
    end
end

-- push changes to Distributions
Events.OnPreDistributionMerge.Add(BSD_onPreDistributionMerge)

require 'Items/Distributions'
require 'Items/SuburbsDistributions'

local function BSD_onPreDistributionMerge()
    print("[BSD] removing cigarettes from zombie Distributions")
    -- need to identify base distributions: other mods sometimes end up before this in the table,
    -- and sometimes after, so no hardcoded index is correct
    local base_dists = nil
    for k,v in pairs(Distributions) do
        if v.all and v.all.inventoryfemale and v.all.inventorymale then
            print("  Base distributions at index " .. k)
            base_dists = v.all
        end
    end
    if base_dists == nil then
        print("  Didn't find base distributions")
    else
        -- remove cigarettes from zombie loot tables
        local zombInv_female = base_dists["inventoryfemale"]
        local zombInv_male = base_dists["inventorymale"]

        RemoveItemFromDistribution(zombInv_female, "Cigarettes")
        RemoveItemFromDistribution(zombInv_male, "Cigarettes")
    end
end

-- push changes to Distributions
Events.OnPreDistributionMerge.Add(BSD_onPreDistributionMerge)

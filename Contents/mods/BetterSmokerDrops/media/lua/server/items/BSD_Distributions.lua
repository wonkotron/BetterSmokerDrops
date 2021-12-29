require 'Items/Distributions'
require 'Items/SuburbsDistributions'

local function zombie_preDistributionMerge()
    print("[BSD] removing cigarettes from zombie Distributions")
    -- remove cigarettes from zombie loot tables
    local zombInv_female = Distributions[1]["all"]["inventoryfemale"]
    local zombInv_male = Distributions[1]["all"]["inventorymale"]

    RemoveItemFromDistribution(zombInv_female, "Cigarettes")
    RemoveItemFromDistribution(zombInv_male, "Cigarettes")
end

-- push changes to Distributions
Events.OnPreDistributionMerge.Add(preDistributionMerge)

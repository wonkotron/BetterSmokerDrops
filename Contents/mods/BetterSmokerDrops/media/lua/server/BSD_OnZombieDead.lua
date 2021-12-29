-- pull vars from global (Mod Options managed sandbox options)
local smokerPct = BSD.OPTIONS.smokerPct
local ignitionPct = BSD.OPTIONS.ignitionPct

local function BSD_OnZombieDead(zombie)
    -- if zombie is a smoker
    local smokerRoll = ZombRand(101)
    -- @DEBUG:  print("[BSD] smokerRoll = ", smokerRoll)

    if (smokerRoll <= smokerPct) then   
        -- spawn between 0 and 20 cigarettes
        local cigRoll = ZombRand(21)

        -- @DEBUG:  print("[BSD] cigRoll = ", cigRoll)
        for i=1,cigRoll do
            zombie:getInventory():AddItem("Base.Cigarettes", 1)
        end

        -- if zombie has an ignition source
        local ignitionRoll = ZombRand(101)
        -- @DEBUG: print("[BSD] ignitionRoll = ", ignitionRoll)
        if (ignitionRoll <= ignitionPct) then
            -- choose lighter or matches
            local ignitionSrc = "Base.Lighter"
            if (ZombRand(2) == 0) then
                ignitionSrc = "Base.Matches"
            end
            -- spawn ignition item with random remaining durability [0.0-1.0]
            local ignitionUse = ZombRand(101)/100
            -- @DEBUG:  print("[BSD] ignitionUse = ", ignitionUse)

            local ignitionItem = InventoryItemFactory.CreateItem(ignitionSrc, ignitionUse);
            zombie:getInventory():AddItem(ignitionItem)
        end
    end
end

Events.OnZombieDead.Add(BSD_OnZombieDead)

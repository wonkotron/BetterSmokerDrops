--WITH SANDBOX OPTIONS
require('NPCs/MainCreationMethods');

local function BSD_serverInit()
    print("[BSD_serverInit] SandboxVars.BetterSmokerDrops.SmokerPercentage = ", SandboxVars.BetterSmokerDrops.SmokerPercentage);
    print("[BSD_serverInit] SandboxVars.BetterSmokerDrops.IgnitionSourcePercentage = ", SandboxVars.BetterSmokerDrops.IgnitionSourcePercentage);
    print("[BSD_serverInit] SandboxVars.BetterSmokerDrops.MaxCigarettesOnZombie = ", SandboxVars.BetterSmokerDrops.MaxCigarettesOnZombie);
    print("[BSD_serverInit] SandboxVars.BetterSmokerDrops.MaxFuelInIgnitionSourcePercentage = ", SandboxVars.BetterSmokerDrops.MaxFuelInIgnitionSourcePercentage);
end

local function BSD_OnZombieDead(zombie)
    -- if zombie is a smoker
    local smokerRoll = ZombRand(101)
    -- @DEBUG:  print("[BSD] smokerRoll = ", smokerRoll)

    if (smokerRoll <= SandboxVars.BetterSmokerDrops.SmokerPercentage) then
        -- spawn cigarettes
        local cigRoll = ZombRand(SandboxVars.BetterSmokerDrops.MaxCigarettesOnZombie + 1)

        -- @DEBUG:  print("[BSD] cigRoll = ", cigRoll)
        for i=1,cigRoll do
            zombie:getInventory():AddItem("Base.Cigarettes", 1)
        end

        -- if zombie has an ignition source
        local ignitionRoll = ZombRand(101)
        -- @DEBUG: print("[BSD] ignitionRoll = ", ignitionRoll)
        if (ignitionRoll <= SandboxVars.BetterSmokerDrops.IgnitionSourcePercentage) then
            -- choose lighter or matches
            local ignitionSrc = "Base.Lighter"
            if (ZombRand(2) == 0) then
                ignitionSrc = "Base.Matches"
            end
            -- spawn ignition item with random remaining durability [0.0-1.0]
            local ignitionUse = ZombRand(SandboxVars.BetterSmokerDrops.MaxFuelInIgnitionSourcePercentage + 1)/100
            -- @DEBUG:  print("[BSD] ignitionUse = ", ignitionUse)

            local ignitionItem = InventoryItemFactory.CreateItem(ignitionSrc, ignitionUse);
            zombie:getInventory():AddItem(ignitionItem)
        end
    end
end

Events.OnGameStart.Add(BSD_serverInit)
Events.OnZombieDead.Add(BSD_OnZombieDead)

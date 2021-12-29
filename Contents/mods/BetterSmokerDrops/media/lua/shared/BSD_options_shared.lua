-- These are the default options.
local OPTIONS = {
    -- Sandboxed options
    smokerPct = 5,
    ignitionPct = 75,
}

-- Checking if Mod Options is installed and active
if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(OPTIONS, "BSD", "Better Smoker Drops")

    --configure strings
    local _smokerPct = settings:getData("smokerPct")
    _smokerPct.name = "IGUI_BSD_Zombie_SmokerPct_Name"
    _smokerPct.tooltip = "IGUI_BSD_Zombie_SmokerPct_Tooltip"

    local _ignitionPct = settings:getData("ignitionPct")
    _ignitionPct.name = "IGUI_BSD_Zombie_IgnitionPct_Name"
    _ignitionPct.tooltip = "IGUI_BSD_Zombie_IgnitionPct_Tooltip"

    -- move to sandbox
    local _options = {
        "smokerPct",
        "ignitionPct"
    }
    settings:MoveOptionsToSandbox("BetterSmokerDrops", _options)
end

-- Check actual options at game loading.
Events.OnGameStart.Add(
    function()
        print("[BSD] options OnGameStart - smokerPct = ", OPTIONS.smokerPct)
        print("[BSD] options OnGameStart - ignitionPct = ", OPTIONS.ignitionPct)
    end
)

BSD = {}
BSD.OPTIONS = OPTIONS

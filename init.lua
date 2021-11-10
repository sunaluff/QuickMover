local _, tTable = ...

function tTable:OnLoadHandler(event, name)
    if name ~= "QuickMover" then return end
    SetBinding("'","QuickMover");
    if not QuickMoverValues then 
        QuickMoverValues = {}
        QuickMoverValues.moveAmount = 1;
        QuickMoverValues.toggleMode = "move";
        QuickMoverValues.lastToggleMode = "move";
        QuickMoverValues.debugMode = false;
        QuickMoverValues.setRotate = false;
    end
    -- these debug functions arent part of the addon functionality
    -- i just like having them and since i dont use my normal addons on epsi they can go in here
    SLASH_RELOADUI1 = "/rl" -- For quicker reloading whilst debugg
    SlashCmdList.RELOADUI = ReloadUI
    SLASH_FRAMESTK1 = "/fs" -- For quicker access to frame stack
    SlashCmdList.FRAMESTK = function()
        LoadAddOn('Blizzard_DebugTools')
        FrameStackTooltip_Toggle()
    end
    tTable.createFrame();
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:SetScript("OnEvent", tTable.OnLoadHandler)
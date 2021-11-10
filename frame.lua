local _, tTable = ...
local values = QuickMoverValues;

QuickMover = {}; -- anything we need in the global namespace (aka only toggleFrame)

function tTable:createFrame()
    tTable.frame = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin);
    local frame = tTable.frame;
    frame.activeBool = false;
    frame:SetPoint("BOTTOMRIGHT", 0, 165);
    frame:SetSize(104, 78);
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        edgeSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    })
    frame:SetBackdropColor(0.1, 0.1, 0.1, 1);
    createButtonFrame();
    createModeFrame();
    createAmountFrame();
    createSetRotateFrame();
    print("QuickMover has loaded. Enjoy building!");
end

function createButtonFrame()
    tTable.frame.button = CreateFrame("Button", nil, tTable.frame, "UIPanelButtonTemplate");
    local button = tTable.frame.button;
    button:SetPoint("BOTTOMLEFT",2, 2);
    button:SetSize(100, 40);
    button:SetText("Turn on");
    button:SetScript("OnClick", function(self, button)
        QuickMover.toggleFrame();
    end);
end

function createModeFrame()
    tTable.frame.mode = CreateFrame("Frame", nil, tTable.frame);
    local mode = tTable.frame.mode;
    mode:SetPoint("TOPRIGHT",-5,-1)
    mode:SetSize(38, 38);
    mode.tex = mode:CreateTexture();
    mode.tex:SetAllPoints(mode);
    mode.tex:SetTexture("interface/petbattles/DeadPetIcon");
end

function createSetRotateFrame()
    tTable.frame.mode.setRotate = CreateFrame("Frame", nil, tTable.frame.mode);
    local setRotate = tTable.frame.mode.setRotate;
    setRotate:SetPoint("TOPRIGHT",8,4)
    setRotate:SetSize(30,30);
    setRotate.tex = setRotate:CreateTexture();
    setRotate.tex:SetAllPoints(setRotate);
    setRotate.tex:SetTexture("interface/BUTTONS/UI-SpellbookIcon-NextPage-Up");
    setRotate:Hide();
end

function createAmountFrame()
    tTable.frame.amount = CreateFrame("EditBox",nil,tTable.frame,"InputBoxTemplate");
    amount = tTable.frame.amount;
    amount:SetPoint("TOPLEFT",10,-11);
    amount:SetSize(45, 20);
    amount:SetAutoFocus(false);
    amount:SetNumber(QuickMoverValues.moveAmount);
    amount:ClearFocus();
    amount:SetScript("OnEnterPressed", function(self)
        QuickMoverValues.moveAmount = self:GetNumber();
        self:SetNumber(QuickMoverValues.moveAmount);
        self:ClearFocus();
    end);
    amount:SetScript("OnEscapePressed", function(self)
        QuickMoverValues.moveAmount = self:GetNumber();
        self:SetNumber(QuickMoverValues.moveAmount);
        self:ClearFocus();
    end);
    amount:SetScript("OnEditFocusLost", function(self)
        QuickMoverValues.moveAmount = self:GetNumber();
        self:SetNumber(QuickMoverValues.moveAmount);
        self:ClearFocus();
    end);
end

function tTable:turnOnFrame()
    local frameTex = {
        ["move"] = function() 
            tTable.frame.mode.tex:SetTexture("interface/icons/UI_Mission_ItemUpgrade"); 
        end,
        ["copy"] = function() 
            tTable.frame.mode.tex:SetTexture("interface/icons/Spell_Nature_MirrorImage");
        end,
        ["rotate"] = function() 
            tTable.frame.mode.tex:SetTexture("interface/icons/Achievement_BG_returnXflags_def_WSG"); 
        end,
        ["calc"] = function()
            tTable.frame.mode.tex:SetTexture("interface/icons/Ability_Iyyokuk_Calculate"); 
        end
    }
    frameTex[QuickMoverValues.toggleMode]();
    local KeybindsArray = tTable.bindings[QuickMoverValues.toggleMode];
    tTable.frame.button:SetText("Turn off");
    tTable.frame:EnableKeyboard(true);
    tTable.frame:SetScript("OnKeyDown", function(self, key)
        if KeybindsArray[key] ~= nil then
            tTable.frame:SetPropagateKeyboardInput(false);
            KeybindsArray[key]["function"]();
        else
            tTable.frame:SetPropagateKeyboardInput(key);
        end
        if QuickMoverValues.debugMode then print(key); end
    end);
end

function tTable:turnOffFrame()
    tTable.frame.mode.tex:SetTexture("interface/petbattles/DeadPetIcon");
    if QuickMoverValues.toggleMode == "calc" then
        QuickMoverValues.toggleMode = QuickMoverValues.lastToggleMode
    end
    tTable.frame.button:SetText("Turn on");
    tTable.frame:EnableKeyboard(false);
    tTable.frame:SetScript("OnKeyDown", nil);
end

function tTable:toggleSetRotate()
    if QuickMoverValues.toggleMode == "rotate" and tTable.frame.activeBool then
        tTable.frame.mode.setRotate:Show();
        if QuickMoverValues.setRotate then
            tTable.frame.mode.setRotate.tex:SetTexture("interface/BUTTONS/UI-SpellbookIcon-NextPage-Down");
        else
            tTable.frame.mode.setRotate.tex:SetTexture("interface/BUTTONS/UI-SpellbookIcon-NextPage-Up");
        end
    else
        tTable.frame.mode.setRotate:Hide();
    end
end

QuickMover.toggleFrame = function()
    tTable.frame.activeBool = not tTable.frame.activeBool;
    tTable:toggleSetRotate();
    if tTable.frame.activeBool then
        tTable:turnOnFrame();
    else
        tTable:turnOffFrame();
    end
end


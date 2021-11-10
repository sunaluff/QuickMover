local _, tTable = ...
tTable.bindings = {};
local bindings = tTable.bindings;
local values = QuickMoverValues;

BINDING_HEADER_QuickMover = "Toggle Mover";
BINDING_NAME_QuickMover = "Toggle";

local commonBinds = {
    ["NUMPAD0"] = {
        ["function"] = function() SendChatMessage(".gob sel", "EMOTE"); end
    },
    ["NUMPADDECIMAL"] = {
        ["function"] = function() SendChatMessage(".gob del", "EMOTE"); end
    },
    ["NUMPADDIVIDE"] = {
        ["function"] = function() SendChatMessage(".gob unsel", "EMOTE"); end
    },
    ["ENTER"] = {
        ["function"] = function()
            QuickMoverValues.lastToggleMode = QuickMoverValues.toggleMode;
            QuickMoverValues.toggleMode = "calc";
            tTable:turnOnFrame();
            tTable:toggleSetRotate()
        end
    },
    ["NUMPAD1"] = {
        ["function"] = function()
            QuickMoverValues.lastToggleMode = QuickMoverValues.toggleMode;
            QuickMoverValues.toggleMode = "move";
            tTable:turnOnFrame();
            tTable:toggleSetRotate()
        end
    },
    ["NUMPAD2"] = {
        ["function"] = function()
            QuickMoverValues.lastToggleMode = QuickMoverValues.toggleMode;
            QuickMoverValues.toggleMode = "copy";
            tTable:turnOnFrame();
            tTable:toggleSetRotate()
        end
    },
    ["NUMPAD3"] = {
        ["function"] = function()
            QuickMoverValues.lastToggleMode = QuickMoverValues.toggleMode;
            QuickMoverValues.toggleMode = "rotate";
            tTable:turnOnFrame();
            tTable:toggleSetRotate()
        end
    }
}

bindings["move"] = {
    ["NUMPAD5"] = {
        ["function"] = function()
            SendChatMessage(".gob m b " .. QuickMoverValues.moveAmount, "EMOTE");
        end
    },
    ["NUMPAD8"] = {
        ["function"] = function()
            SendChatMessage(".gob m f " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD4"] = {
        ["function"] = function()
            SendChatMessage(".gob m l " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD6"] = {
        ["function"] = function()
            SendChatMessage(".gob m r " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD7"] = {
        ["function"] = function()
            SendChatMessage(".gob m u " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD9"] = {
        ["function"] = function()
            SendChatMessage(".gob m d " .. QuickMoverValues.moveAmount, "EMOTE");
        end
    }
};
bindings["copy"] = {
    ["NUMPAD5"] = {
        ["function"] = function()
            SendChatMessage(".gob c b " .. QuickMoverValues.moveAmount, "EMOTE");
        end
    },
    ["NUMPAD8"] = {
        ["function"] = function()
            SendChatMessage(".gob c f " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD4"] = {
        ["function"] = function()
            SendChatMessage(".gob c l " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD6"] = {
        ["function"] = function()
            SendChatMessage(".gob c r " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD7"] = {
        ["function"] = function()
            SendChatMessage(".gob c u " .. QuickMoverValues.moveAmount, "EMOTE");
        end

    },
    ["NUMPAD9"] = {
        ["function"] = function()
            SendChatMessage(".gob c d " .. QuickMoverValues.moveAmount, "EMOTE");
        end
    }
};
bindings["rotate"] = {
    ["NUMPAD5"] = {
        ["function"] = function() tTable.rotate.y(-1, QuickMoverValues.setRotate); end
    },
    ["NUMPAD8"] = {
        ["function"] = function() tTable.rotate.y(1, QuickMoverValues.setRotate); end

    },
    ["NUMPAD4"] = {
        ["function"] = function() tTable.rotate.z(-1, QuickMoverValues.setRotate); end

    },
    ["NUMPAD6"] = {
        ["function"] = function() tTable.rotate.z(1, QuickMoverValues.setRotate); end

    },
    ["NUMPAD7"] = {
        ["function"] = function() tTable.rotate.x(1, QuickMoverValues.setRotate); end

    },
    ["NUMPAD9"] = {
        ["function"] = function() tTable.rotate.x(-1, QuickMoverValues.setRotate); end
    },
    ["BACKSPACE"] = {
        ["function"] = function() tTable.rotate.toggleSetRotate(); end
    }

};
bindings["calc"] = {
    ["NUMPADDECIMAL"] = {
        ["function"] = function() tTable.calculator:enterNumber("."); end
    },
    ["NUMPAD0"] = {
        ["function"] = function() tTable.calculator:enterNumber("0"); end
    },
    ["NUMPAD1"] = {
        ["function"] = function() tTable.calculator:enterNumber("1"); end
    },
    ["NUMPAD2"] = {
        ["function"] = function() tTable.calculator:enterNumber("2"); end
    },
    ["NUMPAD3"] = {
        ["function"] = function() tTable.calculator:enterNumber("3"); end
    },
    ["NUMPAD4"] = {
        ["function"] = function() tTable.calculator:enterNumber("4"); end
    },
    ["NUMPAD5"] = {
        ["function"] = function() tTable.calculator:enterNumber("5"); end
    },
    ["NUMPAD6"] = {
        ["function"] = function() tTable.calculator:enterNumber("6"); end
    },
    ["NUMPAD7"] = {
        ["function"] = function() tTable.calculator:enterNumber("7"); end
    },
    ["NUMPAD8"] = {
        ["function"] = function() tTable.calculator:enterNumber("8"); end
    },
    ["NUMPAD9"] = {
        ["function"] = function() tTable.calculator:enterNumber("9"); end
    },
    ["ENTER"] = {["function"] = function() tTable.calculator:getResult(); end},
    ["NUMPADDIVIDE"] = {
        ["function"] = function() tTable.calculator:enterMath("DIVIDE"); end
    },
    ["NUMPADMULTIPLY"] = {
        ["function"] = function()
            tTable.calculator:enterMath("MULTIPLY");
        end
    },
    ["NUMPADMINUS"] = {
        ["function"] = function() tTable.calculator:enterMath("MINUS"); end
    },
    ["NUMPADPLUS"] = {
        ["function"] = function() tTable.calculator:enterMath("PLUS"); end
    },
    ["BACKSPACE"] = {
        ["function"] = function() tTable.calculator:removeLastFilled(); end
    }
};
for index, value in pairs(commonBinds) do
    bindings["move"][index] = value;
    bindings["copy"][index] = value;
    bindings["rotate"][index] = value;
end

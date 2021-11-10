local _, tTable = ...
local values = QuickMoverValues;
tTable.calculator = {};
local calculator = tTable.calculator;
local leftValue = "0";
local rightValue = "0";
local mathChar;

function calculator:enterNumber(value)
    if mathChar then
        rightValue = rightValue .. value;
    else
        leftValue = leftValue .. value;
    end
end

function calculator:enterMath(value)
    if leftValue == "0" then leftValue = QuickMoverValues.moveAmount; end
    mathChar = value;
end

function calculator:removeLastFilled()
    if tonumber(rightValue) > 0 then
        rightValue = "0";
    elseif mathChar then
        mathChar = nil;
    else
        leftValue = "0";
    end
end

local mathFuncs = {
    ["DIVIDE"] = function(value1, value2) return value1 / value2; end,
    ["MULTIPLY"] = function(value1, value2) return value1 * value2; end,
    ["MINUS"] = function(value1, value2) return value1 - value2; end,
    ["PLUS"] = function(value1, value2) return value1 + value2; end
}

function calculator:getResult()
    local result;
    if leftValue and mathChar and rightValue then
        result = mathFuncs[mathChar](tonumber(leftValue), tonumber(rightValue));
    elseif leftValue ~= "0" then
        result = tonumber(leftValue);
    else
        result = QuickMoverValues.moveAmount;
    end
    if result ~= result then result = 0; end -- gets rid of nan: should maybe be the original moveamount instead of 0? ill see what feels good
    QuickMoverValues.moveAmount = result;
    tTable.frame.amount:SetNumber(result);
    leftValue = "0";
    rightValue = "0";
    mathChar = nil;
    QuickMoverValues.toggleMode = QuickMoverValues.lastToggleMode;
    tTable:turnOnFrame();
    tTable:toggleSetRotate();
    if QuickMoverValues.debugMode then print(result); end
end

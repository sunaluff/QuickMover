local _, tTable = ...
local values = QuickMoverValues;
tTable.rotate = {};
local rotate = tTable.rotate;
-- QuickMoverValues.moveAmount = rotate amount;

rotate.x = function(direction,set)
   local turnAmount = set == true and QuickMoverValues.moveAmount or direction > 0 and OPRotationSliderX:GetValue() + QuickMoverValues.moveAmount or OPRotationSliderX:GetValue() - QuickMoverValues.moveAmount;
   SendChatMessage(".gob rotate " .. turnAmount .. " " .. OPRotationSliderY:GetValue() .. " " .. OPRotationSliderZ:GetValue(), "EMOTE");
end
rotate.y = function(direction,set)
   local turnAmount = set == true and QuickMoverValues.moveAmount or direction > 0 and OPRotationSliderY:GetValue() + QuickMoverValues.moveAmount or OPRotationSliderY:GetValue() - QuickMoverValues.moveAmount;
   SendChatMessage(".gob rotate " .. OPRotationSliderX:GetValue() .. " " .. turnAmount .. " " .. OPRotationSliderZ:GetValue(), "EMOTE");
end
rotate.z = function(direction,set)
   local turnAmount = set == true and QuickMoverValues.moveAmount or direction > 0 and OPRotationSliderZ:GetValue() + QuickMoverValues.moveAmount or OPRotationSliderZ:GetValue() - QuickMoverValues.moveAmount;
   SendChatMessage(".gob rotate " .. OPRotationSliderX:GetValue() .. " " .. OPRotationSliderY:GetValue() .. " " .. turnAmount, "EMOTE");
end
rotate.toggleSetRotate = function()
   QuickMoverValues.setRotate = not QuickMoverValues.setRotate;
   tTable:toggleSetRotate()
end
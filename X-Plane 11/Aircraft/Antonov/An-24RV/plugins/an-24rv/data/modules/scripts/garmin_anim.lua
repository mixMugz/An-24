--[[

  File: garmin_anim.lua
  -----
  GARMIN knob animation

--]]

local function anim(command_up, command_down, dataref, angle)
  local drf = cGPi(dataref)
  registerCommandHandler(findCommand(command_up), 0, function(p) if p == 0 then set(drf, (get(drf) + angle) % 360) end return 0 end)
  registerCommandHandler(findCommand(command_down), 0, function(p) if p == 0 then set(drf, (get(drf) - angle) % 360) end return 0 end)
end

anim("sim/GPS/g430n1_fine_up"   , "sim/GPS/g430n1_fine_down"   , "custom/GNS430/fine_angle1"   , 20)
anim("sim/GPS/g430n1_coarse_up" , "sim/GPS/g430n1_coarse_down" , "custom/GNS430/coarse_angle1" , 20)
anim("sim/GPS/g430n1_page_up"   , "sim/GPS/g430n1_page_dn"     , "custom/GNS430/page_angle1"   , 20)
anim("sim/GPS/g430n1_chapter_up", "sim/GPS/g430n1_chapter_dn"  , "custom/GNS430/chapter_angle1", 20)

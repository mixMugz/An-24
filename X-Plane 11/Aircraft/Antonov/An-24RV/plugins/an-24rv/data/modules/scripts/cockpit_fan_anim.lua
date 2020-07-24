--[[

  File: cockpit_fan_anim.lua
  -----
  This is cockpit fan angle calculations for animation

--]]

local vent1 = cPPf("misc/vent_1") -- Fan #1 rotation
local vent2 = cPPf("misc/vent_2") -- Fan #2 rotation
local vent3 = cPPf("misc/vent_3") -- Fan #3 rotation
local vent4 = cPPf("misc/vent_4") -- Fan #4 rotation
local vent1sw = cPPi("misc/vent_1_sw") -- Fan #1 switch
local vent2sw = cPPi("misc/vent_2_sw") -- Fan #2 switch
local vent3sw = cPPi("misc/vent_3_sw") -- Fan #3 switch
local vent4sw = cPPi("misc/vent_4_sw") -- Fan #4 switch
local vent1op = cPPi("misc/vent_1_op") -- Fan #1 operation status
local vent2op = cPPi("misc/vent_2_op") -- Fan #2 operation status
local vent3op = cPPi("misc/vent_3_op") -- Fan #3 operation status
local vent4op = cPPi("misc/vent_4_op") -- Fan #4 operation status

local v1spd = 0
local v2spd = 0
local v3spd = 0
local v4spd = 0
local v1op = 0
local v2op = 0
local v3op = 0
local v4op = 0
local upspd = 300
local dnspd = 100
local maxspd = 1000 -- Deg per second

function update()
  -- Fan 1
  if gvar.bus_dc27 > 21 and get(vent1sw) == 1 then v1op = 1 else v1op = 0 end
  v1spd = math.max(0, math.min(maxspd, v1op == 1 and v1spd + upspd * gvar.frame_time or v1spd - dnspd * gvar.frame_time))
  set(vent1op, v1op)
  set(vent1, (get(vent1) + v1spd * gvar.frame_time) % 360)

  -- Fan 2
  if gvar.bus_dc27 > 21 and get(vent2sw) == 1 then v2op = 1 else v2op = 0 end
  v2spd = math.max(0, math.min(maxspd, v2op == 1 and v2spd + upspd * gvar.frame_time or v2spd - dnspd * gvar.frame_time))
  set(vent2op, v2op)
  set(vent2, (get(vent2) + v2spd * gvar.frame_time) % 360)
	
  -- Fan 3
  if gvar.bus_dc27 > 21 and get(vent3sw) == 1 then v3op = 1 else v3op = 0 end
  v3spd = math.max(0, math.min(maxspd, v3op == 1 and v3spd + upspd * gvar.frame_time or v3spd - dnspd * gvar.frame_time))
  set(vent3op, v3op)
  set(vent3, (get(vent3) + v3spd * gvar.frame_time) % 360)

  -- Fan 4
  if gvar.bus_dc27 > 21 and get(vent4sw) == 1 then v4op = 1 else v4op = 0 end
  v4spd = math.max(0, math.min(maxspd, v4op == 1 and v4spd + upspd * gvar.frame_time or v4spd - dnspd * gvar.frame_time))
  set(vent4op, v4op)
  set(vent4, (get(vent4) + v4spd * gvar.frame_time) % 360)
end

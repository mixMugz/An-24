--[[

  File: engine_logic.lua
  -----
  Engine Logic component

--]]

local rud_close = cGPi(pfx.."misc/rud_close")
local rud_close_ru19 = cGPi(pfx.."misc/rud_close_ru19")
local rud_close_pos = cGPi(pfx.."misc/rud_close_pos")
local rud_stopor = cGPf(pfx.."misc/rud_stopor")
local thro_over = gPi("sim/operation/override/override_throttles")
local prop_RPM = gPf("sim/cockpit2/engine/actuators/prop_rotation_speed_rad_sec_all") -- Propeller RPM, 0 - 130.381622
local sim_T = gPf("sim/weather/temperature_ambient_c") -- Temperature on sea level
local msl_alt = gPf("sim/flightmodel/position/elevation") -- Barometric alt. maybe in feet, maybe in meters
local baro_press = gPf("sim/weather/barometer_sealevel_inhg") -- Pressire at sea level in.Hg
local wing_ht = gPi("sim/cockpit/switches/anti_ice_surf_heat") -- On/off wing heat

local rud1_out = false
local rud2_out = false
local rud3_out = false
local left_rud_last = 0
local right_rud_last = 0
local third_rud_last = 0
local left_rud_need = 0.05
local right_rud_need = 0.05
local ru19_rud_need = 0
local initialized = false
local counter = 0

-- Interpolation table for throttles
local tro_table = {
  {0.00, 0.03}, -- Idle
  {0.05, 0.10},
  {0.12, 0.15},
  {0.20, 0.23},
  {0.25, 0.25},
  {0.30, 0.41},
  {0.52, 0.60},
  {0.65, 0.70}, -- Nominal
  {0.75, 0.86},
  {0.87, 0.94},
  {0.95, 1.00}, -- Takeoff
}

-- Table of throttles for Ru19
local tro_table_ru19 = {
  {0.00, -1  },
  {0.05, 0.10},
  {0.12, 0.20},
  {0.21, 0.25},
  {0.30, 0.35},
  {0.40, 0.45},
  {0.50, 0.60},
  {0.65, 0.75},
  {0.80, 0.90}, -- 0.8 of nominal
  {1.00, 1.00}, -- Nominal
}

local t_table = {
  {-1000, 0.6  }, -- BUG workaround
  {  -30, 0.83 }, -- -30 C
  {  -10, 0.90 }, -- -10 C
  {    0, 0.931}, --  0 C
  {   15, 1.00 }, -- Standard temperature
  {   50, 1.1  }, --  +50 C
  { 1000, 1.0  }, -- BUG workaround
}

-- Tables for temp correction
local t_table_ru19 = {
  {-1000, 1.00}, -- BUG workaround
  {  -30, 1.00}, -- -30 C
  {    0, 1.00}, -- 0 C
  {   15, 1.00}, -- standard temperature
  {   50, 1.00}, -- +50 C
  { 1000, 1.0 }, -- BUG workaround
}

-- Tables for altitude correction
local alt_table = {
  {-50000, 0.65 }, -- BUG workaround
  {  0.00, 0.65 }, -- At standard pressure zero level
  {  4000, 0.745}, -- 4000 ft
  {  8000, 0.87 }, -- 8000 ft
  { 12000, 1.015},
  { 15000, 1.050}, -- 15000 ft
  { 17000, 1.10 },
  { 19000, 1.20 },
  { 21000, 1.30 },
  { 30000, 1.5  },
  {100000, -0.50}, -- Linear above 15000 ft
}

-- Tables for altitude correction
local alt_table_ru19 = {
  {-50000 , 1   }, -- BUG workaround
  { 0.00  , 0.8 }, -- on standard pressure zero level
  { 4000  , 0.85}, -- 4000 ft
  { 8000  , 0.90}, -- 8000 ft
  { 13000 , 1   }, -- 13000 ft
  { 100000,-0.5 }, -- linear above 13000 ft
}

-- For all commands phase (p) equals: 0 on press; 1 while holding; 2 on release
registerCommandHandler(createCommand("An-24/Engine/rud_fix_up", "Engine RUD stoper position up one."), 0, function(p) if p == 0 then set(rud_close_pos, math.min(5, get(rud_close_pos) + 1)) end return 0 end)
registerCommandHandler(createCommand("An-24/Engine/rud_fix_dn", "Engine RUD stoper position down one."), 0, function(p) if p == 0 then set(rud_close_pos, math.max(0, get(rud_close_pos) - 1)) end return 0 end)
registerCommandHandler(createCommand("An-24/Engine/rud_stop", "Engine RUD stoper cap."), 0, function(p) if get(drf_set.switch_rud) == 1 then if p == 0 then set(rud_close, math.abs(1 - get(rud_close))) end else if p == 1 then set(rud_close, 1) else set(rud_close, 0) end end return 0 end)
registerCommandHandler(createCommand("An-24/Engine/rud_stop_ru19", "RU19 RUD stoper cap."), 0, function(p) if p == 1 then set(rud_close_ru19, 1) else set(rud_close_ru19, 0) if p == 2 then if get(rud_close_ru19) == 0 and math.floor(get(drf_engn.thro_comm_3)*100)*0.01 == 0 and math.floor(get(drf_engn.virt_rud3)*100)*0.01 == 0 then set(drf_engn.thro_comm_3, 0.05) set(drf_engn.virt_rud3, 0.05) elseif get(rud_close_ru19) == 0 and math.floor(get(drf_engn.thro_comm_3)*100)*0.01 <= 0.05 and math.floor(get(drf_engn.virt_rud3)*100)*0.01 == 0.05 then set(drf_engn.thro_comm_3, 0) set(drf_engn.virt_rud3, 0) end end end return 0 end)

-- Interpolate values using table as reference
local function interpolate(tbl, value)
  local lastActual = 0
  local lastReference = 0
  for _k, v in pairs(tbl) do
    if value == v[1] then
      return v[2]
    end
    if value < v[1] then
      local a = value - lastActual
      local m = v[2] - lastReference
      return lastReference + a / (v[1] - lastActual) * m
    end
    lastActual = v[1]
    lastReference = v[2]
  end
  return value - lastActual + lastReference
end

-- Smooth interpolation
local function smooth(thro, need)
  return thro + (need - thro) * gvar.frame_time
end

function update()
  if not initialized and counter > 0.3 and counter < 0.5 then
    set(thro_over, 1) -- Used for take control via plugin. Inside update, bacause XPUIPC reseting overrides on load.
    set(drf_engn.thro_need_1, 0.2)
    set(drf_engn.thro_need_2, 0.2)
    set(drf_engn.thro_need_3, 0.2)
    initialized = true
  elseif not initialized then
    counter = counter + gvar.frame_time
  end

  -- Time BUG workaround
  if gvar.frame_time > 0 then
    -- Set prop RPM to max
    set(prop_RPM, 130.381622)

    -- Altitude calculations
    local alt = get(msl_alt) * 3.28083 -- MSL alt in feet
    local alt_baro = (29.92 - get(baro_press)) * 1000
    local alt_coef = interpolate(alt_table, alt + alt_baro) -- Altitude coeficient for limit power under crit alt
    local t_coef = interpolate(t_table, get(sim_T))

    -- RUD calculations
    local rud_minimum = 0.12 + get(rud_close_pos) * 2 / 100
    local stop_active = get(rud_close) == 0
    local stop_active_ru19 = get(rud_close_ru19) == 0
    local stopor_active = get(rud_stopor) > 0.5
    local heat = get(wing_ht) -- Wing heat takes some power from engines

    -- Limit left rud
    local left_rud = get(drf_engn.thro_comm_1)
    if left_rud < rud_minimum and rud1_out then left_rud = rud_minimum end
    -- Check if rud were out from stop
    if left_rud >= rud_minimum and stop_active then rud1_out = true
    else rud1_out = false end
    -- Set result
    if not stopor_active then left_rud_last = left_rud end
    set(drf_engn.virt_rud1, left_rud_last)


    -- Limit right rud
    local right_rud = get(drf_engn.thro_comm_2)
    if right_rud < rud_minimum and rud2_out then right_rud = rud_minimum end
    -- Check if rud were out from stop
    if right_rud >= rud_minimum and stop_active then rud2_out = true
    else rud2_out = false end
    -- Set result
    if not stopor_active then right_rud_last = right_rud end
    set(drf_engn.virt_rud2, right_rud_last)

    -- Limit third RUD
    local third_rud = get(drf_engn.thro_comm_3)
    -- Check if RUD were out from stop
    if third_rud < 0.05 and get(drf_engn.virt_rud3) ~= 0 and rud3_out then third_rud = 0.05 set(drf_engn.thro_comm_3,0.05) end
    if third_rud >= 0.05 and stop_active_ru19 then rud3_out = true else rud3_out = false end
    if not stopor_active then third_rud_last = third_rud end
    if get(drf_engn.virt_rud3) < 0.05 and stop_active_ru19 then
      third_rud_last = 0
      set(drf_engn.thro_comm_3,0)
    end
    set(drf_engn.virt_rud3, third_rud_last)

    -- Left engine
    local left_throttle = interpolate(tro_table, math.max(0, left_rud_last - heat * 0.04)) * alt_coef * t_coef
    set(drf_engn.thro_need_1, smooth(left_throttle, left_rud_need))

    -- Right engine
    local right_throttle = interpolate(tro_table, math.max(0, right_rud_last - heat * 0.04)) * alt_coef * t_coef
    set(drf_engn.thro_need_2, smooth(right_throttle, right_rud_need))

    -- RU19
    local alt_coef_ru19 = interpolate(alt_table_ru19, alt + alt_baro) -- Altitude coeficient for limit power under crit alt
    local t_coef_ru19 = interpolate(t_table_ru19, get(sim_T))
    local ru19_throttle = interpolate(tro_table_ru19, third_rud_last) * alt_coef_ru19 * t_coef_ru19
    set(drf_engn.thro_need_3, smooth(ru19_throttle, ru19_rud_need))
  end
end

function onModuleDone()
  set(thro_over, 0) -- Release engine control via plugin to let other models fly :)
  print("All throttles released...")
end

-- this is engine logic
-- define property table
-- source
bus_DC_27_volt = globalPropertyf("an-24rv/power/bus_DC_27_volt")
tro_all = globalPropertyf("sim/cockpit2/engine/actuators/throttle_ratio_all")
tro_comm_1 = globalProperty("sim/flightmodel/engine/ENGN_thro[0]")
tro_comm_2 = globalProperty("sim/flightmodel/engine/ENGN_thro[1]")
tro_comm_3 = globalProperty("sim/flightmodel/engine/ENGN_thro[2]")
msl_alt = globalPropertyf("sim/flightmodel/position/elevation") -- barometric alt. maybe in feet, maybe in meters
baro_press = globalPropertyf("sim/weather/barometer_sealevel_inhg") -- pressire at sea level in.Hg
wing_ht = globalPropertyi("sim/cockpit/switches/anti_ice_surf_heat") -- on/off wing heat
sc_control_1 = globalPropertyi("scp/api/hascontrol_1") -- SmartCopilot control holding DR
-- controls
tro_need_1 = globalProperty("sim/flightmodel/engine/ENGN_thro_use[0]")
tro_need_2 = globalProperty("sim/flightmodel/engine/ENGN_thro_use[1]")
tro_need_3 = globalProperty("sim/flightmodel/engine/ENGN_thro_use[2]")
prop_RPM = globalPropertyf("sim/cockpit2/engine/actuators/prop_rotation_speed_rad_sec_all") -- propeller RPM, 0 - 130.381622
stopor = globalProperty("sim/flightmodel2/misc/custom_slider_ratio[19]")
sim_T = globalPropertyf("sim/weather/temperature_ambient_c") -- temperature on sea level
override = globalPropertyi("sim/operation/override/override_throttles")
-- aircraft property
virt_rud1 = globalPropertyf("an-24rv/misc/virt_rud1")
virt_rud2 = globalPropertyf("an-24rv/misc/virt_rud2")
virt_rud3 = globalPropertyf("an-24rv/misc/virt_rud3")
rud_close = globalPropertyi("an-24rv/misc/rud_close")
rud_close_ru19 = globalPropertyi("an-24rv/misc/rud_close_ru19")
rud_close_pos = globalPropertyi("an-24rv/misc/rud_close_pos")
switch_rud = globalPropertyi("an-24rv/set/switch_rud") -- switch or hold rud stopors
switch_rud19 = globalPropertyi("an-24rv/set/switch_rud19") -- switch or hold rud stopors
frame_time = globalPropertyf("an-24rv/time/frame_time") -- time for frames
flight_time = globalPropertyf("sim/time/total_running_time_sec") -- sim time

rud_stop_pos_up = findCommand("sim/flight_controls/speed_brakes_up_one")
function rud_stop_pos_up_handler(phase)
  if 0 == phase then
    local a = get(rud_close_pos) + 1
    if a > 5 then a = 5 end
    set(rud_close_pos, a)
  end
  return 0
end
registerCommandHandler(rud_stop_pos_up, 0, rud_stop_pos_up_handler)

rud_stop_pos_down = findCommand("sim/flight_controls/speed_brakes_down_one")
function rud_stop_pos_down_handler(phase)
  if 0 == phase then
    local a = get(rud_close_pos) - 1
    if a < 0 then a = 0 end
    set(rud_close_pos, a)
  end
  return 0
end
registerCommandHandler(rud_stop_pos_down, 0, rud_stop_pos_down_handler)

rud_stop = findCommand("sim/flight_controls/tailhook_up")
function rud_stop_handler(phase)
  if 1 == phase then
    set(rud_close, 1)
  else
    set(rud_close, 0)
  end
  return 0
end
registerCommandHandler(rud_stop, 0, rud_stop_handler)

rud_ru19_stop = findCommand("sim/flight_controls/tailhook_down")
function rud_ru19_stop_handler(phase)
  if 1 == phase then
    set(rud_close_ru19, 1)
  else
    set(rud_close_ru19, 0)
    if 2 == phase then
      if get(rud_close_ru19) == 0 and math.floor(get(tro_comm_3)*100)*0.01 == 0 and math.floor(get(virt_rud3)*100)*0.01 == 0 then
        set(tro_comm_3, 0.05)
        set(virt_rud3, 0.05)
      elseif get(rud_close_ru19) == 0 and math.floor(get(tro_comm_3)*100)*0.01 <= 0.05 and math.floor(get(virt_rud3)*100)*0.01 == 0.05 then
        set(tro_comm_3, 0)
        set(virt_rud3, 0)
      end
    end
  end
  return 0
end
registerCommandHandler(rud_ru19_stop, 0, rud_ru19_stop_handler)

set(rud_close, 0)
set(rud_close_ru19, 0)

--[[
commands
sim/flight_controls/speed_brakes_down_one
sim/flight_controls/speed_brakes_up_one
sim/flight_controls/nwheel_steer_toggle
sim/flight_controls/deploy_parachute
sim/flight_controls/water_scoop_toggle
sim/flight_controls/tailhook_down
sim/flight_controls/tailhook_up
--]]

-- table of throttles
local tro_table = {{ 0.00, 0.03 }, -- IDLE
                  {  0.05, 0.10 },
                  {  0.12, 0.15 },
                  {  0.20, 0.23 },
                  {  0.25, 0.25 },
                  {  0.30, 0.41 },
                  {  0.52, 0.60 },
                  {  0.65, 0.70 }, -- nominal
                  {  0.75, 0.86 },
                  {  0.87, 0.94 },
                  {  0.95, 1.00 }} -- takeoff

-- tables for altitude correction
local alt_table = {{-50000, 0.65   }, -- bug workaround
                  {   0.00, 0.65   }, -- on standard pressure zero level
                  {   4000, 0.745  }, -- 4000 ft
                  {  8000, 0.87    }, -- 8000 ft
                  {  12000, 1.015  },
                  {  15000, 1.050  }, -- 15000 ft
                  {  17000, 1.10   },
                  {  19000, 1.20   },
                  {  21000, 1.30   },
                  {  30000, 1.5    },
                  {  100000, -0.50 }} -- linear above 15000 ft

local t_table = {{ -1000, 0.6 }, -- bug workaround
                { -30, 0.83   }, -- -30 C
                { -10, 0.90   }, -- -10 C
            	{  0,  0.931  }, --  0 C
            	{  15, 1.00   }, -- standard temperature
            	{  50, 1.1    }, --  +50 C
            	{  1000, 1.0  }} -- bug workaround

-- table of throttles for Ru19
local tro_table_ru19 = {{ 0.00, -1 },
            	       {  0.05, 0.10 },
            	       {  0.12, 0.20 },
            	       {  0.21, 0.25 },
            	       {  0.30, 0.35 },
            	       {  0.40, 0.45 },
            	       {  0.50, 0.60 },
            	       {  0.65, 0.75 }, -- nominal
            	       {  0.80, 0.90 }, -- 0.8 nominal
            	       {  1.00, 1.00 }} -- nominal(takeoff)

-- tables for altitude correction
local alt_table_ru19 = {{ -50000, 1  }, -- bug workaround
            	       {  0.00, 0.8  },   -- on standard pressure zero level
            	       {  4000, 0.85 }, -- 4000 ft
            	       {  8000, 0.90 }, -- 8000 ft
            	       {  13000, 1   }, -- 13000 ft
            	       {  100000,-0.5}} -- linear above 13000 ft

local t_table_ru19 = {{ -1000, 1.00}, -- bug workaround
            	     {  -30, 1.00  }, -- -30 C
            	     {   0,  1.00  }, -- 0 C
            	     {   15, 1.00  }, -- standard temperature
            	     {   50, 1.00  }, -- +50 C
            	     {   1000, 1.0 }} -- bug workaround

-- interpolate values using table as reference
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

--set(rud_close_pos, 0)
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

function update()
  -- time calculations
  local passed = get(frame_time)

  -- init
  if not initialized and counter > 0.3 and counter < 0.5 then
    set(override, 1) -- Used for take control via plugin. Inside update, bacause XPUIPC reseting overrides on load.
    set(tro_need_1, 0.2)
    set(tro_need_2, 0.2)
    set(tro_need_3, 0.2)
    initialized = true
  elseif not initialized then
    counter = counter + passed
  end

  -- time bug workaround
  if passed > 0 then
    -- set prop RPM to max
    set(prop_RPM, 130.381622)

    -- altitude calculations
    local alt = get(msl_alt) * 3.28083 -- MSL alt in feet
    local alt_baro = (29.92 - get(baro_press)) * 1000
    local alt_coef = interpolate(alt_table, alt + alt_baro)  -- altitude coeficient for limit power under crit alt
    local t_coef = interpolate(t_table, get(sim_T))

    -- rud calculations
    local rud_minimum = 0.12 + get(rud_close_pos) * 2 / 100
    local stop_active = get(rud_close) == 0
    local stop_active_ru19 = get(rud_close_ru19) == 0
    local stopor_active = get(stopor) > 0.5
    local heat = get(wing_ht)  -- wing heat takes some power from engines
    --if get(sc_control_1) ~= 1 then

    -- limit left rud
    local left_rud = get(tro_comm_1)
    if left_rud < rud_minimum and rud1_out then left_rud = rud_minimum end

    -- check if rud were out from stop
    if left_rud >= rud_minimum and stop_active then rud1_out = true
    else rud1_out = false end

    -- set result
    if not stopor_active then left_rud_last = left_rud end
    set(virt_rud1, left_rud_last)

    -- limit right rud
    local right_rud = get(tro_comm_2)
    if right_rud < rud_minimum and rud2_out then right_rud = rud_minimum end

    -- check if rud were out from stop
    if right_rud >= rud_minimum and stop_active then rud2_out = true
    else rud2_out = false end

    -- set result
    if not stopor_active then right_rud_last = right_rud end
    set(virt_rud2, right_rud_last)
    -- limit third rud
    local third_rud = get(tro_comm_3)
    -- check if rud were out from stop
    if third_rud < 0.05 and get(virt_rud3) ~= 0 and rud3_out then third_rud = 0.05 set(tro_comm_3,0.05) end
    if third_rud >= 0.05 and stop_active_ru19 then rud3_out = true else rud3_out = false end

    -- set result
    if not stopor_active then third_rud_last = third_rud end
    if get(virt_rud3) < 0.05 and stop_active_ru19 then 
      third_rud_last = 0
      set(tro_comm_3,0)
    end
    set(virt_rud3, third_rud_last)
    -- set results for engine throttles
    -- left engine
    local left_throttle = interpolate(tro_table, math.max(0, left_rud_last - heat * 0.04)) * alt_coef * t_coef
    --smooth move
    if left_throttle > left_rud_need then left_rud_need = left_rud_need + (left_throttle - left_rud_need) * passed / 2
    elseif left_throttle < left_rud_need then left_rud_need = left_rud_need + (left_throttle - left_rud_need) * passed / 1 end
    -- set result
    set(tro_need_1, left_rud_need)

    -- right engine
    local right_throttle = interpolate(tro_table, math.max(0, right_rud_last - heat * 0.04)) * alt_coef * t_coef
    --smooth move
    if right_throttle > right_rud_need then right_rud_need = right_rud_need + (right_throttle - right_rud_need) * passed / 2
    elseif right_throttle < right_rud_need then right_rud_need = right_rud_need + (right_throttle - right_rud_need) * passed / 1 end
    -- set result
    set(tro_need_2, right_rud_need)

    -- RU19
    local alt_coef_ru19 = interpolate(alt_table_ru19, alt + alt_baro)  -- altitude coeficient for limit power under crit alt
    local t_coef_ru19 = interpolate(t_table_ru19, get(sim_T))
    local ru19_throttle = interpolate(tro_table_ru19, third_rud_last) * alt_coef_ru19 * t_coef_ru19

    --smooth move
    if ru19_throttle > ru19_rud_need then ru19_rud_need = ru19_rud_need + (ru19_throttle - ru19_rud_need) * passed / 1
    elseif ru19_throttle < ru19_rud_need then ru19_rud_need = ru19_rud_need + (ru19_throttle - ru19_rud_need) * passed / 1 end
    -- set result
    set(tro_need_3, ru19_rud_need)
  end
end

function onAvionicsDone()
  set(override, 0) -- release engine control via plugin to let other models fly :)
  print("All throttles released...")
end

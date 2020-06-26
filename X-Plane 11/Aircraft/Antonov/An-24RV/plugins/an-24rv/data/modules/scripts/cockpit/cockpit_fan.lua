-- this is cockpit ventilator angle calculations
bus_DC_27_volt = globalPropertyf("an-24rv/power/bus_DC_27_volt")
cam_in_cockpit = globalPropertyi("sim/graphics/view/view_is_external")
frame_time = globalPropertyf("an-24rv/time/frame_time")
vent_1 = globalPropertyf("an-24rv/misc/vent_1")
vent_2 = globalPropertyf("an-24rv/misc/vent_2")
vent_3 = globalPropertyf("an-24rv/misc/vent_3")
vent_4 = globalPropertyf("an-24rv/misc/vent_4")
vent_1_sw = globalPropertyi("an-24rv/misc/vent_1_sw")
vent_2_sw = globalPropertyi("an-24rv/misc/vent_2_sw")
vent_3_sw = globalPropertyi("an-24rv/misc/vent_3_sw")
vent_4_sw = globalPropertyi("an-24rv/misc/vent_4_sw")
vent_1_op = globalPropertyi("an-24rv/misc/vent_1_op")
vent_2_op = globalPropertyi("an-24rv/misc/vent_2_op")
vent_3_op = globalPropertyi("an-24rv/misc/vent_3_op")
vent_4_op = globalPropertyi("an-24rv/misc/vent_4_op")

local vent1_spd = 0
local vent2_spd = 0
local vent3_spd = 0
local vent4_spd = 0

local UP_SPD = 300
local DN_SPD = 100
local MAX_SPD = 1000  -- deg per second

function update()
  local passed = get(frame_time)
  local power = get(bus_DC_27_volt) > 21
	
  -- vent 1
  if power and get(vent_1_sw) == 1 then
    set(vent_1_op,1)
    vent1_spd = vent1_spd + UP_SPD * passed
  else
    set(vent_1_op,0)
    vent1_spd = vent1_spd - DN_SPD * passed
  end
  if vent1_spd > MAX_SPD then
    vent1_spd = MAX_SPD
  elseif vent1_spd < 0 then
    vent1_spd = 0
  end
  set(vent_1, get(vent_1) + vent1_spd * passed)
  if get(vent_1) > 360 then set(vent_1,0) end

  -- vent 2
  if power and get(vent_2_sw) == 1 then
    set(vent_2_op,1)
    vent2_spd = vent2_spd + UP_SPD * passed
  else
    set(vent_2_op,0)
    vent2_spd = vent2_spd - DN_SPD * passed
  end
  if vent2_spd > MAX_SPD then
    vent2_spd = MAX_SPD
  elseif vent2_spd < 0 then
    vent2_spd = 0
  end
  set(vent_2, get(vent_2) + vent2_spd * passed)
  if get(vent_2) > 360 then set(vent_2,0) end
	
  -- vent 3
  if power and get(vent_3_sw) == 1 then
    set(vent_3_op,1)
    vent3_spd = vent3_spd + UP_SPD * passed
  else
    set(vent_3_op,0)
    vent3_spd = vent3_spd - DN_SPD * passed
  end
  if vent3_spd > MAX_SPD then
    vent3_spd = MAX_SPD
  elseif vent3_spd < 0 then
    vent3_spd = 0
  end
  set(vent_3, get(vent_3) + vent3_spd * passed)
  if get(vent_3) > 360 then set(vent_3,0) end

  -- vent 4
  if power and get(vent_4_sw) == 1 then
    set(vent_4_op,1)
    vent4_spd = vent4_spd + UP_SPD * passed
  else
    set(vent_4_op,0)
    vent4_spd = vent4_spd - DN_SPD * passed
  end
  if vent4_spd > MAX_SPD then
    vent4_spd = MAX_SPD
  elseif vent4_spd < 0 then
    vent4_spd = 0
  end
  set(vent_4, get(vent_4) + vent4_spd * passed)
  if get(vent_4) > 360 then set(vent_4,0) end
end

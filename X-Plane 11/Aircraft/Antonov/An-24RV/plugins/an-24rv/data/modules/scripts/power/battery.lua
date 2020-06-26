battery_on = globalPropertyi("an-24rv/battery_on")
bus_DC_27_volt = globalPropertyf("an-24rv/power/bus_DC_27_volt")

local initialized = false

function init()
  ground_available = globalPropertyf("an-24rv/power/ground_available")
  hide_GPS = globalPropertyf("an-24rv/set/hide_GPS")
  initialized = true
end

function update()
  if not initialized then
    init()
  end
  if get(bus_DC_27_volt) > 19 or get(ground_available) == 1 then set(battery_on, 1) else set(battery_on, 0) end
end

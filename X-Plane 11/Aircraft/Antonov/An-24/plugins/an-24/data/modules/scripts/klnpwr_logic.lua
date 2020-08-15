--[[

  File: klnpwr_logic.lua
  -----
  Power state for KLN90B
  0 - no power
  1 - power available (If plane powered from battery or ground power)
  Workaround for keep power for KLN90B when switching between ground/aircraft power

--]]

local initialized = false
local avail = cGPi(pfx.."power/available")

local function init()
  ground_available = gPi(pfx.."power/ground_available")
  initialized = true
end

function update()
  if not initialized then init() end
  setbool(avail, gvar.bus_dc27v > 19 or gvar.bus_dc27ve > 19 or gvar.bus_ac36v > 35 or gvar.bus_ac115v > 110 or get(ground_available) == 1)
end

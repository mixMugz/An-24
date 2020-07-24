--[[

  File: klnpwr_logic.lua
  -----
  Power state for KLN90B
  0 - no power
  1 - power available (If plane powered from battery or ground power)
  Workaround for keep power for KLN90B when switching between ground/aircraft power

--]]

local initialized = false
local avail = cPPi("power/available")

local function init()
  ground_available = pPi("power/ground_available")
  initialized = true
end

function update()
  if not initialized then init() end
  setbool(avail, gvar.bus_dc27 > 19 or get(ground_available) == 1)
end

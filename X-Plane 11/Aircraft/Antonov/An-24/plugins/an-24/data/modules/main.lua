--[[

  File: main.lua
  -----
  Main project script

--]]

-- Project setting
size = {2048, 2048}
panelWidth3d = 2048 --I don't know why, but without those lines you cannot get the coords to work right
panelHeight3d = 2048
panel2d = false
project = "an-24" -- Project name
pfx = project.."/" -- Prefix for dataref creation

-- Set SASL3 options
setAircraftPanelRendering(true)
setInteractivity(true)
set3DRendering(true)
setRenderingMode2D(SASL_RENDER_2D_MULTIPASS)
setPanelRenderingMode(SASL_RENDER_PANEL_DEFAULT)

-- Add search path's for modules,  and all others files
addSearchPath(moduleDirectory.."/scripts")
addSearchPath(moduleDirectory.."/images")
addSearchPath(moduleDirectory.."/fonts")

-- Loading message
print("Antonov An-24 (Twin Turboprop)")
print("---------")

-- Include scripts
include "glbl_func.lua"
include "glbl_drfs.lua"

-- Set global variables
gvar = {
  frame_time = 0,
  bus_dc27v = 0,
  bus_dc27ve = 0,
  bus_dc27a = 0,
  bus_dc27ae = 0,
  bus_ac36v = 0,
  bus_ac36a = 0,
  bus_ac115v = 0,
  bus_ac115a = 0,
}

-- Load all components
components = {
  cockpit_fan_anim {},
  engine_logic     {},
  gns430_anim      {},
  klnpwr_logic     {},
  prop_anim        {},
}

-- End loading message
print("---------")

-- Main functions
function update()
  -- Update all global variables
  gvar.frame_time = get(drf_main.frame_time)
  gvar.bus_dc27v = get(drf_pwr.bus_dc27v)
  gvar.bus_dc27ve = get(drf_pwr.bus_dc27ve)
  gvar.bus_dc27a = get(drf_pwr.bus_dc27a)
  gvar.bus_dc27ae = get(drf_pwr.bus_dc27ae)
  gvar.bus_ac36v = get(drf_pwr.bus_ac36v)
  gvar.bus_ac36a = get(drf_pwr.bus_ac36a)
  gvar.bus_ac115v = get(drf_pwr.bus_ac115v)
  gvar.bus_ac115a = get(drf_pwr.bus_ac115a)

  updateAll(components)
end

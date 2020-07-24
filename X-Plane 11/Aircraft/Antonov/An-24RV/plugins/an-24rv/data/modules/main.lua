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
project = "an-24rv"

-- Set SASL3 options
setAircraftPanelRendering(true)
setInteractivity(true)
set3DRendering(true)
setRenderingMode2D(SASL_RENDER_2D_MULTIPASS)
setPanelRenderingMode(SASL_RENDER_PANEL_DEFAULT)

-- Add search path's for modules,  and all others files
addSearchPath(moduleDirectory.."/scripts")
addSearchPath(moduleDirectory.."/resources")

-- Include scripts
include "glbl_func.lua"
include "glbl_drfs.lua"
include "glbl_vars.lua"

-- Load all components
components = {
  garmin_anim      {},
  cockpit_fan_anim {},
  engine_logic     {},
  klnpwr_logic     {},
}

function update()
  -- update all global variables
  gvar.frame_time = get(drf_main.frame_time)
  gvar.bus_dc27 = get(drf_pwr.bus_dc27)
  gvar.lang = get(drf_set.lang)
  updateAll(components)
end

-- experemental

-- function show_hide()
-- 	popup:setIsVisible(not popup:isVisible())
-- end

-- local status	= true

-- will be called when clicking on the first menu
--function change_menu()
	-- flip status
--	status = not status
	-- update status of menu entry (normal or greyed)
--	sasl.enableMenuItem(menu_main, menu_action, status and 1 or 0)
	-- change menu text accordingly
--	sasl.setMenuItemName(menu_main, menu_option, status and "Disable show/hide" or "Enable show/hide")
	-- check menu if enabled
--	sasl.setMenuItemState(menu_main, menu_option, status and MENU_CHECKED or MENU_UNCHECKED)
--end

-- create our top level menu in plugins menu
--menu_master	= sasl.appendMenuItem (PLUGINS_MENU_ID, "An-24RV" )
-- make our menu entry a submenu
--menu_main	= sasl.createMenu ("", PLUGINS_MENU_ID, menu_master)
-- add a menu entry
--menu_option	= sasl.appendMenuItem(menu_main, "Enable show/hide", change_menu)
-- add separator
--sasl.appendMenuSeparator(menu_main)
-- add menu entry
--menu_action	= sasl.appendMenuItem(menu_main, "Show/hide popup", show_hide)
-- set initial state
--change_menu()

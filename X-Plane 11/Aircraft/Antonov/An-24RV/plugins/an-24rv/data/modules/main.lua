-- Main start script
size = {2048, 2048}
panel2d = false
panelWidth3d = 2048 --I don't know why, but without those lines you cannot get the coords to work right
panelHeight3d = 2048
sasl.options.setAircraftPanelRendering(true)
sasl.options.setInteractivity(true)
sasl.options.set3DRendering(true)
sasl.options.setRenderingMode2D(SASL_RENDER_2D_MULTIPASS)
sasl.options.setPanelRenderingMode(SASL_RENDER_PANEL_DEFAULT)

-- Search path's for modules, sounds and all others files
addSearchPath(moduleDirectory.."/scripts")
addSearchPath(moduleDirectory.."/scripts/menu")
addSearchPath(moduleDirectory.."/scripts/misc")
addSearchPath(moduleDirectory.."/scripts/power")
addSearchPath(moduleDirectory.."/scripts/kln90b")
addSearchPath(moduleDirectory.."/scripts/engine")
addSearchPath(moduleDirectory.."/scripts/cockpit")
addSearchPath(moduleDirectory.."/scripts/datarefs")
addSearchPath(getAircraftPath().."/sounds")
addSearchPath(getAircraftPath().."/sounds/kln90b")

components = {
--  main_menu {},
  datarefs_main {},
  datarefs_power {},
  datarefs_engine {},
  datarefs_settings {},
  datarefs_cockpit {},
  datarefs_lights {},
  battery {},
  kln90_loader {},
  cockpit_fan {},
  engine_logic {},
}

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

--[[
function draw()
  drawAll(components)
end
--]]

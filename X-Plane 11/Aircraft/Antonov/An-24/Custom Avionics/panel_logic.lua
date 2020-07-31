-- panel switchers
defineProperty("main_menu_subpanel", globalPropertyi("an-24/panels/main_menu_subpanel"))
defineProperty("menu_logo", globalPropertyi("an-24/panels/menu_logo"))
defineProperty("nav1_subpanel", globalPropertyi("an-24/panels/nav1_subpanel"))
defineProperty("nav2_subpanel", globalPropertyi("an-24/panels/nav2_subpanel"))
defineProperty("electropanel_subpanel", globalPropertyi("an-24/panels/electropanel_subpanel"))
defineProperty("left_subpanel", globalPropertyi("an-24/panels/left_subpanel"))
defineProperty("ap_panel_subpanel", globalPropertyi("an-24/panels/ap_panel_subpanel"))
defineProperty("right_subpanel", globalPropertyi("an-24/panels/right_subpanel"))
defineProperty("nl10m_subpanel", globalPropertyi("an-24/panels/nl10m_subpanel"))
defineProperty("radio_subpanel", globalPropertyi("an-24/panels/radio_subpanel"))
defineProperty("service_subpanel", globalPropertyi("an-24/panels/service_subpanel"))
defineProperty("payload_subpanel", globalPropertyi("an-24/panels/payload_subpanel"))
defineProperty("options_subpanel", globalPropertyi("an-24/panels/options_subpanel"))
defineProperty("fuel_subpanel", globalPropertyi("an-24/panels/fuel_subpanel"))
defineProperty("map_subpanel", globalPropertyi("an-24/panels/map_subpanel"))
defineProperty("info_subpanel", globalPropertyi("an-24/panels/info_subpanel"))
defineProperty("camera_subpanel", globalPropertyi("an-24/panels/camera_subpanel"))
defineProperty("rsbn_subpanel", globalPropertyi("an-24/panels/rsbn_subpanel"))
defineProperty("nas1_subpanel", globalPropertyi("an-24/panels/nas1_subpanel"))
defineProperty("uphone_subpanel", globalPropertyi("an-24/panels/uphone_subpanel"))
defineProperty("fplan_subpanel", globalPropertyi("an-24/panels/fplan_subpanel"))
defineProperty("hdr_setting", globalPropertyi("sim/graphics/settings/HDR_on"))


-- get panels for manipulate them
defineProperty("panel_1")
defineProperty("panel_2")
defineProperty("panel_3")
defineProperty("panel_4")
defineProperty("panel_5")
defineProperty("panel_6")
defineProperty("panel_7")
defineProperty("panel_8")
defineProperty("panel_9")
defineProperty("panel_10")
defineProperty("panel_11")
defineProperty("panel_12")
defineProperty("panel_13")
defineProperty("panel_14")
defineProperty("panel_15")
defineProperty("panel_16")
defineProperty("panel_17")
defineProperty("panel_18")
defineProperty("panel_19")
defineProperty("panel_20")
defineProperty("panel_21")
defineProperty("panel_22")

--[[
	panel_1 = main_menu
	panel_2 = nav_panel1
	panel_3 = nav_panel2
	panel_4 = electropanel
	panel_5 = fuel_panel
	panel_6 = left_panel
	panel_7 = right_panel
	panel_8 = ap_panel
	panel_9 = radio_panel
	panel_10 = service_panel
	panel_11 = payload
	panel_12 = nl10m_panel
	panel_13 = map_panel
	panel_14 = options
	panel_15 = info panel
    panel_16 = camera panel
    panel_21 = menu logo
    panel_22 = menu flashlight
--]]

  local p1 = get(panel_1)
  local p2 = get(panel_2)
  local p3 = get(panel_3)
  local p4 = get(panel_4)
  local p5 = get(panel_5)
  local p6 = get(panel_6)
  local p7 = get(panel_7)
  local p8 = get(panel_8)
  local p9 = get(panel_9)
  local p10 = get(panel_10)
  local p11 = get(panel_11)
  local p12 = get(panel_12)
  local p13 = get(panel_13)
  local p14 = get(panel_14)
  local p15 = get(panel_15)
  local p16 = get(panel_16)
  local p17 = get(panel_17)
  local p18 = get(panel_18)
  local p19 = get(panel_19)
  local p20 = get(panel_20)
  local p21 = get(panel_21)
  local p22 = get(panel_22)

-- create commands for panels
local main_menu_subpanel_command = createCommand("An-24/Panels/panel_1", "Main menu")
function main_menu_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(main_menu_subpanel) ~= 0 then
                set(main_menu_subpanel, 0)
            else
                set(main_menu_subpanel, 1)
				movePanelToTop(p1)
            end
    end
return 0
end
registerCommandHandler(main_menu_subpanel_command, 0, main_menu_subpanel_handler)

local nav1_subpanel_command = createCommand("An-24/Panels/panel_2", "Navigation #1 panel")
function nav1_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(nav1_subpanel) ~= 0 then
                set(nav1_subpanel, 0)
            else
                set(nav1_subpanel, 1)
				movePanelToTop(p2)
            end
    end
return 0
end
registerCommandHandler(nav1_subpanel_command, 0, nav1_subpanel_handler)

local nav2_subpanel_command = createCommand("An-24/Panels/panel_3", "Navigation #2 panel")
function nav2_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(nav2_subpanel) ~= 0 then
                set(nav2_subpanel, 0)
            else
                set(nav2_subpanel, 1)
				movePanelToTop(p3)
            end
    end
return 0
end
registerCommandHandler(nav2_subpanel_command, 0, nav2_subpanel_handler)

local electropanel_subpanel_command = createCommand("An-24/Panels/panel_4", "Electric panel")
function electropanel_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(electropanel_subpanel) ~= 0 then
                set(electropanel_subpanel, 0)
            else
                set(electropanel_subpanel, 1)
				movePanelToTop(p4)
            end
    end
return 0
end
registerCommandHandler(electropanel_subpanel_command, 0, electropanel_subpanel_handler)

local fuel_subpanel_command = createCommand("An-24/Panels/panel_5", "Fuel panel")
function fuel_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(fuel_subpanel) ~= 0 then
                set(fuel_subpanel, 0)
            else
                set(fuel_subpanel, 1)
				movePanelToTop(p5)
            end
    end
return 0
end
registerCommandHandler(fuel_subpanel_command, 0, fuel_subpanel_handler)

local left_subpanel_command = createCommand("An-24/Panels/panel_6", "Laft (pilot) panel")
function left_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(left_subpanel) ~= 0 then
                set(left_subpanel, 0)
            else
                set(left_subpanel, 1)
				movePanelToTop(p6)
            end
    end
return 0
end
registerCommandHandler(left_subpanel_command, 0, left_subpanel_handler)

local right_subpanel_command = createCommand("An-24/Panels/panel_7", "Right (Copilot) panel")
function right_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(right_subpanel) ~= 0 then
                set(right_subpanel, 0)
            else
                set(right_subpanel, 1)
				movePanelToTop(p7)
            end
    end
return 0
end
registerCommandHandler(right_subpanel_command, 0, right_subpanel_handler)

local ap_panel_subpanel_command = createCommand("An-24/Panels/panel_8", "Autopilot panel")
function ap_panel_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(ap_panel_subpanel) ~= 0 then
                set(ap_panel_subpanel, 0)
            else
                set(ap_panel_subpanel, 1)
				movePanelToTop(p8)
            end
    end
return 0
end
registerCommandHandler(ap_panel_subpanel_command, 0, ap_panel_subpanel_handler)

local radio_subpanel_command = createCommand("An-24/Panels/panel_9", "Radio panel")
function radio_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(radio_subpanel) ~= 0 then
                set(radio_subpanel, 0)
            else
                set(radio_subpanel, 1)
				movePanelToTop(p9)
            end
    end
return 0
end
registerCommandHandler(radio_subpanel_command, 0, radio_subpanel_handler)

local service_subpanel_command = createCommand("An-24/Panels/panel_10", "Service panel")
function service_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(service_subpanel) ~= 0 then
                set(service_subpanel, 0)
            else
                set(service_subpanel, 1)
				movePanelToTop(p10)
            end
    end
return 0
end
registerCommandHandler(service_subpanel_command, 0, service_subpanel_handler)

local payload_subpanel_command = createCommand("An-24/Panels/panel_11", "Payload panel")
function payload_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(payload_subpanel) ~= 0 then
                set(payload_subpanel, 0)
            else
                set(payload_subpanel, 1)
				movePanelToTop(p11)
            end
    end
return 0
end
registerCommandHandler(payload_subpanel_command, 0, payload_subpanel_handler)

local nl10m_subpanel_command = createCommand("An-24/Panels/panel_12", "NL10m panel")
function nl10m_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(nl10m_subpanel) ~= 0 then
                set(nl10m_subpanel, 0)
            else
                set(nl10m_subpanel, 1)
				movePanelToTop(p12)
            end
    end
return 0
end
registerCommandHandler(nl10m_subpanel_command, 0, nl10m_subpanel_handler)

local map_subpanel_command = createCommand("An-24/Panels/panel_13", "Map panel")
function map_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(map_subpanel) ~= 0 then
                set(map_subpanel, 0)
            else
                set(map_subpanel, 1)
				movePanelToTop(p13)
            end
    end
return 0
end
registerCommandHandler(map_subpanel_command, 0, map_subpanel_handler)

local options_subpanel_command = createCommand("An-24/Panels/panel_14", "Options panel")
function options_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(options_subpanel) ~= 0 then
                set(options_subpanel, 0)
            else
                set(options_subpanel, 1)
				movePanelToTop(p14)
            end
    end
return 0
end
registerCommandHandler(options_subpanel_command, 0, options_subpanel_handler)

local info_subpanel_command = createCommand("An-24/Panels/panel_15", "Info panel")
function info_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(info_subpanel) ~= 0 then
                set(info_subpanel, 0)
            else
                set(info_subpanel, 1)
				movePanelToTop(p15)
            end
    end
return 0
end
registerCommandHandler(info_subpanel_command, 0, info_subpanel_handler)

local camera_subpanel_command = createCommand("An-24/Panels/panel_16", "Camera panel")
function camera_subpanel_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if 0 == phase then
            if get(camera_subpanel) ~= 0 then
                set(camera_subpanel, 0)
            else
                set(camera_subpanel, 1)
				movePanelToTop(p16)
            end
    end
return 0
end
registerCommandHandler(camera_subpanel_command, 0, camera_subpanel_handler)

-- logic of show/hide menu
function update()
  p1 = get(panel_1)
  p2 = get(panel_2)
  p3 = get(panel_3)
  p4 = get(panel_4)
  p5 = get(panel_5)
  p6 = get(panel_6)
  p7 = get(panel_7)
  p8 = get(panel_8)
  p9 = get(panel_9)
  p10 = get(panel_10)
  p11 = get(panel_11)
  p12 = get(panel_12)
  p13 = get(panel_13)
  p14 = get(panel_14)
  p15 = get(panel_15)
  p16 = get(panel_16)
  p17 = get(panel_17)
  p18 = get(panel_18)
  p19 = get(panel_19)
  p20 = get(panel_20)
  p21 = get(panel_21)
  p22 = get(panel_22)

  -- set visible property
  p1.visible = get(main_menu_subpanel) == 1
  p2.visible = get(nav1_subpanel) == 1
  p3.visible = get(nav2_subpanel) == 1
  p4.visible = get(electropanel_subpanel) == 1
  p5.visible = get(fuel_subpanel) == 1
  p6.visible = get(left_subpanel) == 1
  p7.visible = get(right_subpanel) == 1
  p8.visible = get(ap_panel_subpanel) == 1
  p9.visible = get(radio_subpanel) == 1
  p10.visible = get(service_subpanel) == 1
  p11.visible = get(payload_subpanel) == 1
  p12.visible = get(nl10m_subpanel) == 1
  p13.visible = get(map_subpanel) == 1
  p14.visible = get(options_subpanel) == 1
  p15.visible = get(info_subpanel) == 1
  p16.visible = get(camera_subpanel) == 1
  p17.visible = get(rsbn_subpanel) == 1
  p18.visible = get(nas1_subpanel) == 1
  p19.visible = get(uphone_subpanel) == 1
  p20.visible = get(fplan_subpanel) == 1
  p21.visible = get(menu_logo) == 1
  p22.visible = get(main_menu_subpanel) == 1 and get(hdr_setting) == 1
end

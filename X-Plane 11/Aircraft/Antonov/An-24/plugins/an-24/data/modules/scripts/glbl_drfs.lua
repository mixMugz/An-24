--[[

  File: glbl_drfs.lua
  -----
  Declare all datarefs

--]]

-- Main
drf_main = {
  frame_time_old = cGPf(pfx.."time/frame_time"),
  frame_time = gPf("sim/operation/misc/frame_rate_period"),
}

-- Settings
drf_set = {
  gns430_pri = cGPi(pfx.."set/gns430_pri"), -- Primary GNS430 for pilot
  gns430_sec = cGPi(pfx.."set/gns430_sec"), -- Secondary GNS430 for copilot
  kln90b_pri = cGPi(pfx.."set/kln90b_pri"), -- Primary KLN90B for pilot
  kln90b_sec = cGPi(pfx.."set/kln90b_sec"), -- Secondary KLN90B for copilot
  kln_init = cGPi(pfx.."set/kln_init"), -- KLN90B init status
  lang = cGPi(pfx.."set/language"), -- Language selector: 0 - ENG, 1 - RUS
  switch_rud = cGPi(pfx.."set/switch_rud"), -- switch or hold RUD stopers
}

-- Power
drf_pwr = {
  bus_dc27v = cGPf(pfx.."power/bus_DC_27_volt", 27),
  bus_dc27ve = cGPf(pfx.."power/bus_DC_27_volt_emerg", 27),
  bus_dc27a = cGPf(pfx.."power/bus_DC_27_amp"),
  bus_dc27ae = cGPf(pfx.."power/bus_DC_27_amp_emerg"),
  bus_ac36v = cGPf(pfx.."power/bus_AC_36_volt", 36),
  bus_ac36a = cGPf(pfx.."power/bus_AC_36_amp"),
  bus_ac115v = cGPf(pfx.."power/bus_AC_115_volt", 115),
  bus_ac115a = cGPf(pfx.."power/bus_AC_115_amp"),
}

-- Engine
drf_engn = {
  engine_park = cGPia(pfx.."covers/engine_park", 2),
  thro_comm_1 = gP("sim/flightmodel/engine/ENGN_thro[0]"),
  thro_comm_2 = gP("sim/flightmodel/engine/ENGN_thro[1]"),
  thro_comm_3 = gP("sim/flightmodel/engine/ENGN_thro[2]"),
  thro_need_1 = gP("sim/flightmodel/engine/ENGN_thro_use[0]"),
  thro_need_2 = gP("sim/flightmodel/engine/ENGN_thro_use[1]"),
  thro_need_3 = gP("sim/flightmodel/engine/ENGN_thro_use[2]"),
  virt_rud1 = cGPf(pfx.."misc/virt_rud1"), -- virtual rud ENGN #1
  virt_rud2 = cGPf(pfx.."misc/virt_rud2"), -- virtual rud ENGN #2
  virt_rud3 = cGPf(pfx.."misc/virt_rud3"), -- virtual rud RU19
}

-- Lights
cfdlamp = cGPfa(pfx.."lights/CFDLAMP", 10)
ccfdlamp = cGPfa(pfx.."lights/CCFDLAMP", 10)
lfdlamp = cGPfa(pfx.."lights/LFDLAMP", 10)
rfdlamp = cGPfa(pfx.."lights/RFDLAMP", 10)
lfdgdl = cGPfa(pfx.."lights/LFDGaugesDownLeft", 10)
lfdgdr = cGPfa(pfx.."lights/LFDGaugesDownRight", 10)
lfdgul = cGPfa(pfx.."lights/LFDGaugesUpLeft", 10)
lfdgur = cGPfa(pfx.."lights/LFDGaugesUpRight", 10)
rfdgdl = cGPfa(pfx.."lights/RFDGaugesDownLeft", 10)
rfdgdr = cGPfa(pfx.."lights/RFDGaugesDownRight", 10)
rfdgul = cGPfa(pfx.."lights/RFDGaugesUpLeft", 10)
rfdgur = cGPfa(pfx.."lights/RFDGaugesUpRight", 10)
olb = cGPfa(pfx.."lights/overhead_lamp_bort", 10)
oll = cGPfa(pfx.."lights/overhead_lamp_left", 10)
olr = cGPfa(pfx.."lights/overhead_lamp_right", 10)
olpl = cGPfa(pfx.."lights/overhead_lamp_pilotleft", 10)
olpr = cGPfa(pfx.."lights/overhead_lamp_pilotright", 10)
olnl = cGPfa(pfx.."lights/overhead_lamp_navleft", 10)
olnr = cGPfa(pfx.."lights/overhead_lamp_navright", 10)
olrad = cGPfa(pfx.."lights/overhead_lamp_rad", 10)
-- Lights in the cockpit
ollb = cGPf(pfx.."lights/overhead_lamp_left_bright", 1)
ollm = cGPi(pfx.."lights/overhead_lamp_left_mode") -- 0 off, 1 red, 2 white
ollra = cGPf(pfx.."lights/overhead_lamp_left_rot_around")
ollru = cGPf(pfx.."lights/overhead_lamp_left_rot_updown", 45)
olrb = cGPf(pfx.."lights/overhead_lamp_right_bright", 1)
olrm = cGPi(pfx.."lights/overhead_lamp_right_mode") -- 0 off, 1 red, 2 white
olrra = cGPf(pfx.."lights/overhead_lamp_right_rot_around")
olrru = cGPf(pfx.."lights/overhead_lamp_right_rot_updown", 45)
olprb = cGPf(pfx.."lights/overhead_lamp_pilot_right_bright", 1)
olprm = cGPi(pfx.."lights/overhead_lamp_pilot_right_mode") -- 0 off, 1 red, 2 white
olprra = cGPf(pfx.."lights/overhead_lamp_pilot_right_rot_around")
olprru = cGPf(pfx.."lights/overhead_lamp_pilot_right_rot_updown", 45)
olplb = cGPf(pfx.."lights/overhead_lamp_pilot_left_bright", 1)
olplm = cGPi(pfx.."lights/overhead_lamp_pilot_left_mode") -- 0 off, 1 red, 2 white
olplra = cGPf(pfx.."lights/overhead_lamp_pilot_left_rot_around")
olplru = cGPf(pfx.."lights/overhead_lamp_pilot_left_rot_updown", 45)
olnlb = cGPf(pfx.."lights/overhead_lamp_nav_left_bright", 1)
olnlm = cGPi(pfx.."lights/overhead_lamp_nav_left_mode") -- 0 off, 1 red, 2 white
olnlra = cGPf(pfx.."lights/overhead_lamp_nav_left_rot_around")
olnlru = cGPf(pfx.."lights/overhead_lamp_nav_left_rot_updown", 50)
olnrb = cGPf(pfx.."lights/overhead_lamp_nav_right_bright", 1)
olnrm = cGPi(pfx.."lights/overhead_lamp_nav_right_mode") --0 off, 1 red, 2 white
olnrra = cGPf(pfx.."lights/overhead_lamp_nav_right_rot_around", 30)
olnrru = cGPf(pfx.."lights/overhead_lamp_nav_right_rot_updown", 30)
olradb = cGPf(pfx.."lights/overhead_lamp_rad_bright", 1)
olradm = cGPi(pfx.."lights/overhead_lamp_rad_mode") -- 0 off, 1 red, 2 white
olradra = cGPf(pfx.."lights/overhead_lamp_rad_rot_around", -6)
olradru = cGPf(pfx.."lights/overhead_lamp_rad_rot_updown", 20)

-- Animations
drf_anim = {
  crew = cGPi(pfx.."anim/crew"),
}

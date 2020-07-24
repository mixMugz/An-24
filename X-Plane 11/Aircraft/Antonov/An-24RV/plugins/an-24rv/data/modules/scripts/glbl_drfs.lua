--[[

  File: glbl_drfs.lua
  -----
  Declare all datarefs

--]]

-- Main
drf_main = {
  frame_time = cPPf("time/frame_time")
}

-- Settings
drf_set = {
  lang = cPPi("set/language"), -- language selector: 0 - ENG, 1 - RUS
  hide_gps = cPPi("set/hide_GPS", 1), -- by default GPS is hidden
  hide_gns420 = cPPi("set/hide_Garmin", 1), -- by default GNS420 is hidden
  kln_init = cPPi("set/kln_init"), -- KLN90B init status
  kln_l = cPPi("set/kln_l_is_present"), -- primary KLN90
  kln_r = cPPi("set/kln_r_is_present"), -- secondary KLN90
  switch_rud = cPPi("set/switch_rud"), -- switch or hold RUD stopers
}

-- Power
drf_pwr = {
  bus_dc27 = cPPf("power/bus_DC_27_volt", 27),
}

-- Engine
drf_engn = {
  virt_rud1 = cPPf("misc/virt_rud1", 0), -- virtual rud ENGN #1
  virt_rud2 = cPPf("misc/virt_rud2", 0), -- virtual rud ENGN #2
  virt_rud3 = cPPf("misc/virt_rud3", 0), -- virtual rud RU19
  rud_close = cPPi("misc/rud_close", 1), -- rud closeup for minimum at flight
  rud_close_ru19 = cPPi("misc/rud_close_ru19", 1), -- rud closeup for minimum at flight
  rud_close_pos = cPPi("misc/rud_close_pos", 0), -- rud closeup position for minimum at flight
}

-- Lights
lfdlamp = cPPfa("lights/LFDLAMP", 10)
cfdlamp = cPPfa("lights/CFDLAMP", 10)
ccfdlamp = cPPfa("lights/CCFDLAMP", 10)
rfdlamp = cPPfa("lights/RFDLAMP", 10)
lfdgdl = cPPfa("lights/LFDGaugesDownLeft", 10)
lfdgdr = cPPfa("lights/LFDGaugesDownRight", 10)
lfdgul = cPPfa("lights/LFDGaugesUpLeft", 10)
lfdgur = cPPfa("lights/LFDGaugesUpRight", 10)
rfdgdl = cPPfa("lights/RFDGaugesDownLeft", 10)
rfdgdr = cPPfa("lights/RFDGaugesDownRight", 10)
rfdgul = cPPfa("lights/RFDGaugesUpLeft", 10)
rfdgur = cPPfa("lights/RFDGaugesUpRight", 10)
olb = cPPfa("lights/overhead_lamp_bort", 10)
oll = cPPfa("lights/overhead_lamp_left", 10)
olr = cPPfa("lights/overhead_lamp_right", 10)
olpl = cPPfa("lights/overhead_lamp_pilotleft", 10)
olpr = cPPfa("lights/overhead_lamp_pilotright", 10)
olnl = cPPfa("lights/overhead_lamp_navleft", 10)
olnr = cPPfa("lights/overhead_lamp_navright", 10)
olrad = cPPfa("lights/overhead_lamp_rad", 10)
-- Lights in the cockpit
ollm = cPPi("lights/overhead_lamp_left_mode", 0) -- 0 off, 1 red, 2 white
ollb = cPPf("lights/overhead_lamp_left_bright", 1)
ollru = cPPf("lights/overhead_lamp_left_rot_updown", 45)
ollra = cPPf("lights/overhead_lamp_left_rot_around", 0)
olrm = cPPi("lights/overhead_lamp_right_mode", 0) -- 0 off, 1 red, 2 white
olrb = cPPf("lights/overhead_lamp_right_bright", 1)
olrru = cPPf("lights/overhead_lamp_right_rot_updown", 45)
olrra = cPPf("lights/overhead_lamp_right_rot_around", 0)
olprm = cPPi("lights/overhead_lamp_pilot_right_mode", 0) -- 0 off, 1 red, 2 white
olprb = cPPf("lights/overhead_lamp_pilot_right_bright", 1)
olprru = cPPf("lights/overhead_lamp_pilot_right_rot_updown", 45)
olprra = cPPf("lights/overhead_lamp_pilot_right_rot_around", 0)
olplm = cPPi("lights/overhead_lamp_pilot_left_mode", 0) -- 0 off, 1 red, 2 white
olplb = cPPf("lights/overhead_lamp_pilot_left_bright", 1)
olplru = cPPf("lights/overhead_lamp_pilot_left_rot_updown", 45)
olplra = cPPf("lights/overhead_lamp_pilot_left_rot_around", 0)
olnlm = cPPi("lights/overhead_lamp_nav_left_mode", 0) -- 0 off, 1 red, 2 white
olnlb = cPPf("lights/overhead_lamp_nav_left_bright", 1)
olnlru = cPPf("lights/overhead_lamp_nav_left_rot_updown", 50)
olnlra = cPPf("lights/overhead_lamp_nav_left_rot_around", 0)
olnrm = cPPi("lights/overhead_lamp_nav_right_mode", 0) --0 off, 1 red, 2 white
olnrb = cPPf("lights/overhead_lamp_nav_right_bright", 1)
olnrru = cPPf("lights/overhead_lamp_nav_right_rot_updown", 30)
olnrra = cPPf("lights/overhead_lamp_nav_right_rot_around", 30)
olradm = cPPi("lights/overhead_lamp_rad_mode", 0) -- 0 off, 1 red, 2 white
olradb = cPPf("lights/overhead_lamp_rad_bright", 1)
olradru = cPPf("lights/overhead_lamp_rad_rot_updown", 20)
olradra = cPPf("lights/overhead_lamp_rad_rot_around", -6)

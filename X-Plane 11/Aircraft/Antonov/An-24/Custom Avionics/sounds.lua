defineProperty("autopilot_state_PF", globalPropertyf("an-24/autopilot_state_PF"))
defineProperty("autopilot_state_FO", globalPropertyf("an-24/autopilot_state_FO"))
defineProperty("soundCap", globalPropertyi("an-24/soundCap"))
defineProperty("isalerton", globalPropertyi("an-24/isalerton"))
defineProperty("beacon_up", globalPropertyi("an-24/beacon_up"))
defineProperty("beacon_down", globalPropertyi("an-24/beacon_down"))
defineProperty("test_lamp_pilot", globalPropertyi("an-24/test_lamp_pilot"))
defineProperty("test_lamp_pilot1_switch", globalPropertyi("an-24/test_lamp_pilot1_switch"))
defineProperty("test_lamp_pilot2_switch", globalPropertyi("an-24/test_lamp_pilot2_switch"))
defineProperty("main_menu_subpanel", globalPropertyi("an-24/panels/main_menu_subpanel"))
defineProperty("testmsrp", globalPropertyi("an-24/testmsrp"))
defineProperty("testmsrp_sound_switch", globalPropertyi("an-24/testmsrp_sound_switch"))
defineProperty("testmsrp_cap", globalPropertyi("an-24/testmsrp_cap"))
defineProperty("testmsrp_sound_switch_cap", globalPropertyi("an-24/testmsrp_sound_switch_cap"))
defineProperty("msrp_switch", globalPropertyi("an-24/msrp_switch"))
defineProperty("msrp_sound_switch", globalPropertyi("an-24/msrp_sound_switch"))
defineProperty("msrp_switch_cap", globalPropertyi("an-24/msrp_switch_cap"))
defineProperty("msrp_sound_switch_cap", globalPropertyi("an-24/msrp_sound_switch_cap"))
defineProperty("nosmokingswitchonoff", globalPropertyi("an-24/nosmokingswitchonoff"))
defineProperty("msrplight", globalPropertyi("an-24/msrplight"))
defineProperty("steward", globalPropertyi("an-24/push/steward"))
defineProperty("cabin_chair", globalPropertyi("sim/cockpit2/switches/custom_slider_on[16]"))  -- open/close cabin middle chair
defineProperty("overhead_light_left_mode", globalPropertyf("an-24/lights/overhead_lamp_left_mode"))
defineProperty("overhead_light_right_mode", globalPropertyf("an-24/lights/overhead_lamp_right_mode"))
defineProperty("overhead_light_pilot_left_mode", globalPropertyf("an-24/lights/overhead_lamp_pilot_left_mode"))
defineProperty("overhead_light_pilot_right_mode", globalPropertyf("an-24/lights/overhead_lamp_pilot_right_mode"))
defineProperty("overhead_light_nav_left_mode", globalPropertyf("an-24/lights/overhead_lamp_nav_left_mode"))
defineProperty("overhead_light_nav_right_mode", globalPropertyf("an-24/lights/overhead_lamp_nav_right_mode"))
defineProperty("overhead_light_rad_mode", globalPropertyf("an-24/lights/overhead_lamp_rad_mode"))
defineProperty("flight_time", globalPropertyf("sim/time/total_running_time_sec"))
defineProperty("alt", globalPropertyf("sim/cockpit2/gauges/indicators/altitude_ft_pilot"))
defineProperty("flightdeckdoor_toggle", globalPropertyf("an-24/flightdeckdoor_toggle"))
defineProperty("podnos", globalPropertyf("an-24/misc/podnos"))

local switch_sound = loadSample('sounds/custom/metal_switch.wav')
local cap_sound = loadSample('sounds/custom/cap.wav')
local plastic_button_sound = loadSample('sounds/custom/plastic_btn.wav')
local rot_sound = loadSample('sounds/custom/rot_click.wav')
local steward1 = loadSample('sounds/crew/steward1.wav')
local timersteward = 0

sound_check_switch = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} -- for 30 switch only
sound_check_cap = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} -- for 30 cap only
sound_check_button = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} -- for 30 button only
sound_check_rot = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} -- for 30 rot only

function switch_sound_function(a,i)
  if get(a)==2 then
    if sound_check_switch[i]==1 then
      playSample(switch_sound, 0)
      sound_check_switch[i]=2
    end
  end
  if get(a)==1 then
    if sound_check_switch[i]==0 then
      playSample(switch_sound, 0)
      sound_check_switch[i]=1
    end
  end
  if get(a)==0 then
    if sound_check_switch[i]==1 or sound_check_switch[i]==2 then
      playSample(switch_sound, 0)
      sound_check_switch[i]=0
    end
  end
end

function cap_sound_function(aa,ii)
  if get(aa)==2 then
    if sound_check_cap[ii]==1 then
      playSample(cap_sound, 0)
      sound_check_cap[ii]=2
    end
  end
  if get(aa)==1 then
    if sound_check_cap[ii]==0 then
      playSample(cap_sound, 0)
      sound_check_cap[ii]=1
    end
  end
  if get(aa)==0 then
    if sound_check_cap[ii]==1 or sound_check_cap[ii]==2 then
      playSample(cap_sound, 0)
      sound_check_cap[ii]=0
    end
  end
end

function button_sound_function(aaa,iii)
  if get(aaa)==2 then
    if sound_check_button[iii]==1 then
      playSample(plastic_button_sound, 0)
      sound_check_button[iii]=2
    end
  end
  if get(aaa)==1 then
    if sound_check_button[iii]==0 then
      playSample(plastic_button_sound, 0)
      sound_check_button[iii]=1
    end
  end
  if get(aaa)==0  then
    if sound_check_button[iii]==1 or sound_check_button[iii]==2 then
      playSample(plastic_button_sound, 0)
      sound_check_button[iii]=0
    end
  end
end

function rot_sound_function(aaaa,iiii)
  if get(aaaa)==2 then
    if sound_check_rot[iiii]==1 then
      playSample(rot_sound, 0)
      sound_check_rot[iiii]=2
    end
  end
  if get(aaaa)==1 then
    if sound_check_rot[iiii]==0 then
      playSample(rot_sound, 0)
      sound_check_rot[iiii]=1
    end
  end
  if get(aaaa)==0 then
    if sound_check_rot[iiii]==1 or sound_check_rot[iiii]==2 then
      playSample(rot_sound, 0)
      sound_check_rot[iiii]=0
    end
  end
end

function update()
  if get(steward)==1 then
    timersteward=get(flight_time)
    --playSample(steward1, 0)
  end
  if get(alt)>12000 then
    if (get(flight_time)-timersteward)<1 and (get(flight_time)-timersteward)>0.9 then
      playSample(steward1, 0)
    end
    if (get(flight_time)-timersteward)<12 and (get(flight_time)-timersteward)>11.9 then
      set(cabin_chair,0)
    end
    if (get(flight_time)-timersteward)<16 and (get(flight_time)-timersteward)>15.9 then
      set(flightdeckdoor_toggle,1)
    end
    if (get(flight_time)-timersteward)<18 and (get(flight_time)-timersteward)>17.9 then
      set(podnos,1)
    end
    if (get(flight_time)-timersteward)<20 and (get(flight_time)-timersteward)>19.9 then
      set(flightdeckdoor_toggle,0)
    end
    if (get(flight_time)-timersteward)<60 and (get(flight_time)-timersteward)>59.9 then
      set(flightdeckdoor_toggle,1)
    end
    if (get(flight_time)-timersteward)<63 and (get(flight_time)-timersteward)>62.9 then
      set(podnos,0)
    end
    if (get(flight_time)-timersteward)<66 and (get(flight_time)-timersteward)>65.9 then
      set(flightdeckdoor_toggle,0)
    end
  end
  -- Switches and button sounds
--  switch_sound_function(beacon_up,1)
--  switch_sound_function(beacon_down,2)
  switch_sound_function(msrp_switch,3)
  switch_sound_function(testmsrp,4)
  switch_sound_function(nosmokingswitchonoff,5)

  cap_sound_function(msrp_switch_cap,1)
  cap_sound_function(testmsrp_cap,2)

  button_sound_function(steward,1)
  button_sound_function(test_lamp_pilot1_switch,2)
  button_sound_function(test_lamp_pilot2_switch,3)
  button_sound_function(overhead_light_left_mode,4)
  button_sound_function(overhead_light_right_mode,5)
  button_sound_function(overhead_light_pilot_left_mode,6)
  button_sound_function(overhead_light_pilot_right_mode,7)
  button_sound_function(overhead_light_nav_left_mode,8)
  button_sound_function(overhead_light_nav_right_mode,9)
  button_sound_function(overhead_light_rad_mode,10)

  rot_sound_function(main_menu_subpanel,1)

  if get(autopilot_state_PF)==0.5 or get(autopilot_state_FO)==0.5 then
    playSample(plastic_button_sound, 0)
  end
end

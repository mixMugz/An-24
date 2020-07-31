-- this is the simple logic of braking system, provide brake limits depending on pressure in system and possibly ABS
size = {2048, 2048}

-- define property table
defineProperty("brake_press", globalPropertyf("an-24/hydro/brake_press"))  -- pressure in braking system
defineProperty("emerg_press", globalPropertyf("an-24/hydro/emerg_press")) -- pressure in emergency system. initial 120 kg per square sm. maximum 160.
defineProperty("brake1", globalPropertyf("an-24/hydro/brake_left")) -- gear brake ratio. 0 = min, 1 = max
defineProperty("brake2", globalPropertyf("an-24/hydro/brake_right")) -- gear brake ratio. 0 = min, 1 = max
defineProperty("block_brake", globalPropertyf("an-24/hydro/park_brake"))  -- blocks brakes
defineProperty("brake1_pedal", globalPropertyf("sim/flightmodel/controls/l_brake_add")) -- gear brake from sim. 0 = min, 1 = max
defineProperty("brake2_pedal", globalPropertyf("sim/flightmodel/controls/r_brake_add")) -- gear brake from sim. 0 = min, 1 = max
defineProperty("block_brake_real", globalPropertyf("sim/flightmodel/controls/parkbrake"))  -- blocks brakes real
defineProperty("emerg_brake", globalPropertyf("an-24/hydro/emerg_brake"))  -- pressure in braking system
defineProperty("gear_blocks", globalPropertyi("an-24/covers/gear_blocks"))  -- gear blocks
defineProperty("real_brakes", globalPropertyi("an-24/set/real_brakes")) -- brakes can overheat and fail
--defineProperty("overr", globalPropertyi("sim/operation/override/override_gearbrake"))  -- override brakes
defineProperty("pedals", globalPropertyi("sim/joystick/eq_ped_wibrk"))  -- override pedals

set(pedals, 0)

-- ABS
defineProperty("gear_speed_1", globalPropertyf("sim/flightmodel2/gear/tire_rotation_speed_rad_sec[1]")) -- radians/second	Rotational speed of this tire, radians per second.
defineProperty("gear_speed_2", globalPropertyf("sim/flightmodel2/gear/tire_rotation_speed_rad_sec[2]")) -- radians/second	Rotational speed of this tire, radians per second.
defineProperty("abs_sw", globalPropertyi("an-24/hydro/abs_sw"))  -- abs switcher
defineProperty("bus_DC_27_volt_emerg", globalPropertyf("an-24/power/bus_DC_27_volt_emerg")) 

-- enviroment
defineProperty("frame_time", globalPropertyf("an-24/time/frame_time")) -- time for frames
defineProperty("flight_time", globalPropertyf("sim/time/total_running_time_sec")) -- sim time

-- images
defineProperty("yellow_led", loadImage("leds.dds", 60, 0, 20, 20)) 


-- local variables
local passed = 0

local switch_sound = loadSample('sounds/custom/metal_switch.wav')
local cap_sound = loadSample('sounds/custom/cap.wav')
local btn_click = loadSample('sounds/custom/plastic_btn.wav')
local rot_click = loadSample('sounds/custom/rot_click.wav')

local switcher_pushed = false

local brake1_temp = 0
local brake2_temp = 0
local speed1_last = get(gear_speed_1)
local speed2_last = get(gear_speed_2)
local left_abs = false
local right_abs = false
local power = false

-- every frame calculations
local maximum = 0

registerCommandHandler(createCommand("An-24/Instruments/abs_sw_on", "ABS Switch on."), 0, function(p) if p == 0 and get(abs_sw) ~= 1 then set(abs_sw, 1) end return 0 end)
registerCommandHandler(createCommand("An-24/Instruments/abs_sw_off", "ABS Switch off."), 0, function(p) if p == 0 and get(abs_sw) ~= 0 then set(abs_sw, 0) end return 0 end)
registerCommandHandler(createCommand("An-24/Instruments/abs_sw_toggle", "ABS Switch toggle."), 0, function(p) if p == 0 then if get(abs_sw) == 0 then set(abs_sw, 1) else set(abs_sw, 0) end end return 0 end)

function update()
	passed = get(frame_time)
	
	-- remove sim's braking logic
	-- set(pedals, 1)

	-- all calculations produced only during sim work
if passed > 0 then
	-- power calculations
	power = get(bus_DC_27_volt_emerg) > 21
	
	
	-- limit brakes depending on brake capacitor pressure
	local main_press = get(brake_press) 
	local brake_1 = get(brake1_pedal) * main_press / 120
	local brake_2 = get(brake2_pedal) * main_press / 120
	local park_brake = get(block_brake_real) * main_press / 120

	-- press two pedals release parking brake and get(gear_blocks) == 1
	if get(brake1_pedal) == 1 and get(brake2_pedal) == 1 and get(block_brake_real) > 0.5 and get(gear_blocks) ~= 0 then set(block_brake_real,0) end

	-- if brake_1 > main_press / 120 then brake_1 = main_press / 120 end
	-- if brake_2 > main_press / 120 then brake_2 = main_press / 120 end
	-- if park_brake > main_press / 120 then park_brake = main_press / 120 end
	if brake_1 > 1 then brake_1 = 1 end
	if brake_2 > 1 then brake_2 = 1 end
	if park_brake > 1 then park_brake = 1 end

	-- use emergency braking
	local e_brake = get(emerg_brake)
	local e_press = get(emerg_press) / 100
	if e_press > 1 then e_press = 1 end
	if e_brake > 0 then
		brake_1 = e_brake * e_press 
		brake_2 = e_brake * e_press
	end
	-- ABS logic
	local abs_switcher = get(abs_sw)
	-- wheel 1
	if brake1_temp == 0 and abs_switcher == 1 and not left_abs then
		if (speed1_last - get(gear_speed_1)) / passed > 30 then  -- if wheel stops too rapidly. level must be corrected
			brake1_temp = brake_1  -- save previous brake state
			brake_1 = brake_1 / 3  -- release brakes for one frame
			left_abs = true
		end
	elseif left_abs then
		brake_1 = brake1_temp -- return previous brake state, if ABS used
		brake1_temp = 0
		left_abs = false
	end
--[[	-- test
	if (speed1_last - get(gear_speed_1)) / passed > maximum then maximum = (speed1_last - get(gear_speed_1)) / passed end
	if (speed1_last - get(gear_speed_1)) / passed > 0 then
		print(maximum, speed1_last, get(gear_speed_1), (speed1_last - get(gear_speed_1)) / passed, passed)
	end --]]
	-- wheel 2
	if brake2_temp == 0 and abs_switcher == 1 and not right_abs then
		if (speed2_last - get(gear_speed_2)) / passed > 30 then  -- if wheel stops too rapidly
			brake2_temp = brake_2 -- save previous brake state
			brake_2 = brake_2 / 3  -- release brakes for one frame
			right_abs = true
		end
	elseif right_abs then
		brake_2 = brake2_temp -- return previous brake state, if ABS used
		brake2_temp = 0
		right_abs = false
	end
	
	-- calculate feed from braking system
	main_press = main_press - (brake_1 + brake_2 + park_brake) * passed * 0.3  -- last coeff must be corrected
	
	-- override park brake for gear blocks
	if get(gear_blocks) == 0 then
		park_brake = 5
		set(block_brake_real, 1)
	end
	
	-- set results
	set(brake1, brake_1)
	set(brake2, brake_2)
	set(brake_press, main_press)
	set(block_brake, park_brake)

end
	-- last variables
	speed1_last = get(gear_speed_1)
	speed2_last = get(gear_speed_2)
end

components = {
  -- left gear led
  textureLit {
    image = get(yellow_led),
    position = {781, 328, 19, 19},
    visible = function()
      return left_abs and power
    end
  },
  -- right gear led
  textureLit {
    image = get(yellow_led),
    position = {601, 308, 19, 19},
    visible = function()
      return right_abs and power
    end
  }
}

function onAvionicsDone()
  set(pedals, 0) -- release brakes control via plugin to let other models fly :)
  print("Brakes released...")
end

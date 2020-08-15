size = {200, 200}
-- define property table
-- source
defineProperty("gyro_curse", globalPropertyf("an-24/gauges/GIK_curse"))  -- gyro curse from GIK
defineProperty("frame_time", globalPropertyf("an-24/time/frame_time")) -- time for frames
defineProperty("flight_time", globalPropertyf("sim/time/total_running_time_sec")) -- sim time
defineProperty("hor_def", globalPropertyf("an-24/gauges/curs_1"))
defineProperty("vert_def", globalPropertyf("an-24/gauges/glide_1"))
defineProperty("curs_flag", globalPropertyf("an-24/gauges/k1_flag"))
defineProperty("glide_flag", globalPropertyf("an-24/gauges/g1_flag"))
defineProperty("SC_master", globalPropertyi("scp/api/ismaster")) -- status of SmartCopilot
defineProperty("scale_angle1_smartcopilot", globalPropertyf("an-24/gauges/scale_angle_1_smartcopilot")) -- dataref for SmartCopilot synchronisation
defineProperty("scale_angle2_smartcopilot", globalPropertyf("an-24/gauges/scale_angle_2_smartcopilot")) -- dataref for SmartCopilot synchronisation
defineProperty("rotate_dir1_smartcopilot", globalPropertyi("an-24/gauges/rotate_dir1_smartcopilot")) -- dataref for SmartCopilot synchronisation
defineProperty("rotate_dir2_smartcopilot", globalPropertyi("an-24/gauges/rotate_dir2_smartcopilot")) -- dataref for SmartCopilot synchronisation
defineProperty("sc_curse_angle", globalPropertyf("an-24/gauges/sc_KPPM_1_curse_angle")) -- dataref for SmartCopilot synchronisation
-- signals to autopilot
--defineProperty("ap_curse") -- curse for autopilot
-- images
defineProperty("scale", loadImage("kppm.dds", -0.5, 0.5, 196, 196))
defineProperty("curse_needle", loadImage("kppm.dds", 202.5, 12, 22, 172))
defineProperty("scale_triangle", loadImage("kppm.dds", 30, 223, 13, 23))
defineProperty("v_plank_img", loadImage("kppm.dds", 200, 0, 2, 110))
defineProperty("h_plank_img", loadImage("kppm.dds", 0, 200, 110, 2))
defineProperty("flag_img", loadImage("kppm.dds", 2, 224, 22, 22))
defineProperty("knob_img", loadImage("needles.dds", 344, 89, 51, 51))

-- local variables
local scale_angle = 0
local scale_angle2 = 0
local curse_angle = 0
local rotate_dir = 0
local curse_plank = 0
local glide_plank = 0
local curse_flag_vis = true
local glide_flag_vis = true
local duration = 0

local rotate_dir1_left_command = createCommand("An-24/Flight/dir1_knob_rotate_left", "Dir Pilot Left Rotate")
function rotate_dir1_left_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if phase == 1 then
		duration = duration + 0.1
		sc_angle(duration, -1)
	else
		duration = 0
	end
	return 0
end
registerCommandHandler(rotate_dir1_left_command, 0, rotate_dir1_left_handler)

local rotate_dir1_right_command = createCommand("An-24/Flight/dir1_knob_rotate_right", "Dir Pilot Right Rotate")
function rotate_dir1_right_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if phase == 1 then
		duration = duration + 0.1
		sc_angle(duration, 1)
	else
		duration = 0
	end
	return 0
end
registerCommandHandler(rotate_dir1_right_command, 0, rotate_dir1_right_handler)

local rotate_dir2_left_command = createCommand("An-24/Flight/dir2_knob_rotate_left", "Dir Copilot Left Rotate")
function rotate_dir2_left_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if phase == 1 then
		duration = duration + 0.1
		sc_angle2(duration, -1)
	else
		duration = 0
	end
	return 0
end
registerCommandHandler(rotate_dir2_left_command, 0, rotate_dir2_left_handler)

local rotate_dir2_right_command = createCommand("An-24/Flight/dir2_knob_rotate_right", "Dir Copilot Right Rotate")
function rotate_dir2_right_handler(phase)  -- for all commands phase equals: 0 on press; 1 while holding; 2 on release
	if phase == 1 then
		duration = duration + 0.1
		sc_angle2(duration, 1)
	else
		duration = 0
	end
	return 0
end
registerCommandHandler(rotate_dir2_right_command, 0, rotate_dir2_right_handler)

function sc_angle(dur, dir)
	if dur < 6 then
		scale_angle = ((scale_angle + 181 * dir) % 360) - 180
		set(scale_angle1_smartcopilot, scale_angle)
	else
		scale_angle = ((scale_angle + 182 * dir) % 360) - 180
		set(scale_angle1_smartcopilot, scale_angle)
	end
end

function sc_angle2(dur, dir)
	if dur < 6 then
		scale_angle2 = ((scale_angle2 + 181 * dir) % 360) - 180
		set(scale_angle2_smartcopilot, scale_angle2)
	else
		scale_angle2 = ((scale_angle2 + 182 * dir) % 360) - 180
		set(scale_angle2_smartcopilot, scale_angle2)
	end
end

-- postframe calculaions
function update()
	-- time calculations
	local passed = get(frame_time)
	-- time bug workaround
	if passed > 0 then
		-- rotate scale
--[[
		if get(SC_master) ~= 1 then
			scale_angle = scale_angle + (rotate_dir + get(rotate_dir1_smartcopilot)) * passed * 20
			scale_angle2 = scale_angle2 + (rotate_dir + get(rotate_dir2_smartcopilot)) * passed * 20
			if scale_angle > 180 then scale_angle = scale_angle - 360
			elseif scale_angle < -180 then scale_angle = scale_angle + 360 end
			if scale_angle2 > 180 then scale_angle2 = scale_angle2 - 360
			elseif scale_angle2 < -180 then	scale_angle2 = scale_angle2 + 360	end
			set(scale_angle1_smartcopilot, scale_angle)
			set(scale_angle2_smartcopilot, scale_angle2)
		else
			scale_angle = get(scale_angle1_smartcopilot)
			scale_angle2 = get(scale_angle2_smartcopilot)
		end

--]]

scale_angle = get(scale_angle1_smartcopilot)
scale_angle2 = get(scale_angle2_smartcopilot)

if get(SC_master) == 1 then
			curse_angle = get(sc_curse_angle)
		else
			local v = get(gyro_curse) + scale_angle
			local delta = v - curse_angle
			if delta > 180 then delta = delta - 360
			elseif delta < -180 then delta = delta + 360 end
			curse_angle = curse_angle + 5 * delta * passed
			if curse_angle > 180 then curse_angle = curse_angle - 360
			elseif curse_angle < -180 then curse_angle = curse_angle + 360 end
			set(sc_curse_angle,curse_angle)
		end
	  -- set curse for AP
	  --set(ap_curse, curse_angle)

	  -- smooth move of course plank
	  local cur = get(hor_def) * 15
	  local cur_delta = cur - curse_plank
	  curse_plank = curse_plank + 3 * cur_delta * passed
	  --print(cur, curse_plank)

	  -- smooth move of glideslope plank
	  local glide = -get(vert_def) * 15
	  local glide_delta = glide - glide_plank
	  glide_plank = glide_plank + 3 * glide_delta * passed

	  -- set limits
	  --[[
	  if curse_plank < -20 then curse_plank = -20
	  elseif curse_plank > 20 then curse_plank = 20 end
		if glide_plank < -20 then glide_plank = -20
		elseif glide_plank > 20 then glide_plank = 20 end --]]

		-- flag visibility
		curse_flag_vis = get(curs_flag) == 1
		glide_flag_vis = get(glide_flag) == 1
	end
end
components = {
}

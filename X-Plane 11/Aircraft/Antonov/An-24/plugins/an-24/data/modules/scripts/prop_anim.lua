--[[

  File: prop_anim.lua
  -----
  This is prop animation logic. Overrides and math

--]]

local prop_over = {
	gP("sim/flightmodel2/engines/prop_disc/override[0]"),
	gP("sim/flightmodel2/engines/prop_disc/override[1]"),
}
local disc_alpha_front = {
	gP("sim/flightmodel2/engines/prop_disc/disc_alpha_front[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_alpha_front[1]"),
}
local disc_alpha_inside = {
	gP("sim/flightmodel2/engines/prop_disc/disc_alpha_inside[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_alpha_inside[1]"),
}
local disc_alpha_side = {
	gP("sim/flightmodel2/engines/prop_disc/disc_alpha_side[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_alpha_side[1]"),
}
local disc_s = {
	gP("sim/flightmodel2/engines/prop_disc/disc_s[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_s[1]"),
}
local disc_s_dim = {
	gP("sim/flightmodel2/engines/prop_disc/disc_s_dim[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_s_dim[1]"),
}
local disc_t = {
	gP("sim/flightmodel2/engines/prop_disc/disc_t[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_t[1]"),
}
local disc_t_dim = {
	gP("sim/flightmodel2/engines/prop_disc/disc_t_dim[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_t_dim[1]"),
}
local disc_width = {
	gP("sim/flightmodel2/engines/prop_disc/disc_width[0]"),
	gP("sim/flightmodel2/engines/prop_disc/disc_width[1]"),
}
local side_alpha_front = {}
local side_alpha_inside = {
	gP("sim/flightmodel2/engines/prop_disc/side_alpha_inside[0]"),
	gP("sim/flightmodel2/engines/prop_disc/side_alpha_inside[1]"),
}
local side_alpha_side = {}
local side_alpha_cam = {}
local prop_angle = {
	gP("sim/flightmodel2/engines/prop_disc/side_angle[0]"),
	gP("sim/flightmodel2/engines/prop_disc/side_angle[1]"),
}
local side_length_ratio = {
	gP("sim/flightmodel2/engines/prop_disc/side_length_ratio[0]"),
	gP("sim/flightmodel2/engines/prop_disc/side_length_ratio[1]"),
}
local side_number_of_blades = {
	gP("sim/flightmodel2/engines/prop_disc/side_number_of_blades[0]"),
	gP("sim/flightmodel2/engines/prop_disc/side_number_of_blades[1]"),
}
local side_s_dim = {
	gP("sim/flightmodel2/engines/prop_disc/side_s_dim[0]"),
	gP("sim/flightmodel2/engines/prop_disc/side_s_dim[1]"),
}
local side_t_dim = {
	gP("sim/flightmodel2/engines/prop_disc/side_t_dim[0]"),
	gP("sim/flightmodel2/engines/prop_disc/side_t_dim[1]"),
}
local side_width = {
	gP("sim/flightmodel2/engines/prop_disc/side_width[0]"),
	gP("sim/flightmodel2/engines/prop_disc/side_width[1]"),
}
local prop_is_disc = {
	gP("sim/flightmodel2/engines/prop_is_disc[0]"),
	gP("sim/flightmodel2/engines/prop_is_disc[1]"),
}
local prop_angle_deg = {
	gP("sim/flightmodel2/engines/prop_rotation_angle_deg[0]"),
	gP("sim/flightmodel2/engines/prop_rotation_angle_deg[1]"),
}
local prop_rpm_rad = {
	gP("sim/flightmodel2/engines/prop_rotation_speed_rad_sec[0]"),
	gP("sim/flightmodel2/engines/prop_rotation_speed_rad_sec[1]"),
}

set(prop_over[1], 0)
set(prop_over[2], 0)

--[[ BUG!!! Code temporary disabled! Need completely rework!!!
local left_prop_angle = 0
local right_prop_angle = 0

local counter = 0
local not_loaded = true

set(disc_s_dim1, 4)
set(disc_s_dim2, 4)
set(disc_t_dim1, 1)
set(disc_t_dim2, 1)
set(disc_alpha_side1, 1)
set(disc_alpha_side2, 1)


function update()
	-- set override after few seconds
	counter = counter + gvar.frame_time
	if not_loaded and counter > 0.3 and counter < 0.5 then
		set(prop_over_1, 1)
		set(prop_over_2, 1)
		not_loaded = false
	end


	local left_rpm = get(prop1_rpm_rads) / 0.10471975511966
	local right_rpm = get(prop2_rpm_rads) / 0.10471975511966

	-- set disk visible
	if left_rpm > 300 then set(prop_is_disc_1, 1) else set(prop_is_disc_1, 0) end
	if right_rpm > 300 then set(prop_is_disc_2, 1) else set(prop_is_disc_2, 0) end

	-- set rotation angle
	left_prop_angle = left_prop_angle + left_rpm * gvar.frame_time * 2
	right_prop_angle = right_prop_angle + right_rpm * gvar.frame_time * 2

	if left_prop_angle > 360 then left_prop_angle = left_prop_angle - 360 end
	if right_prop_angle > 360 then right_prop_angle = right_prop_angle - 360 end

	-- set limits
	local left_angle = left_prop_angle
	local right_angle = right_prop_angle
	while left_angle > 360 do left_angle = left_angle - 360 end
	while right_angle > 360 do right_angle = right_angle - 360 end

	set(prop_angle_1, left_angle)
	set(prop_angle_2, right_angle)
	set(prop_angle_12, left_angle)
	set(prop_angle_22, right_angle)


	-- test
--[[
	set(disc_s_dim1, 4)
	set(disc_s_dim2, 4)
	set(disc_alpha_side1, 1)
	set(disc_alpha_side2, 1)
	set(side_length_ratio1, 1)
	set(side_length_ratio2, 1)
	set(side_s_dim1, 1)
	set(side_s_dim2, 1)
	set(disc_alpha_inside1, 0.5)
	set(disc_alpha_inside2, 0.5)
	set(side_alpha_inside1, 0)
	set(side_alpha_inside2, 0)
	set(side_t_dim1, 1)
	set(side_t_dim2, 1)
	set(disc_alpha_front1, 1 - left_rpm / 2300)  -- prop disc opacity
	set(disc_alpha_front2, 1 - right_rpm / 2300)
	set(side_width1, 0.1)
	set(side_width2, 0.1)
	set(side_number_of_blades1, 2)
	set(side_number_of_blades2, 2)
	set(disc_width1, 0.03)  -- prop disc width
	set(disc_width2, 0.03)

end
--]]

function onModuleDone()
	set(prop_over[1], 0)
	set(prop_over[2], 0)
  print("All props released...")
end

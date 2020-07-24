size = {45, 25}
-- define panels datarefs
defineProperty("red_fl", globalPropertyi("sim/graphics/misc/red_flashlight_on"))
defineProperty("white_fl", globalPropertyi("sim/graphics/misc/white_flashlight_on"))
defineProperty("bg1", loadImage("menu_flbg1.png"))
defineProperty("bg2", loadImage("menu_flbg2.png"))
defineProperty("bg3", loadImage("menu_flbg3.png"))
defineProperty("lang", globalPropertyi("an-24rv/set/language"))

local rot_click = loadSample('sounds/custom/rot_click.wav')
local flstate = 0

components = {
  -- background
  rectangle {
    position = {0, 0, 45, 25},
    color = {0,0,0,0},
  },
  textureLit {
    position = {0, 0, 45, 25},
    image = get(bg1),
    visible = function() return flstate == 0; end,
  },
  textureLit {
    position = {0, 0, 45, 25},
    image = get(bg2),
    visible = function() return flstate == 1; end,
  },
  textureLit {
    position = {0, 0, 45, 25},
    image = get(bg3),
    visible = function() return flstate == 2; end,
  },
  switch {
    position = {0, 1, 31, 23},
    onMouseDown = function()
      if get(red_fl) == 0 and get(white_fl) == 0 then
        set(red_fl, 1)
        flstate = 1
      else
        if get(red_fl) == 1 then
          set(red_fl, 0)
          set(white_fl, 1)
          flstate = 2
	else
          set(white_fl, 0)
          flstate = 0
        end
      end
      playSample(rot_click, 0)
      return true
    end
  }
}

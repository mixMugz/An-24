size = {45, 25}
-- define panels datarefs
local red_fl = globalPropertyi("sim/graphics/misc/red_flashlight_on")
local white_fl = globalPropertyi("sim/graphics/misc/white_flashlight_on")
local language = globalPropertyi("an-24/set/language")

local lang = 0
local flstate = 0

local rot_click = loadSample('sounds/custom/rot_click.wav')
local bg = {
  [0] = { [0] = loadImage("menu_flbg1_e.png"),
                loadImage("menu_flbg2_e.png"),
                loadImage("menu_flbg3_e.png"),
  }, 
  {
          [0] = loadImage("menu_flbg1_r.png"),
                loadImage("menu_flbg2_r.png"),
                loadImage("menu_flbg3_r.png"),
  }
}

components = {
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

function draw()
  lang = get(language)
  drawTexture(bg[lang][flstate], 0, 0, 45, 25, 1, 1, 1)
end
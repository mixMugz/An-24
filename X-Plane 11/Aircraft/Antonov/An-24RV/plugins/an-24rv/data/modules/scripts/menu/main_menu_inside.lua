local initialized = false

local black	= {0, 0, 0, 1}
local cyan	= {0, 1, 1, 1}
local magenta	= {1, 0, 1, 1}
local yellow	= {1, 1, 0, 1}
local roboto	= loadFont(getXPlanePath().."Resources/fonts/Roboto-Regular.ttf")
local Inconsolata = loadFont(getXPlanePath().."Resources/fonts/Inconsolata.ttf")
local NewOneX = 0

function init()
  test = globalProperty("an-24rv/gauges/scale_angle_1_smartcopilot")
  yokeRollRatio = globalProperty("sim/cockpit2/controls/yoke_roll_ratio")
end

function draw()
  local x, y = size[1]/2, size[2]/2
  if not initialized then
    init()
    initialized = true
  end
  drawCircle(get(NewOneX) , 20 , 10, true, magenta)
  drawText(Inconsolata, x, y + 50, get(test), 24, false, false, TEXT_ALIGN_LEFT, cyan) -- math.floor(get(test)) for int
  drawRotatedText(roboto, 0, -10, 0, 0, -90, getAircraftPath(), 12, false, false, TEXT_ALIGN_LEFT, yellow)
end

function update()
  if not initialized then
    init()
    initialized = true
  end
  NewOneX =(get(yokeRollRatio) * 200) + 50	
end

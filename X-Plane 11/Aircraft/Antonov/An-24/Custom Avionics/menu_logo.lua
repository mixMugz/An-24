size = {45, 35}
-- define panels datarefs
defineProperty("main_menu_subpanel", globalPropertyi("an-24/panels/main_menu_subpanel"))
defineProperty("menu_logo", globalPropertyi("an-24/panels/menu_logo"))
defineProperty("background", loadImage("menu_logo.png"))

local rot_click = loadSample('sounds/custom/rot_click.wav')

components = {
  -- background
  rectangle {
    position = {0, 0, 45, 35},
    color = {0,0,0,0},
  },
  textureLit {
    position = {0, 0, 45, 35},
    image = get(background),
  },
  switch {
    position = {0, 1, 45, 33},
    state = function()
      return get(main_menu_subpanel) ~= 0
    end,
    onMouseDown = function()
      if get(main_menu_subpanel) == 0 then
        set(main_menu_subpanel, 1)
        set(menu_logo, 0)
      end
      playSample(rot_click, 0)
      return true
    end
  }
}

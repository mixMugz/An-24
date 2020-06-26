local initialized = false

local popup = contextWindow {
  name = "Menu",
  position = {60, 100, 120, 512},
  noResize = false,
  resizeMode = SASL_CW_RESIZE_RIGHT_BOTTOM,
  noDecore = true, -- remove decoration
  proportional = true,
  visible = true,
  vrAuto = true,
  noBackground = true,
  layer	= SASL_CW_LAYER_GROWL_NOTIFICATIONS,
  components = {main_menu_inside{position={0, 0, 120, 512}}},
}

function init()
  main_menu_subpanel = globalPropertyi("an-24rv/panels/main_menu_subpanel")
end

function update()
  if not initialized then
    init()
    initialized = true
  end
  if get(main_menu_subpanel) == 1 then 
    popup:setIsVisible(true)
  else
    popup:setIsVisible(false)
  end
end

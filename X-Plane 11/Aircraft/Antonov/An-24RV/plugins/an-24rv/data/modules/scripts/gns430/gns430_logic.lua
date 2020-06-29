-- GNS430 logic
page_angle1 = globalPropertyi("custom/GNS430/page_angle1")
chapter_angle1 = globalPropertyi("custom/GNS430/chapter_angle1")
fine_angle1 = globalPropertyi("custom/GNS430/fine_angle1")
coarse_angle1 = globalPropertyi("custom/GNS430/coarse_angle1")

-- Calculate angle for KNOB's
registerCommandHandler(findCommand("sim/GPS/g430n1_page_up"), 0, function(p) if p == 0 then local a = get(page_angle1) if a >= 360 then a = 0 end a = a + 20 set(page_angle1, a) end return 0 end)
registerCommandHandler(findCommand("sim/GPS/g430n1_page_dn"), 0, function(p) if p == 0 then local a = get(page_angle1) if a <= 0 then a = 360 end a = a - 20 set(page_angle1, a) end return 0 end)
registerCommandHandler(findCommand("sim/GPS/g430n1_chapter_up"), 0, function(p) if p == 0 then local a = get(chapter_angle1) if a >= 360 then a = 0 end a = a + 20 set(chapter_angle1, a) end return 0 end)
registerCommandHandler(findCommand("sim/GPS/g430n1_chapter_dn"), 0, function(p) if p == 0 then local a = get(chapter_angle1) if a <= 0 then a = 360 end a = a - 20 set(chapter_angle1, a) end return 0 end)
registerCommandHandler(findCommand("sim/GPS/g430n1_fine_up"), 0, function(p) if p == 0 then local a = get(fine_angle1) if a >= 360 then a = 0 end a = a + 20 set(fine_angle1, a) end return 0 end)
registerCommandHandler(findCommand("sim/GPS/g430n1_fine_down"), 0, function(p) if p == 0 then local a = get(fine_angle1) if a <= 0 then a = 360 end a = a - 20 set(fine_angle1, a) end return 0 end)
registerCommandHandler(findCommand("sim/GPS/g430n1_coarse_up"), 0, function(p) if p == 0 then local a = get(coarse_angle1) if a >= 360 then a = 0 end a = a + 20 set(coarse_angle1, a) end return 0 end)
registerCommandHandler(findCommand("sim/GPS/g430n1_coarse_down"), 0, function(p) if p == 0 then local a = get(coarse_angle1) if a <= 0 then a = 360 end a = a - 20 set(coarse_angle1, a) end return 0 end)

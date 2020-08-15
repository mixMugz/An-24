--[[

  File: glbl_func.lua
  -----
  Create global function

--]]

-- Global datarefs
function cGPi(drf, def) return createGlobalPropertyi(drf, def or 0) end
function cGPf(drf, def) return createGlobalPropertyf(drf, def or 0) end
function cGPia(drf, def) return createGlobalPropertyfa(drf, def or 0) end
function cGPfa(drf, def) return createGlobalPropertyfa(drf, def or 0) end
function gP(drf) return globalProperty(drf) end
function gPi(drf) return globalPropertyi(drf) end
function gPf(drf) return globalPropertyf(drf) end

-- Boolean function
function setbool(prop, cond) set(prop, cond and 1 or 0) end

-- Return value depend of minimum and maximum
function math.clamp(minv,val,maxv) return(math.max(minv,math.min(maxv,val))) end

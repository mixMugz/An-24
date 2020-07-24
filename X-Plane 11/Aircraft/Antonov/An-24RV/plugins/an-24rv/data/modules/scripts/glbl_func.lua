--[[

  File: glbl_func.lua
  -----
  Create global function

--]]

-- Global datarefs
function cGPi(drf, def)
  return createGlobalPropertyi(drf, def or 0)
end

function cGPf(drf, def)
  return createGlobalPropertyf(drf, def or 0)
end

function gPi(drf)
  return globalPropertyi(drf)
end

function gPf(drf)
  return globalPropertyf(drf)
end

-- Project datarefs
function cPPi(drf, def)
  return createGlobalPropertyi(project.."/"..drf, def or 0)
end

function cPPf(drf, def)
  return createGlobalPropertyf(project.."/"..drf, def or 0)
end

function cPPfa(drf, def)
  return createGlobalPropertyfa(project.."/"..drf, def or 0)
end

function pPi(drf)
  return globalPropertyi(project.."/"..drf)
end

function pPf(drf)
  return globalPropertyf(project.."/"..drf)
end

-- Boolean function
function setbool(prop, cond)
  set(prop, cond and 1 or 0)
end

-- Getter & Setter
function callable(p)
  setmetatable(p, {
    __call = function(p, v, i) if v == nil then return get(p) else set(p, v, i) return v end end,
  })
  return p
end

size = {170, 170}

-- define property table
defineProperty("frequency", globalPropertyf("sim/cockpit2/radios/actuators/nav1_frequency_hz"))  -- set the frequency

-- images table
defineProperty("digitsImage", loadImage("white-digits.png", 3, 0, 10, 196)) 

-- variables for separate manipulations
local freq_100 = 0
local freq_10 = 0
local freq_num = get(frequency) / 100

function update()
  local freq = get(frequency)
  freq_num = freq / 100
   
  -- calculate separate digits
  freq_100 = math.floor(freq / 100)  -- cut off last two digits
  freq_10 = freq - freq_100 * 100  -- cut off first digits
end

components = {
  -- black hole
  rectangle {
    position = {103, 76, 47, 18},		
    color = {0,0,0,1},
  },
  -- digits
  digitstape {
    position = {94, 74, 55, 20},
    image = digitsImage,
    digits = 6,
    showLeadingZeros = false,
    fractional = 2,
    value = function()
     return freq_num
    end
  }
}

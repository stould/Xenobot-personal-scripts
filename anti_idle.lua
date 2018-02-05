--Just an Anti-AFK script

--Author: unknown

local dirs = {"south", "east", "north", "west"}

local i = 0

Module.New("Anti-AFK", function(Module)
    i = (i + 1) % 4
    local nextDir = dirs[i + 1]
    Self.Turn(nextDir)
    Module:Delay(math.random(6000, 7000))-- milisec 6 to 7 secs
end)
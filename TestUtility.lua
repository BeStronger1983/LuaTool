local Utility = require("Utility")

local point = Utility:getRandomPointInCircle( { x = 0, y = 0 }, 1 )

print( "x = " .. point.x .. ", y = " .. point.y )

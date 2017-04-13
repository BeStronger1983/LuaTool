local Utility = require("Utility")

local point = Utility:getRandomPointInCircle( { x = 0, y = 0 }, 1 )

print( "x = " .. point.x .. ", y = " .. point.y )

local testInputTable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
local testOutPutTable = {}

while Utility:getTableSize( testInputTable ) > 0 do
  local testResult = Utility:randomPopTable( testInputTable )

  if testResult then
    table.insert( testOutPutTable, testResult )
  end

  debug_print( "testInputTable = ", testInputTable )
  debug_print( "testOutPutTable = ", testOutPutTable )
end
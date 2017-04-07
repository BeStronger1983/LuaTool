local Utility = {}

math.randomseed(tostring(os.time()):reverse():sub(1, 6)) -- random seed

------------------------
-- 取得圓中隨機一點
-- @param #table origin 圓心
-- @param #number radius 半徑
-- @return #table 點座標
------------------------
function Utility:getRandomPointInCircle( origin, radius )
  -- 半徑平方後均勻0到1
  local randomRadius = math.sqrt( math.random( radius * radius ) )

  -- 360度均勻0到1
  local randomRadian = math.random( 360 )
  randomRadian = math.rad( randomRadian )

  local point = {
    x = math.cos( randomRadian ),
    y = math.sin( randomRadian )
  }

  point.x = point.x * randomRadius + origin.x
  point.y = point.y * randomRadius + origin.y

  return point
end

return Utility

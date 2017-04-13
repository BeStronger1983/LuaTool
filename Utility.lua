-- Print table
function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

-- Print table for Debug
function debug_print( ... )
    local arg = {...}
    if arg == nil then
        return
    end
    
    for i, v in ipairs(arg) do
        if type(v) == "table" then
            print_r(v)
        elseif type(v) == "userdata" then
            print(tolua.type(v))
        else
            print(v)
        end
    end
end

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

--------------------------------------------------------------
-- 算出table 數量
-- @param #不限型別 tbInput
-- @return #int size
--------------------------------------------------------------
function Utility:getTableSize(tbInput)
    local tbSize = 0
    for i, v in pairs(tbInput) do
        tbSize = tbSize + 1
    end
    return tbSize
end

------------------------
-- table 隨機從table中pop中。table的key必須是1~N的連續數字。
-- @param #table inputTable 傳入的table。pop後此table會被改變。
-- @return #value outItem pop出來的item
------------------------
function Utility:randomPopTable( inputTable )
  local outItem = nil

  local tableSize = Utility:getTableSize( inputTable )
  
  if tableSize <= 0 then
    return outItem
  end

  local popIndex = math.random( 1, tableSize )
  outItem = table.remove( inputTable, popIndex )

  return outItem
end

return Utility

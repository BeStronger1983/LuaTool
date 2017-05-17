local versionTable = {}
table.insert( versionTable, "1.0.0" )
table.insert( versionTable, "1.0.1" )
table.insert( versionTable, "1.1.0" )
table.insert( versionTable, "1.1.1" )
table.insert( versionTable, "1.11.0" )
table.insert( versionTable, "1.0.11" )
table.insert( versionTable, "2.0.0" )

for i, v in ipairs(versionTable) do
  for j, w in ipairs(versionTable) do
    if v > w then
      print( v .. " > " .. w)
    elseif v == w then
    else
      print( v .. " < " .. w)
    end
  end
  print( "" )
end
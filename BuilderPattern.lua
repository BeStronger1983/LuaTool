require "Class"

local MazeDirector = class(function(director, mazeData, builder)
    director.mazeData = mazeData
    director.builder = builder
end)

function MazeDirector:build()
    local maze = self.mazeData

    for i = 1, #maze do
        for j = 1, #(maze[i]) do
            if 0 == maze[i][j] then
                self.builder:buildRoad(i, j)
            elseif 1 == maze[i][j] then
                self.builder:buildWall(i, j)
            elseif 2 == maze[i][j] then
                self.builder:buildTreasure(i, j)
            end
        end
    end
end

function MazeDirector:draw()
    self.builder:draw() 
end

local PlainBuilder = class(function(builder, width, height)
    builder.maze = {}

    for i = 1, height do
        builder.maze[i] = {}
    end
end)

function PlainBuilder:buildRoad(i, j)
    self.maze[i][j] = ' '
end

function PlainBuilder:buildWall(i, j)
    self.maze[i][j] = 'o'
end

function PlainBuilder:buildTreasure(i, j)
    self.maze[i][j] = 'x'
end

function PlainBuilder:draw()
    local maze = self.maze

    for i = 1, #maze do
        local row = ""

        for j = 1, #(maze[i]) do
            row = row .. maze[i][j]
        end

        print(row)
    end
end

local mazeData = {
    {1,1,1,1,1,1,1},
    {1,0,0,0,0,2,1},
    {1,0,1,1,1,1,1},
    {1,0,0,0,0,0,1},
    {1,1,1,1,1,0,1},
    {1,0,0,0,0,0,1},
}

local plainBuilder = PlainBuilder(#mazeData[1], #mazeData)
local mazeDirector = MazeDirector(mazeData, plainBuilder)
mazeDirector:build()
mazeDirector:draw()

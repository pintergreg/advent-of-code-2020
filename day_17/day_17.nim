import strutils
const n = 3

proc countActiveNeightbor4(grid: seq[string], x: int, y: int): int =
    result = 0
    if x-1 >= 0 and grid[y][x-1] == '#':
        result += 1
    if x+1 < len(grid[0]) and grid[y][x+1] == '#':
        result += 1
    if y-1 >= 0 and grid[y-1][x] == '#':
        result += 1
    if y+1 < len(grid) and grid[y+1][x] == '#':
        result += 1
    return result

proc countActiveNeightborE(grid: seq[string], x: int, y: int): int =
    result = 0
    for i in -1..1:
        for j in -1..1:
            if i == 0 and j == 0:
                continue
            if x+i >= 0 and x+i < len(grid[0]) and 
               y+j >= 0 and y+j < len(grid) and
               grid[y+j][x+i] == '#':
                result += 1
    return result

proc countActiveNeightbor3D(cube: seq[seq[string]], x: int, y: int, z: int): int =
    result = 0
    for k in -1..1:
        for i in -1..1:
            for j in -1..1:
                if i == 0 and j == 0 and k == 0:
                    continue
                if x+i >= 0 and x+i < n and 
                   y+j >= 0 and y+j < n and
                   z+k >= 0 and z+k < n and
                   cube[z+k][y+j][x+i] == '#':
                    result += 1
    return result

proc countActiveNeightbor(grid: seq[string], x: int, y: int): int =
    result = 0
    for i in -1..1:
        var xx = x+i
        if xx < 0:
            xx += len(grid[0])
        elif xx >= len(grid[0]):
            xx -= len(grid[0])
        for j in -1..1:
            if i == 0 and j == 0:
                continue
            var yy = y+j
            if yy < 0:
                yy += len(grid)
            elif yy >= len(grid):
                yy -= len(grid)
            if grid[yy][xx] == '#':
                result += 1
            echo (j, i, yy, xx, grid[yy][xx])
    return result


var cube = newSeq[seq[string]](0)
var grid = newSeq[string](0)
for line in lines "dummy":
    grid.add(line)

for i in 0..2:
    cube.add(grid)

var newGrid = newSeq[string](0)
for i in 1..len(grid):
    newGrid.add(repeat(".", len(grid[0])))
for y, line in grid:
    for x, chr in line: 
        let k = countActiveNeightborE(grid, x, y)
        # echo k
        if grid[y][x] == '#' and (k == 2 or k == 3):
            newGrid[y][x] = '#'
        if grid[y][x] == '.' and k == 3:
            newGrid[y][x] = '#'
# for i in newGrid:
#     echo i

var newCube = newSeq[seq[string]](0)
for i in 1..n:
    var t = newSeq[string](0)
    for i in 1..n:
        t.add(repeat(".", n))
    newCube.add(t)
for z in 0..2:
    for y, line in cube[z]:
        for x, chr in line: 
            let k = countActiveNeightbor3D(cube, x, y, z)
            echo k
            if cube[z][y][x] == '#' and (k == 2 or k == 3):
                newCube[z][y][x] = '#'
            if cube[z][y][x] == '.' and k == 3:
                newCube[z][y][x] = '#'
# echo countActiveNeightbor3D(cube, 0, 0, 0)
for z, grid in cube:
    echo z
    for i in grid:
        echo i
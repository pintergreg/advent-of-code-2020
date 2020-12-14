import strutils

type
  Facing = enum
    North, East, South, West
    # North=0, East=90, South=180, West=270

var facing = Facing.East
var east = 0
var north = 0
for line in lines "input":
    let value = parseInt(line[1..^1])
    if line.startsWith('F'):
        case facing:
            of Facing.North:
                north += value
            of Facing.East:
                east += value
            of Facing.South:
                north -= value
            of Facing.West:
                east -= value
    if line.startsWith('R'):
        for i in 0..((value /% 90) mod 4)-1:
            if facing != Facing.West:
                facing.inc
            else:
                facing = Facing.North
    if line.startsWith('L'):
        for i in 0..((value /% 90) mod 4)-1:
            if facing != Facing.North:
                facing.dec
            else:
                facing = Facing.West
    if line.startsWith('E'):
        east += value
    if line.startsWith('W'):
        east -= value
    if line.startsWith('N'):
        north += value
    if line.startsWith('S'):
        north -= value
    # echo (east, north, facing)

echo abs(east)+abs(north)
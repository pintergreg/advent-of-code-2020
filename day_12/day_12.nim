import strutils
import tables

proc intSin(x: int): int =
    case x:
        of 90: return 1
        of 180: return 0
        of 270: return -1
        of 0: return 0
        else: return x # not handled properly

proc intCos(x: int): int =
    case x:
        of 90: return 0
        of 180: return -1
        of 270: return 0
        of 0: return 1
        else: return x # not handled properly

type
  Facing = enum
    North, East, South, West

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

echo "part1: $#" % $(abs(east)+abs(north))

var waypoint = {"east": 10, "north": 1}.toTable

facing = Facing.East
east = 0
north = 0
for line in lines "input":
    let value = parseInt(line[1..^1])
    if line.startsWith('F'):
        north += waypoint["north"] * value
        east += waypoint["east"] * value
    if line.startsWith('R'):
        for i in 0..((value /% 90) mod 4)-1:
            if facing != Facing.West:
                facing.inc
            else:
                facing = Facing.North
        # based on https://stackoverflow.com/a/3162731/4737417
        let xnew = waypoint["east"] * intCos(value) + waypoint["north"] * intSin(value)
        let ynew = -waypoint["east"] * intSin(value) + waypoint["north"] * intCos(value)
        waypoint["east"] = xnew
        waypoint["north"] = ynew
    if line.startsWith('L'):
        for i in 0..((value /% 90) mod 4)-1:
            if facing != Facing.North:
                facing.dec
            else:
                facing = Facing.West
        # based on https://stackoverflow.com/a/3162731/4737417
        let xnew = waypoint["east"] * intCos(value) - waypoint["north"] * intSin(value)
        let ynew = waypoint["east"] * intSin(value) + waypoint["north"] * intCos(value)
        waypoint["east"] = xnew
        waypoint["north"] = ynew
    if line.startsWith('E'):
         waypoint["east"] += value
    if line.startsWith('W'):
         waypoint["east"] -= value
    if line.startsWith('N'):
        waypoint["north"] += value
    if line.startsWith('S'):
        waypoint["north"] -= value
    # echo (east, north, facing, waypoint)

echo "part1: $#" % $(abs(east)+abs(north))
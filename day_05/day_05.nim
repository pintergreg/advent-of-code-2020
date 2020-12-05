import strutils
import parseutils
import sets
import sequtils

proc decode(s: string, h: string, l: string): int =
    var temp: string
    temp = s.multiReplace((h, "1"))
    temp = temp.multiReplace((l, "0"))
    discard parseBin(temp, result)
    return

proc calc_id(column: int, seat: int): int = 
    return column*8 + seat

proc calc_id(s: string): int = 
    return calc_id(decode(s[0..6], "B", "F"), decode(s[7..9], "R", "L"))


var max = 0
for line in lines "input":
    let id = calc_id(line)
    if id > max:
        max = id
echo max

# from 64 because the LSB cannot be 1, thus 8*8 seat doen't exist
var seats = toHashSet(toSeq(64..max))
for line in lines "input":
    let id = calc_id(line)
    seats.excl(id)

echo seats
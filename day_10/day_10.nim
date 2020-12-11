import strutils
import algorithm
import tables
import strformat

var lines = newSeq[int](0)
for line in lines "input":
    lines.add(parseInt(line))

lines.sort
var curr = 0
var diffs = initTable[int, int]()
for i in lines:
    let diff = i - curr
    if diff > 3:
        break
    if diff notin diffs:
        diffs[diff] = 0
    diffs[diff] += 1
    curr = i

diffs[3] += 1
echo curr+3
echo diffs
echo "part1: $#" % fmt"{diffs[1]*diffs[3]}"
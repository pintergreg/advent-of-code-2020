import itertools
import strutils

var lines = newSeq[int](0)
const window = 25
for line in lines "input":
    lines.add(parseInt(line))

proc validate(slice: seq[int], target: int): bool =
    result = false
    block outer:
        for i in slice:
            for j in slice:
                if i == j:
                    continue
                if i+j == target:
                    result = true
                    break outer
    return


for i in windowed(lines, window+1):
    # echo (i[0..^2], i[^1])
    # echo (i[0..^2], i[^1], validate(i[0..^2], i[^1]))
    if not validate(i[0..^2], i[^1]):
        echo i[^1]
        break
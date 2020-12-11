import itertools
import strutils
import math

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

var bad = 0
for i in windowed(lines, window+1):
    # echo (i[0..^2], i[^1])
    # echo (i[0..^2], i[^1], validate(i[0..^2], i[^1]))
    if not validate(i[0..^2], i[^1]):
        bad = i[^1]
        break

echo bad
for width in 4..20: # not really smart should find a more precise limit
    for i in windowed(lines, width):
        if sum(i[0..^1]) == bad:
            let min = min(i[0..^2])
            let max = max(i[0..^2])
            echo min+max
            break
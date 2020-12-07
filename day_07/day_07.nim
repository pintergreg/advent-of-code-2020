import tables
import strutils
# import sequtils
import re


var data = initTable[string, Table[string, int]]()
for line in lines "input":
  let half = line[0..^2].split(" bags contain ")
  data[half[0]] = initTable[string, int]()
  for i in half[1].split(", "):
      if i =~ re"^(\d+) (.+) bag":
          data[half[0]][matches[1]] = parseInt(matches[0])
      if i == "no other bags":
          data[half[0]]["zero"] = 0
# echo data

proc count_target(data: Table[string, Table[string, int]], target: string): (int, seq[string], seq[string]) =
    var count = 0
    var counts = newSeq[string](0)
    var next = newSeq[string](0)
    for k, v in data.pairs:
        for kk, vv in v.pairs:
            if kk == target:
                next.add(k)
                # c.add("$#/$#" % [target, k])
                counts.add(k)
                count += 1
                break
    return (count, next, counts)

var targets = @["shiny gold"]
var count = 0
var counts = newSeq[string](0)
while len(targets) > 0:
    let t = targets.pop()
    var part = count_target(data, t)
    # echo part
    count += part[0]
    for i in part[1]:
        if i notin targets:
            targets.add(i)
    for i in part[2]:
        if i notin counts:
            counts.add(i)

echo count
echo len(counts)

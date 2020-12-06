import strutils
import sets

var group_answers = initHashSet[char](0)
var count = 0
for line in readFile("input").split("\n"):
    if line.strip == "":
        count += len(group_answers)
        group_answers.clear
        continue
    for i in line:
        group_answers.incl(i)
echo count

var group_answers2 = newSeq[string](0)
var count2 = 0
for line in readFile("input").split("\n"):
    if line.strip == "":
        var temp = toHashset(group_answers2[0])
        for i in group_answers2[1..^1]:
            temp = temp * toHashSet(i)
        count2 += len(temp)
        group_answers2 = newSeq[string](0)
        continue
    group_answers2.add(line)
echo count2

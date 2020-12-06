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
import strutils
import re
var correct = int(0)
var correct_b = 0
for line in lines "input":
    if line =~ re"(\d+)-(\d+)\ ([a-z]):\ (\w+)": # matches a key=value pair:
        # var policy = $(parseInt(matches[0]), parseInt(matches[1]), matches[2], matches[3])
        if count(matches[3], matches[2]) >= parseInt(matches[0]) and count(matches[3], matches[2]) <= parseInt(matches[1]):
            correct += 1
        let pass = matches[3]
        if pass[parseInt(matches[0])-1] == matches[2][0] xor pass[parseInt(matches[1])-1] == matches[2][0]:
            correct_b += 1

echo correct
echo correct_b
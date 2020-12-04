import strutils
import sequtils
import tables

const passport_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
var valid = 0
var found = initTable[string, string]()
for line in readFile("input").split("\n"):
    if line.strip == "":
        if passport_fields.allIt(toSeq(found.keys).contains(it)):
            valid += 1
        found.clear
        continue
    for field in line.strip.split(" "):
        found[field.split(":")[0]] = field.split(":")[1]

echo valid
import strutils
import sets

const passport_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
var valid = 0
var invalid = 0
var missing = toHashSet(passport_fields)
var empty = 0
for line in readFile("input").split("\n"):
    for field in line.strip.split(" "):
        missing.excl(field.split(":")[0])

    if line.strip == "":
        empty += 1
        if len(missing) == 0:
            valid += 1
        else:
            invalid += 1
        missing = toHashSet(passport_fields)

echo valid
echo invalid
echo empty
import strutils
import sequtils
import tables
import re

proc isYearValid(y: string, min: int, max: int): bool =
    return parseInt(y) in min..max

proc isPassportIDValid(x: string): bool =
    return x =~ re"^\d{9}$"

proc isHeightValid(x: string): bool =
    result = false
    if x =~ re"(\d+)(cm|in)":
        if (matches[1] == "cm" and parseInt(matches[0]) in 150..193) or (matches[1] == "in" and parseInt(matches[0]) in 59..76):
            result = true
    return

proc isHairColorValid(x: string): bool =
    return x =~ re"#[0-9,a-f]{6}"

proc isEyeColorValid(x: string): bool =
    return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(x)

const passport_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
var valid = 0
var valid2 = 0
var found = initTable[string, string]()
for line in readFile("input").split("\n"):
    if line.strip == "":
        if passport_fields.allIt(toSeq(found.keys).contains(it)):
            valid += 1
            if isYearValid(found["byr"], 1920, 2002) and
                isYearValid(found["byr"], 1920, 2002) and
                isYearValid(found["iyr"], 2010, 2020) and
                isYearValid(found["eyr"], 2020, 2030) and 
                isHeightValid(found["hgt"]) and
                isHairColorValid(found["hcl"]) and
                isEyeColorValid(found["ecl"]) and
                isPassportIDValid(found["pid"]):
                    valid2 += 1
        found.clear
        continue
    for field in line.strip.split(" "):
        found[field.split(":")[0]] = field.split(":")[1]

echo valid
echo valid2
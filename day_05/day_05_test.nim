import unittest
include day_05

# BFFFBBFRRR: row 70, column 7, seat ID 567.
# FFFBBBFRRR: row 14, column 7, seat ID 119.
# BBFFBBFRLL: row 102, column 4, seat ID 820.

test "decode":
    const cases = [("BFFFBBF", "B", "F", 70), ("FFFBBBF", "B", "F", 14), ("BBFFBBF", "B", "F", 102), ("RRR", "R", "L", 7), ("RLL", "R", "L", 4)]
    for c in cases:
        let actual: int = decode(c[0], c[1], c[2])
        check(actual == c[3])

test "ID calc":
    const cases = [("BFFFBBFRRR", 567), ("FFFBBBFRRR", 119), ("BBFFBBFRLL", 820)]
    for c in cases:
        let actual: int = calc_id(c[0])
        check(actual == c[1])
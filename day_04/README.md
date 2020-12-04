# Lessons learned

Using `for line in lines "input":` to iterate through the lines of the input as before causes problem as the last empty line is neglected.
Valid count of mine was 169. One less.

Workaround could be adding and extra empty line but that's a modification on the input.

Solution is using `for line in readFile("input").split("\n"):`

# Part 2 modifications

While for the first part I counted which field is missing, for the part 2 I need to store the ones I found and also store the values.
So, instead excluding from the full set, adding to an empty tables, than validating the values.

I also had to move the empty line handling before the field splitting, because the `field.split(":")[1]` causes error at empty lines.

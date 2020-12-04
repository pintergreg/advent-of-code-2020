# Lessons learned

Using `for line in lines "input":` to iterate through the lines of the input as before causes problem as the last empty line is neglected.
Valid count of mine was 169. One less.

Workaround could be adding and extra empty line but that's a modification on the input.

Solution is using `for line in readFile("input").split("\n"):`
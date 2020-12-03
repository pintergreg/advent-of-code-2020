var trees = 0
var pos = -3
for line in lines "input":
    let width = len(line)
    pos += 3
    if pos >= width:
        pos = pos-width
    echo line[pos]
    if line[pos] == '#':
        trees += 1
echo trees

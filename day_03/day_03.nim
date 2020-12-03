var trees = 0
let right = 1
let down = 2

var pos = -right
var k = -1
for line in lines "input":
    k += 1
    if k mod down != 0:
        continue
    let width = len(line)
    pos += right
    if pos >= width:
        pos = pos-width
    echo line[pos]
    if line[pos] == '#':
        trees += 1
echo trees

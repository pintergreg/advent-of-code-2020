var trees = 0
var pos = -3
for line in lines "input":
    let width = len(line)
    for i in countup(pos, width-1, 3):
        if pos < 0:
            pos = 0
            break
        echo line[i]
        if line[i] == '#':
            trees += 1
        pos += 1 
        if pos >= width:
            pos = pos-width

echo trees

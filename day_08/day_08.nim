import strutils

var program = newSeq[string](0)
for line in lines "input":
    program.add(line)

var acc = 0
var i = 0
var executed = newSeq[int](0)
while true:
    if i notin executed:
        executed.add(i)
    else:
        echo "AGAIN"
        break
    # echo program[i]
    if i == len(program):
        break
    let instruction = program[i].split(" ")[0]
    let parameter = parseInt(program[i].split(" ")[1])
    if instruction == "nop":
        i += 1
    if instruction == "acc":
        acc += parameter
        i += 1
    if instruction == "jmp":
        i += parameter
    # echo acc
echo acc

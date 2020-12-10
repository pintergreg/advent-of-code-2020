import strutils

var program = newSeq[string](0)
for line in lines "input":
    program.add(line)

proc executeProgram(program: seq[string]): (int, bool) =
    var terminated = true
    var acc = 0
    var i = 0
    var executed = newSeq[int](0)
    while true:
        if i notin executed:
            executed.add(i)
        else:
            terminated = false
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
    return (acc, terminated)

echo executeProgram(program)

# try to change any nop to jmp or vice versa one by one, but only one at a time
# then execute the program, if it terminates, the wrong one has been found
var tried = newSeq[int](0)
for i in 1..len(program):
    var changed = false
    var fixed = newSeq[string](0)
    for k, i in program:
        var new_i = i
        if not changed and k notin tried:
            if i[0..2] == "nop":
                new_i = "jmp$#" % i[3..^1]
                changed = true
                tried.add(k)
            if i[0..2] == "jmp":
                new_i = "nop$#" % i[3..^1]
                changed = true
                tried.add(k)
        fixed.add(new_i)
    let r = executeProgram(fixed)
    if r[1]:
        echo r
        break
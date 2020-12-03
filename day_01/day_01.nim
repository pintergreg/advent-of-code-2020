import strutils

var list = newSeq[int](0)
for line in lines "input":
  list.add(parseInt(line))

block outer:
    for i in list:
        for j in list:
            if i+j == 2020:
                echo i*j
                break outer

block outer:
    for i in list:
        for j in list:
            for k in list:
                if i+j+k == 2020:
                    echo i*j*k
                    break outer
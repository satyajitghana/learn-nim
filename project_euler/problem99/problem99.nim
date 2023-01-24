import math
import std/strutils
import strformat
import std/enumerate

const file = "p099_base_exp.txt"

var
    largest_a = 1
    largest_b = 1
    largest_idx = -1

for idx, line in enumerate(file.lines):
    let values = line.split(",")

    let
        a = values[0].parseInt
        b = values[1].parseInt

    if (b.toFloat * a.toFloat.log10) > (largest_b.toFloat * largest_a.toFloat.log10):
        largest_b = b
        largest_a = a
        largest_idx = idx

echo fmt"a = {largest_a} b = {largest_b}, idx = {largest_idx+1}"

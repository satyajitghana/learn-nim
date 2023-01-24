
import strutils
import strformat
import std/math
import std/tables

# compute primes lookup table
proc get_primes(limit: int): seq[bool] =
    var is_prime = newSeq[bool](limit+1)

    for n in 2 .. limit:
        is_prime[n] = true

    let sqrt_limit = limit.toFloat.sqrt.toInt + 2

    # echo fmt"{sqrt_limit}"

    for n in 0..sqrt_limit:
        if is_prime[n]:
            for i in countup(n * n, limit, n):
                is_prime[i] = false

    result = is_prime

let is_prime = 1_000_000.get_primes

proc check_goldbach_conjecture(num: int): bool {.discardable.} =
    for i in 1..num.toFloat.sqrt.toInt:
        let left = num - 2 * i * i
        if left > 0 and is_prime[left]:
            # echo fmt"{num} = {left} + 2 * {i}^2"
            return false

    return true

var found = false

let limit = 1_000_000

for n in countup(9, limit, 2):
    if not is_prime[n]:
        if check_goldbach_conjecture(n):
            echo fmt"{n}"
            found = true
            break

if not found:
    echo "not found"

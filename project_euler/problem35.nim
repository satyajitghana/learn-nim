import strutils
import strformat
import std/math
import std/tables

# # compute primes lookup table
proc get_primes(limit: int): seq[bool] =
    var is_prime = newSeq[bool](limit+1)

    for n in 2 .. limit:
        is_prime[n] = true

    # echo is_prime[0..20]

    let sqrt_limit = limit.toFloat.sqrt.toInt + 2

    # echo fmt"{sqrt_limit}"

    for n in 0..sqrt_limit:
        if is_prime[n]:
            for i in countup(n * n, limit, n):
                is_prime[i] = false

    result = is_prime

let primes = 1_000_000.get_primes

# echo primes[0..20]

# var num: int = 197
# var num_digits = num.intToStr.len
# for i in 1..num_digits:
#     var ones = num.euclMod(10)
#     num = ((num / 10)).int  + (10.toFloat.pow(num_digits.toFloat-1) * ones.toFloat).int
    
#     # echo primes[num]

let is_circular_prime = initTable[int, bool]()

let limit = 1_000_000

proc check_circular_prime(num: var int): bool =

    if num in is_circular_prime:
        return is_circular_prime[num]

    let num_digits = num.intToStr.len

    for i in 1..num_digits:
        let ones = num.euclMod(10)
        num = ((num / 10)).int  + (10.toFloat.pow(num_digits.toFloat-1) * ones.toFloat).int

        if not primes[num]:
            return false

    return true

# echo check_circular_prime(num)

var count = 0

for i in 0..limit:
    var num = i
    if num.check_circular_prime:
        count += 1

echo fmt"count = {count}"

---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Sieve 
parent: Learn by Examples
description: The sieve benchmark counts the number of primes below 600000 using the Blade programming .language.
---

# Sieve
{: .fs-9 }

The sieve benchmark counts the number of primes below 600000.
{: .fs-6 .fw-300 }

```blade
def sieve(number) {
  var primes = to_list(0..(number + 1))

  var i = 2
  while i ** 2 <= number {
    if primes[i] != 0 {
      for j in 2..number {
        if primes[i] * j > number break
        else primes[primes[i] * j] = 0
      }
    }
    i += 1
  }

  var count = 0
  for c in 2..(number + 1) {
    if primes[c] != 0 count += 1
  }

  return count
}

var start = time()

echo sieve(600000)

echo 'Time taken = ${time() - start}'
```

The correct result is 49098.
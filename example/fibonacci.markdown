---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Fibonacci 
parent: Learn by Examples
description: Generate fibonacci series using the Blade programming language.
---

# Fibonacci
{: .fs-9 }

Generate Fibonacci series.
{: .fs-6 .fw-300 }

```blade
def generate_fibonacci(n) {
  var fib = [1] * n
  for i in 2..n {
    fib[i] = fib[i - 2] + fib[i - 1]
  }
  return fib
}

var fib = generate_fibonacci(35)
print(' '.join(fib))
```
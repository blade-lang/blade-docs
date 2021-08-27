---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Guessing Game 
parent: Learn by Examples
description: A simple guessing game in Blade.
---

# Guessing Game
{: .fs-9 }

A simple guessing game.
{: .fs-6 .fw-300 }

```blade
import io { readline }

echo '== Guess the number =='

while true {
  print('\nGuess a number from 0 to 100: ')

  var secret = rand(1, 100)
  var guess = to_number(readline())

  if guess > secret echo '\nYou guessed too big!'
  else if guess < secret echo '\nYou guessed small!'
  else echo '\nYou guessed right.'

  echo 'The secret number was ${secret}'

  var try_again = false
  print("\nDo you want to try again? Enter 'y' for yes: ")

  if readline() != 'y' break
}

echo '\nGoodbye!'
```
---
layout: default
title: bcrypt
parent: Standard Library
nav_order: 7
permalink: /standard/bcrypt
---

# bcrypt

This module provides functions for generating and verifying bcrypt 
hashes as well as functions for getting informations from a bcrypt hash.



<h2>Properties</h2><hr>

{:#bcrypt__DEFAULT_LOG2_ROUNDS} _bcrypt._**DEFAULT_LOG2_ROUNDS**
: Default log2 rounds (default: 10)
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



^
{:#bcrypt__MAX_EXECUTION_TIME} _bcrypt._**MAX_EXECUTION_TIME**
: Maximum execution time for each cipher iteration in 
  milliseconds (default: 100)
   <div class="cite"><span class="hint">type</span> <span>number</span></div>





<h2>Functions</h2><hr>

{:#bcrypt__hash} _bcrypt_.**hash**(_str_: string [, _salt_length_: number])
: Generates a hash for the given string. If _salt_length_ is not given, 
  the length of the salt will be equal to `DEFAULT_LOG2_ROUNDS`.
   <div class="cite"><span class="hint">throws</span> <span>Exception</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#bcrypt__compare} _bcrypt_.**compare**(_str_: string, _known_hash_: string)
: Tests a string against a known hash.
   <div class="cite"><span class="hint">throws</span> <span>Exception</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#bcrypt__get_rounds} _bcrypt_.**get_rounds**(_hash_: string)
: Gets the number of rounds used to encrypt the specified hash.
   <div class="cite"><span class="hint">throws</span> <span>Exception</span></div>

   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#bcrypt__get_salt} _bcrypt_.**get_salt**(_hash_: string)
: Gets the salt portion from a hash.
  > - This function does not validate the hash.
   <div class="cite"><span class="hint">throws</span> <span>Exception</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>




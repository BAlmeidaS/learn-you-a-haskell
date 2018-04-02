# 1# Chapter

Negative numbers must be write with parentheses on expressions:
```
$> 1 + -3
<interactive>:11:1: error:
    Precedence parsing error
        cannot mix ‘+’ [infixl 6] and prefix `-' [infixl 6] in the same infix expression
$> 1 + (-3)
-2
```

Boolean logic is straightforward.
`True`, `False`, `not (True)`, `&&`, `||`

Equality operator: `==`
Inequality: `/=`

##### Calling a function
`func param_1 param_2 ...`

eg:
```
$> succ 1
2
$> max 3 1
3
$> min 7 71
7
$> div 63 9
7
```
```$> 63 `div` 9``` **Infix function**

## Creating Functions

Functions can't begin with capital letters!.

funcName param_1 param_2 ... = *what-function-does*

`doubleMe x = x + x`

##### if statement

In haskell **else** on if **is mandatory!**

```
if <confitional>
  then <something>
  else <other_something>
```

"Functions are used to tranform data values into result values, and evey function should return some value, which can in turn be used by another function. Since every function has to return something, this implies that every *if* has to have a corresponding *else*."

##### special characters on function names

We can use `'` on function name, this does not have a special meaning, just denote a strict version of a function, a slightly modified version or variable with similar name.

##### functions without parameters

`brunoAlmeida = "I'm Bruno Almeida and I am studying Haskell using Lipovaca's book`

functions without parameters is a `definition` or a `name`. We cannot change what names mean once we have defined them!
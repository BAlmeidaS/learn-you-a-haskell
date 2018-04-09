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

Obs: `let` on GHCi is equivalent to define a `definition` on a script

## Lists

Lists are **homogeneous** data scructures, which means they store several elements of the same type.

```
$> let lostNumbers=[4,8,15,16,23,42]
$> lostNumbers
[4,8,15,16,23,42]
```

##### Concatenation
```
$> [1,2,3] ++ [13,14,15]
[1,2,3,13,14,15]
$> "Studying" ++ " " ++ "Haskell"
"Studying Haskell"
```

Strings are lists =].

Haskell has to walk through the entire first list when we using `++` operator.

##### Cons Operator
Adding an item to the beginning of a list. Very perfomatic, near instantaneous
```
$> 1:[3,4]
[1,3,4]
```

###### Some implementation details
In fact, `[1,2,3]` is a sugar code to `1:2:3:[]`

##### Accessing List Elements
Operator `!!`

```
$> "Bruno Almeida" !! 3
'n'
```

##### Comparing list
lists are comparable in lexicographical order. Operators:  `<`, `<=`, `>=`, `>`, `==`

```
$> [3,2,1] > [2,10,100]
True
```

##### Head and Tail
```
$> head [5,4,3,2,1]
5
$> tail [5,4,3,2,1]
[4,3,2,1]
```

###### Last and Init

```
$> last [5,4,3,2,1]
1
$> init [5,4,3,2,1]
[5,4,3,2]
```

##### Length
```
$> length [4,3,2]
3
```

##### Null
check if list is empty
```
$> null [2,1]
False
$> null []
True
```

##### Reverse
```
$> reverse [4,3,2]
[2,3,4]
```

##### Take
```
$> take 2 [21,31,41]
[21,31]
```

##### Drop
```
$> drop 2 [33,44,55,66,77,88]
[55,66,77,88]
```

##### Maximum and Minimum
```
$> maximum [12,4,37,73,5]
73
$> minimum [12,4,37,73,5]
4
```

##### Sum and Product
```
$> sum [1,2,3,4]
10
$> product [1,2,3,4]
24
```

##### Elem
check if the item is in the list
```
$> elem 37 [12,4,37,73,5]
True
$> 37 `elem` [12,4,37,73,5]
True
$> 999 `elem` [12,4,37,73,5]
False
```

##### Ranges
```
$> [1..10]
[1,2,3,4,5,6,7,8,9,10]
$> ['a'..'t']
"abcdefghijklmnopqrst"
$> [8,7..3]
[8,7,6,5,4,3]
```

We could specify a step between items. This step must define a arithmetic progression.

```
$> [3,6..20]
[3,6,9,12,15,18]
$> [0.1,0.3..1]
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]
```

You can specify a range without upper limit, because haskell is lazy it won't evaluate the list before it need it.

```
$> take 7 [12,26..]
[12,26,40,54,68,82,96]
```

##### Cycles

cycles define an infinite lists.
```
$> take 27 (cycle "Haskell ")
"Haskell Haskell Haskell Has"
```

##### Repeat
```
$> take 5 (repeat "Hi")
["Hi","Hi","Hi","Hi","Hi"]
```
##### Replicate
An easier way to compose a list with a single item
```
$> replicate 5 "Hi"
["Hi","Hi","Hi","Hi","Hi"]
```

## List Comprehension

A way to filter, transform and combine lists. Similary to the math concept to define a set: `{ 2.x | x IN N, x <= 10 }`
The example says, *take all the natural number less than or equal to 10, multiply each one by 2, and use these results to create a new set*

Using list comprehension we could write this:
```
$> [x*2 | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]
```

###### Predicate
Predicates are conditions on list comprehensions, they appear after the `|` and they are separete by a comma.

adding a predicate on last example:
```
$> [x*2 | x <- [1..10], x*2 >= 12]
[12,14,16,18,20]
```


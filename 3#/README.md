# Pattern Matching

#### As-patterns
Allow you to break up an item according to a pattern, while still keeping a reference to the original item.

```haskell
firstLetter :: String -> String
firstLetter "" = "Empty String!"
firstLetter all@(x:xs) = "the message is: " ++ show all ++ ". And the first letter is: " ++ show x
...
ghci> firstLetter ""
"Empty String!"
ghci> firstLetter "hey man"
"the message is: \"hey man\". And the first letter is: 'h'"
```

## Guards
conditionals put on functions that work as a pattern matching but to check if some expression is true or false:
```haskell
bmiTell :: Double -> Double -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "underweight"
  | weight / height ^ 2 <= 25.0 = "nice"
  | weight / height ^ 2 <= 30.0 = "overweight"
  | otherwise = "obese"
```

## Where
where is useful to define variables and functions, and re-use them.

```haskell
bmiTell2 :: Double -> Double -> String
bmiTell2 weight height
  | bmi <= skinny = "underweight"
  | bmi <= normal = "nice"
  | bmi <= overweight = "overweight"
  | otherwise = "obese"
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        overweight = 30.0
```

#### where scope
where bindings are **not shared** across functions bodies of different patterns

This does not work properly:
```haskell
greet :: String -> String
greet "Juan" = niceGretting ++ " Juan!"
greet name = BadGretting ++ " " ++ name
  where niceGretting = "Hello!"
        badGretting = "Pff. It's you."
```

This is going to work properly
```haskell
niceGretting :: String
niceGretting = "Hello!"

badGretting :: String
badGretting = "Pff. It's you."

greet :: String -> String
greet "Juan" = niceGretting ++ " Juan!"
greet name = BadGretting ++ " " ++ name
```

#### where with pattern matching
```haskell
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname
```

## Let
Let expressions are very similar to where bindings. `where` allows you bind to variables at the end of a function, and thos variables are visible to the entire functions, including all its guards. `let` exression, on the other hand, allow you to bind to variables anywhere and are expressions themselfs. However, they are very local, and they do not span across guards. **Binding an expression in some variable**
```haskell
ghci> 2 * (let a = 9 in a + 1) + 2
22
ghci> (let (a, b, c) = (1, 2, 3) in a+b+c)
6
```

#### let in list comprehensions
```haskell
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
```

the `(w, h) <- xs` part of the list comprehension is called the **generator**. Whe can not refger to the bmi variable in the generator, cause that is defined prior to the let binding.

## Case
In essence, pattern matching is a syntactic sugar for a case expressions
```haskell
case expression of pattern -> result
                   pattern -> result
                   ...
```

# The equivalent manners using pattern matching, where and case
```haskell
describeListPatternMatching :: [a] -> String
describeListPatternMatching [] = "this is an empty list"
describeListPatternMatching [x] = "this is a singleton list"
describeListPatternMatching xs = "this is a longer list"

describeListCase :: [a] -> String
describeListCase ls = "this is a " ++ case ls of [] -> "an empty list"
                                                 [x] -> "a singleton list"
                                                 xs -> "a longer list"

describeListWhere :: [a] -> String
describeListWhere ls = "This list is " ++ defineList ls
  where defineList [] = "empty list"
        defineList [x] = "a singleton list"
        defineList xs = "a longer list"
```
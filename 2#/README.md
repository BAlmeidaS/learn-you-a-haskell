# Types 101

`:t` give us the the type of the expression

``` haskell
ghci> :t 'a'
'a' :: Char

ghci> :t (True, 1, 3.7, "bruno", 'a')
(True, 1, 3.7, "bruno", 'a')
  :: (Num b, Fractional c) => (Bool, b, c, [Char], Char)
```

##### defining a function with type declaration

- declare the function types
- then declare the function

```haskell
factorial :: Integer -> Integer
factorial n = product [1..n]
```

### Type of a function

we can discovery what is the type declaration of some function, like `head`:

```haskell
ghci> [1..10]
[1,2,3,4,5,6,7,8,9,10]
ghci> head([1..10])
1
ghci> :t head
head :: [a] -> a
```

*head receives an array of some element with type a, then returns something with the same type a*

## Type Classes
A type class ia an interface that defines some behavior. More specifically, a type class specifies a bunch of functions

```haskell
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool
```

before the `=>` is called a **class constraint**. We can read this as: *"The equality function takes any two values that are of the same type and returns a Bool. The type of those two values must be an instance of the Eq class."*

### Some type class
#### The Eq Type Class
```haskell
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool
ghci> 5 == 5
True
ghci> 3 /= 4
True
```

#### The Ord Type Class
```haskell
ghci> :t (>)
(>) :: Ord a => a -> a -> Bool
ghci> "bruno" > "San Francisco"
True
ghci> "bruno" `compare` "San Francisco"
GT
ghci> compare 2 4
LT
ghci> 2 > 5
False
```

#### The Show Type Class
```haskell
show :: Show a => a -> String
ghci> show 3
"3"
ghci> show True
"True"
```

#### The Read Type Class
```haskell
ghci> :t read
read :: Read a => String -> a
ghci> read "9.1" + 1.1
10.2
ghci> read "True" || False
True
...
ghci> read "5"
*** Exception: Prelude.read: no pars
ghci> read "5" :: Float
5.0
ghci> (read "5" :: Float) + 3.1
8.1
ghci> [read "5", 1.2, 3.7]
[5.0,1.2,3.7]
```

#### The Enum Type Class
```haskell
ghci> :t succ
succ :: Enum a => a -> a
ghci> succ 'B'
'C'
ghci> succ 37
38
ghci> ['a'..'k']
"abcdefghijk"
ghci> [LT .. GT]
[LT,EQ,GT]

```

#### The Bounded Type Class
```haskell
ghci> :t minBound
minBound :: Bounded a => a
ghci> :t maxBound
maxBound :: Bounded a => a
ghci> maxBound :: Char
'\1114111'
ghci> minBound :: Bool
False
ghci> maxBound :: Int
9223372036854775807
```

#### The Num Type Class
```haskell
ghci> :t 37
37 :: Num p => p
ghci> 37 :: Int
37
ghci> 37 :: Integer
37
ghci> 37 :: Float
37.0
ghci> 37 :: Double
37.0
```

#### The Integral Type Class
```haskell
ghci> :t fromIntegral
fromIntegral :: (Num b, Integral a) => a -> b
ghci> 3 + 4.2
7.2
ghci> (3 :: Int) + 4.2

<interactive>:118:14: error:
    • No instance for (Fractional Int) arising from the literal ‘4.2’
    • In the second argument of ‘(+)’, namely ‘4.2’
      In the expression: (3 :: Int) + 4.2
      In an equation for ‘it’: it = (3 :: Int) + 4.2
ghci> fromIntegral (3 :: Int) + 4.2
7.2
```
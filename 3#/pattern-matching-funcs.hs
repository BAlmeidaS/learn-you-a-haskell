lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "sorry, you are out of luck"

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

head' :: [a] -> a
head' [] = error "empty list"
head' (x:_) = x

tell :: Show a => [a] -> String
tell [] = "The list is empty"
tell [x] = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list is long, the first element is " ++ show x ++ " and the second is " ++ show y

-- As patterns
firstLetter :: String -> String
firstLetter "" = "Empty String!"
firstLetter all@(x:xs) = "the message is: " ++ show all ++ ". And the first letter is: " ++ show x

-- Guards
bmiTell :: Double -> Double -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "underweight"
  | weight / height ^ 2 <= 25.0 = "nice"
  | weight / height ^ 2 <= 30.0 = "overweight"
  | otherwise = "obese"

-- Where
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

bmiTell3 :: Double -> Double -> String
bmiTell3 weight height
  | bmi <= skinny = "underweight"
  | bmi <= normal = "nice"
  | bmi <= overweight = "overweight"
  | otherwise = "obese"
  where bmi = weight / height ^ 2
        (skinny, normal, overweight) = (18.5, 25.0, 30.0)


-- pattern matching with where
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

-- let in list comprehensions
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

calcBmisOfFat :: [(Double, Double)] -> [Double]
calcBmisOfFat xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0]

-- equivalent forms
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

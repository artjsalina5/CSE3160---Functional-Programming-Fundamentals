# CSE 3160 Week 3

## Tuples

- Tuples are composite values
  - Ordered collections of *typed fields*
  - Each field can have its own type
  - *Fixed* number of fields
- When only 2 fields,
  - Called *pairs*
- You can *bind* a tuple to a name
- you can query the type of the tuple
- you can *nest* tuples

```hs
>(1,42)
(1,42)
>:t (1,42)
(1,42) :: (Num a, Num b) => (a,b)
> ("The Question", 42)
("The Question", 42)
>:t ("The Question", 42)
("The Question", 42) :: Num b => (String, b)
>:t (1,42,6)
(1,42,6) :: (Num a, Num b, Num c) => (a, b, c)
>t=(1,42,6)
>t
(1,42,6)
>:t t
t :: (Num a, Num b, Num c) => (a, b, c)
> t = (1,42,(6,"World"),'b')
```

### Tuple Query

- When we deal with *pairs*
  - We can use `fst` to get the first field
  - We can use `snd` to get the second field
  - But only for *pairs*
- *Pattern Matching* still works
  - You use `_` for a partial match
- Implementations of `fst`/`snd`

```hs
fst (a,_) = a
snd (_,b) = b
```

```hs
>p = (1,42)
>fst p
1
>snd p
42
>:t fst
fst :: (a, b) -> a
>:t snd
snd :: (a, b) -> b
> let (a,b) = (1,42)
>a
1
>b
42
>let (_,c) = (1,42)
> c
42
```

### Question

- Write a function `tripleSum` that takes a pair of numbers and returns the sum of its components

```hs
tupleSum :: (a, a) -> a
tupleSum x = fst x + snd x

```

- But this can be simplified by using `uncurry`

## Curry and Uncurry

- These are convenience functions
  - `curry` converts from function of one argument to function of two arguments

  ```hs
  >:t curry
  curry :: ((a, b) -> c) -> a -> b -> c
  ```

  - `uncurry` converts from function of pair of arguments to function of two arguments

  ```hs
  >:t uncurry
  uncurry :: (a -> b -> c) -> (a, b) -> c
  ```

## Lists

- Lists hold
  - An arbitrary number of elements *all of the same type*
  - Could be *zero* element as well (an empty list)
  - Could be a *finite* number
  - Could be *infinite*!
- There are *convenience* functions to work on lists
- We have *higher order* functions to work on lists
- We have *comprehensions* to work with lists
- Lists are just special containers and form an *algebraic data type*
  - *ADT*

### Basic List Handling

- Functions

#### `head`

- Extract first element of a list which must be non-empty

```hs

>>> head [1, 2, 3]
1

>>> head [1..]
1

>>> head []
*** Exception: Prelude.head: empty list

```

#### `tail`

- Extract Elements after the head of a list which must be non-empty

```hs

>>> tail [1, 2, 3]
[2,3]

>>> tail [1]
[]

>>> tail []
*** Exception: Prelude.tail: empty list
```

#### `length`

Returns the size/length of a finite structure as an  `Int` .  The
 default implementation just counts elements starting with the leftmost.
 Instances for structures that can compute the element count faster
 than via element-by-element counting, should provide a specialised
 implementation.

```hs

Basic usage: 

>>> length []
0

>>> length ['a', 'b', 'c']
3

>>> length [1..]
* Hangs forever *
```

#### `null`

- Test whether the structure is empty.  The default implementation is
 Left-associative and lazy in both the initial element and the
 accumulator.  Thus optimised for structures where the first element can
 be accessed in constant time.  Structures where this is not the case
 should have a non-default implementation. #### **Examples**

Basic usage:

```hs
>>> null []
True

>>> null [1]
False
```

`null`  is expected to terminate even for infinite structures.
 The default implementation terminates provided the structure
 is bounded on the left (there is a leftmost element).

```hs
>>> null [1..]
False
```

## Folding

- A way to process a data structure in some order and build a return value
- To fold you need:
  - A combining Function
  - A starting Value
  - A Data Structure
- These are used when you want ot traverse the data strucuture and use each element with the combining function to build the return value

- There are two ways to traverse the data structure
  - From left-to-right
  - From right-to-left

```hs
```

### foldl

- Accumulate from left-to right
- iterates over the strucuture and aggregates using the combining function
- Similar to a looping/iterating over list in an imperative language
-

```hs
foldl' _ acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs
```

- Can you write fold cold?

### foldr

- This accumulates from right to left

```hs
foldr' _ acc [] = acc
foldr' f acc (x:xs) = f x (foldr f acc xs)
```

- This is on the way back up

### Some Examples

```hs
firstFivePal :: (Eq a) => [a] -> Bool
firstFivePal s =
  let f5 = take 5 s
   in reverse f5 == f5

-- | Takes a string as an argument and returns number, n, of lowerCase elements in list
nbLower :: [Char] -> Int
nbLower s = length $ filter isLower s
```

```hs
sum = foldl (+) 0
```

- Product

```hs
productf = foldl (*) 1
```

- The base case of this case is 1, not 0

- Compute length with a fold

```hs
lengthf = foldl (\acc _ -> acc + 1 ) 0 
```

- but recall that (+1) is the same as this

## Compute via folds

- List of btis to integer [1,0,1,1] -> 11
  - How would you implement this calculation that converts from binary to decimal?
  - No loops.

  ```hs
  bitsToInt = foldl (\ acc b -> 2*acc + b) 0
  ```

  - Recall the left walks down the list
  - 0 is the base case

```hs
`
bitsToIntf = foldl (\acc b -> 2 * acc + b) 0

{- with a fold right the accumulator needs to be 0->1->2->3
 - we add 1 to the accumulator
 - -}
bitsToInt2 = foldr (\b (rs, p) -> ((rs + b * 2 ^ p), (p + 1)))
```

- This can be done with a string using

```hs
import Data.Char 
strBitsToInt = bitsToInt . (map digitToInt)
```

### Flipping

- A neat little higher order function

```hs
flip :: (a -> b -> c) -> b -> a -> c
flip f x y = f y x
```

## To Review

- A lot can be done without writing a loop

### Example

```hsut
> bigList = [1..1000000000]
> x = 10 `elem` init bigList
> y = 99999999 `elem` init bigList
```

- Recall: `init` returns a list of the first `n-1` items
  - `elem e l` returns `True` if value `e` belongs to the
      list (e must be a member of Eq)

- Since Haskell is lazy, it creates a Thunk that is the list, but doesn't
  actually create the list
- recall that `x =`  and `y=` just build the recipe, not actually computing
- Not until print is called

## Observations

- Lazy eval means
  - You only state when you call that *you might need a value later*
  - But until you actually try to use it.. it remains unevaluated
  - Such values are produced *on demand*

- Even more dramatically: The example of "take"
- Play fast or slow

```hs
> l0 = [1..1000000000]
> l1 = take 10000000000 l0
> sum (take 10 l1) -- This is fast because you don't have to expand the entire l1
```

- l1 is the name of a Thunk that will produce 1'000'000'000 elements
- sum is fast because its proportional to 10

### Elaboration

- It's not that `take` or `sum` is special, it is just lazy evaluation

## Infinite Data Structures

- Consider

```hs
x = [1,2 ..]
```

- New syntax means its an *infinite list*
  - x is an infinite list
  - it starts at 1, its second element is 2
  - To go from element 1 to 2 we did `(+1)`

### Generators

- Generators just do `take`

```py
def mysum(xs):
  ttl = 0
  for x in xs:
    ttl += x
  return ttl
def firstn(n):
  num = 0
  while num < n:
    yield num
    num += 1


theSum = mysum(firstn(1000000))
print(theSum)
```

```hs
sum (take 1000000 [0,1..])
```

### Excercises

- No more base case
- We do things infinitely

- We already have `[1..]`

- repeat a value ad naseum

```hs
repeat x = x:repeat x

cycle l = aux l
  where aux [] = aux l
        aux (h:t) = h:aux t
```

- cycle through values in a list

```hs
cycle' l = l ++ cycle' l
```

- redo `[1..]` from first principles

```hs
natFrom n = n:natFrom (n+1)
```

#### Test Question

- How Many Thunks are in this expression?

```hs
natFrom n = n:natFrom (n+1)
```

- Recall that there is 1 Thunk per expression
  - So it is just 2 Thunk recall that `:` is a function call

- Is `sum` fast or slow?

```hs
> l0 = [1..1000000000]
> l1 = take 10000000000 l0
> sum (take 10 l1) -- This is fast because you don't have to expand the entire l1
```

#### What will terminate?

```hs
foldl (||) False (repeat True)
foldr (||) False (repeat True)
```

- only `foldr` will terminate in this case

```hs
foldl (&&) True (repeat False)
foldr (&&) True (repeat False)
```

- The `foldr` will check the True && False first then finish

#### What is fast and what is slow?

```hs
l0 = [1..1000000000]
l1 = take 99999999 l0
x = 10 `elem` init l0
y = 9999999 `elem` init l0
```

All of these are fast since they are not actually using the variable.. They are just
bindings

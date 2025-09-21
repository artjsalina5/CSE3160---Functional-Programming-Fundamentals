module Lib (
  muls,
  divs,
  pows,
  facts,
  signs,
  splice,
  sint,
  tx,
  mysin,
  flatten,
  innerProduct,
  dedup,
  vigenereEnc,
  vigenereDec,
) where

import Data.Char

-- | Given a depth 2 list of lists produces a single flat list
flatten :: [[a]] -> [a]
flatten xss = foldr (++) [] xss

{- | Given two vectors of identical length, computes their inner product
[a,n] * [b,n]
-}
innerProduct :: (Num a) => [a] -> [a] -> a
innerProduct [] [] = 0
innerProduct as bs = sum (zipWith (*) as bs)

{- | Consider a finite list of values of some type [v0,v1,⋯,vk]
 where each value can repeat more than once at various location in the list. For instance, such a list with integers might be
\[
[1,6,4,2,0,1,2,1,0,8,42,9,7,1]
\]
Your task is to produce a function dedup that takes an input such a list and returns a new one where each value occurs at most once (it removes all the duplicates).
-}
dedup :: (Eq a) => [a] -> [a]
dedup [] = []
dedup (x : xs) = x : dedup (filter (/= x) xs)

{- | Encode a single /lowercase/ character with a /lowercase/ key character
using a Caesar-style shift.

The key encodes the shift as @\'a' → 0@, @\'b' → 1@, …, @\'z' → 25@.
-}

-- === Preconditions

-- * Both arguments are in the range @'a'..'z'@.

--
-- === Examples
-- >>> encodeChar 'a' 'j'   -- shift 0
-- 'j'
-- >>> encodeChar 'b' 'j'   -- shift +1
-- 'k'
-- >>> encodeChar 'z' 'j'   -- shift -1 (mod 26)
-- 'i'
--
encodeChar :: Char -> Char -> Char
encodeChar k ch =
  chr (((ord ch - base) + (ord k - base)) `mod` 26 + base)
 where
  base = ord 'a'

{- | Decode a single /lowercase/ character that was encoded with 'encodeChar'
using the same key (@\'a' → 0@, @\'b' → 1@, …, @\'z' → 25@).

=== Preconditions
* Both arguments are in the range @'a'..'z'@.
* The key used here must match the one used to encode.

=== Examples
>>> decodeChar 'b' 'k'
'j'
>>> decodeChar 'z' 'i'
'j'
-}
decodeChar :: Char -> Char -> Char
decodeChar 'a' ch = ch
decodeChar k ch =
  chr (((ord ch - base) - (ord k - base)) `mod` 26 + base)
 where
  base = ord 'a'

{- | Vigenère-encode a /lowercase/ text using a /lowercase/ key.

The input is split into “words” via 'Data.List.words' and rejoined with
'Data.List.unwords'. The key is /not/ restarted per word; it continues
across word boundaries and only wraps when the entire key is exhausted
(via 'Prelude.cycle').
-}

-- === Examples
-- >>> vigenereEnc "wonderful" "we are having so much fun with haskell"
-- "ss nui yfptju fr qlhb qqb jlxy mudgsyo"
-- -}
vigenereEnc :: [Char] -> String -> String
vigenereEnc [] txt = txt
vigenereEnc key txt = unwords (go (cycle key) (words txt))
 where
  go _ [] = []
  go ks (w : ws) = let (ks', w') = encWord ks w in w' : go ks' ws
  encWord ks w =
    let n = length w
        kc = take n ks
        ks' = drop n ks
     in (ks', zipWith encodeChar kc w)

{- | Vigenère-decode a /lowercase/ text that was encoded with 'vigenereEnc',
using the same /lowercase/ key.

The same caveats about 'words'/'unwords' apply: spacing is normalized and
punctuation (if any) would be lost. The key must be non-empty.

=== Preconditions
* Key is non-empty.
* Text was produced by 'vigenereEnc' under the same assumptions.

=== Example
>>> vigenereDec "wonderful" "ss nui yfptju fr qlhb qqb jlxy mudgsyo"
"we are having so much fun with haskell"
-}
vigenereDec :: [Char] -> String -> String
vigenereDec key txt = unwords (go (cycle key) (words txt))
 where
  go _ [] = []
  go ks (w : ws) = let (ks', w') = decWord ks w in w' : go ks' ws
  decWord ks w =
    let n = length w
        kc = take n ks
        ks' = drop n ks
     in (ks', zipWith decodeChar kc w)

{- | Multiply two lists element-wise (pointwise product). Stops when
either list runs out. Equivalent to @'Prelude.zipWith' (*)@.
-}

-- >>> take 10 $ muls [1,2..] [100,200..]
-- [100,400,900,1600,2500,3600,4900,6400,8100,10000]
-- -}
muls :: (Num a) => [a] -> [a] -> [a]
muls (x : xs) (y : ys) = x * y : muls xs ys
muls _ _ = []

-- | Element-wise division. Equivalent to @'Prelude.zipWith' (/)@.

-- ==== Examples
-- >>> take 5 $ divs [10,20..] [2,4..]
-- [5.0,5.0,5.0,5.0,5.0]
-- -}
divs :: (RealFloat a) => [a] -> [a] -> [a]
divs = zipWith (/)

{- | Infinite stream of powers of a number starting at exponent 0.

For input @x@ it returns
\[
[\,x^{0},\,x^{1},\,x^{2},\,x^{3},\ldots\,].
\]
Defined co-recursively as
\[
x^{n+1} = x \cdot x^{n}.
\]

==== Examples
>>> take 6 (pows 3)
[1,3,9,27,81,243]
-}
pows :: (Num t) => t -> [t]
pows x = 1 : muls (pows x) (repeat x)

{- | Infinite stream of factorials.

Produces
\[
[\,0!,\,1!,\,2!,\,3!,\,\ldots\,] = [\,1,\,1,\,2,\,6,\,\ldots\,],
\]
satisfying \((n+1)! = (n+1)\cdot n!\).

==== Examples
>>> take 7 facts
[1.0,1.0,2.0,6.0,24.0,120.0,720.0]
-}
facts :: [Double]
facts = 1 : muls facts [1 ..]

{- | Infinite stream of alternating signs:
\[
[\,1,\,-1,\,1,\,-1,\,\ldots\,].
\]

==== Examples
>>> take 6 signs
[1.0,-1.0,1.0,-1.0,1.0,-1.0]
-}
signs :: [Double]
signs = cycle [1, -1]

{- | Keep every other element from a list, starting with the first.

Given @[a₀,a₁,a₂,a₃,\ldots]@, returns @[a₀,a₂,a₄,\ldots]@.
Total on all (finite or infinite) lists.

==== Examples
>>> splice [0..10]
[0,2,4,6,8,10]
-}
splice :: [a] -> [a]
splice [] = []
splice [a] = [a]
splice (a : _ : t) = a : splice t

{- | Coefficients for the sine power series (odd terms only).
This yields the infinite sequence

\[
\left[\,\frac{(-1)^n}{(2n+1)!}\,\right]_{n=0}^{\infty} = \left[\,\frac{1}{1!},\,\frac{(-)1}{3!},\,\frac{1}{5!},\ldots\right]\]
constructed as alternating signs times reciprocals of odd factorials.

==== Examples
>>> take 5 sint
[1.0,-0.16666666666666666,0.008333333333333333,-0.0001984126984126984,2.7557319223985893e-6]
-}
sint :: [Double]
sint = muls signs $ splice $ divs (repeat 1) (tail facts)

{- | Infinite stream of sine-series terms evaluated at @x@.

This forms the sequence
\[
\left[\,\frac{(-1)^n}{(2n+1)!}\,x^{\,2n+1}\right]_{n=0}^{\infty}
= \left[\,x,\,-\frac{x^{3}}{3!},\,\frac{x^{5}}{5!},\ldots\right].
\]

==== Examples
>>> take 4 (tx 2)
[2.0,-1.3333333333333333,0.26666666666666666,-0.025396825396825397]
-}
tx :: Double -> [Double]
tx x = muls sint $ splice $ tail $ pows x

{- | Partial sums of the sine power series.

@mysin n x@ computes
\[
\sum_{k=0}^{n-1} \frac{(-1)^k}{(2k+1)!}\,x^{\,2k+1},
\]
i.e., the first @n@ terms of the Taylor series of @sin x@.

Larger @n@ generally improves accuracy, especially when @|x|@ is small.

==== Examples
>>> let approx n x = mysin n x in (approx 5 1.0, sin 1.0)
(0.8414682539682539,0.8414709848078965)
-}
mysin :: Int -> Double -> Double
mysin n x = sum $ take n $ tx x

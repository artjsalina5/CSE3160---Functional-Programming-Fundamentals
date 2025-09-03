fac 0 = 1
fac n = n * fac (n - 1)

if' True te _ = te
if' _ _ ee = ee

fib :: (Eq a, Num a) => a -> a
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

foo x y
  | x <= y = 'A'
  | x == y = 'B'
  | x == 7 * y = 'C'

sumn :: (Eq a, Num a) => a -> a
sumn 0 = 0
sumn n = n + (sumn $ n - 1)

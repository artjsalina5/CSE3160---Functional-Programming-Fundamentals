# Introduction
- Haskell
    - Dogma
    - REPL
    - Compilation
- Expressions
- Basic Types

## Haskell

- Pure functional language,

- No Assignments
    - i = i + 1 is not possible

- Data structures are immutable

- *static* and *strong*

- It supports *Type Inference* can compute types itself
    - There is major language the supports type inference as well: C++

    ```cpp
    auto performFunction(type a) {
        return a;
    }
    ```

- A *lazy* language: It only evaluates something when it needs to.
j
    - It only calculates when it needs the data. This is *lazy evaluation*
    - Delay calculations in the hope that they need not be performed.
    - Opposite is called *eager*. It computes everything as quick as it can.

- It is both interpreted.. and compiled

- It uses a new programming style that will shift the way you think forever.

## Read-Eval-Print-Loop

## The "Resolver"
- Stack is a Haskell "environment"
- multiple usable compilers for haskell within stack
- Must indicate the default

- Global file config
`~\home\usr\.stack\global-config\stack.yaml`

## The `ghc` Command

## Demo
```hs
ghci> 2
2
ghci> :t 2
2 :: Num p => p -- This is subserviant with the capabilities of a numeral
                -- this has capability of performing arithmetic
                -- this can be a Float, Double, integer. We don't know yet.
                -- Haskell does the least amount of commitment with auto types
ghci> 2 + 3     -- infix notation
5
ghci> :t 5
5 :: Num a => a
ghci> (+) 2 3   -- prefix notation
5
ghci> :t (+)   -- whats the type of plus?
(+) :: Num a => a -> a -> a -- a to a where a is a numeral. It returns a function that consumes the argument
                            -- it takes an a. spits out a. then does this one more time. numerals are all of the same kind.
ghci> :{                    -- If you want to write over several lines in the interpreter
ghci| 2
ghci| +
ghci| 3
ghci| :}
5
```

```hs

ghci> 3 + 3 * 4
15
ghci> (3 + 3) * 4
24
ghci> :t (3 + 3) * 4
(3 + 3) * 4 :: Num a => a
ghci> 3 :: Int              -- This is explicitely forcing the type
3
ghci> :t 3 :: Int           -- This is no longer a numeral. Int is a special kind of numeral.
3 :: Int :: Int
ghci> (3::Int) * 4          -- This forces 4 to become an interger
12
ghci> :t (3::Int) * 4       -- A single operation now makes the result spit out an integer
(3::Int) * 4 :: Int
ghci> "String"              -- Double quotes here create a string. All types start with an Uppercase
"String"
ghci> : "String"            -- Variables must start with lowerCase.
"String" :: String
```

```hs
ghci> x = 1                 -- This looks like an assignment. It is not one. this is just giving 1 the name x. A christening, if you will
1
ghci> :t x                  -- What is 1's type?
x :: Num a => a             -- Of course it's a Numeral
ghci> x = "String"          -- What is "String"'s type?
ghci> x                     -- What is x? 
"String"
ghci> :t x                  -- Did we just assign x to different values? No.
x :: String                 -- You don't kill the content of a memory cell to replace it with something else. It's just the most recent instance.
```
This is the concept of **Shadowing**.

### Danger

- Like Python
    - Haskell uses whitespace to convey semantics
    - Be careful with whitespace
    - Know what your text editor and what it does to spaces

## Demo cont.
```hs

ghci> let x = 42
ghci> x
42
ghci> let x = "Rabban" in x
"Rabban"
ghci> x
42
ghci> :{
ghci| let x = "Rabban" -- Notice
ghci|     y = "Nephew" -- Look at the indent here
ghci| in x ++ " " ++ y
ghci| :}
"Rabban Nephew"

ghci> x
42
ghci> :{
ghci| let {             -- This circumvents the need for indentation
ghci| x = "rabban";
ghci| y = "Nephew";
ghci| } in x ++ " " ++ y
ghci| :}
"rabban Nephew"
```

```hs
ghci> :{
ghci| let x = "first "
ghci| in x ++ let x = "second "
ghci|         in x ++ let x = "third "
ghci|                 in x
ghci| :}
"first second third "
```
You can nest let expressions like so.

### Defining a function
```hs
ghci> inc x = x + 1         -- We define the function here
ghci> :t inc
inc :: Num a => a -> a      -- function operates on a -> a and returns a numeral a
ghci> inc x = (+1) x
ghci> inc 3                 -- input 3
4
ghci> inc = (+1)            -- add 1
ghci> inc 3
4
ghci> :t (+)
(+) :: Num a => a -> a -> a -- notice how this adds another layer
ghci> :t (+2)
(+2) :: Num a => a -> a
ghci> :t inc
inc :: Num a => a -> a
```

- Give the name & formal argument name
- An equal sign
- An expression for the body
- Look at the types of (+) and inc
- (+) takes one argument and return a function that takes another!
- Both are *Polymorphic* and *Constrained*


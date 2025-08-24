# CSE3160 - Functional Programming Essentials

This repository serves as a backup of my work for this course.

All work is my own. Be forewarned: [The Student Code](https://community.uconn.edu/the-student-code/the-student-code-preamble/). UConn has a fair share of cheaters that were spawned during the Zoom days of the COVID-19 lockdown.

Fortunately, it turns out that this also certainly does not make you as bright as you think you are.
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣀⣀⣤⢤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣶⣿⣿⡿⣿⢿⣷⣽⣿⣿⣿⣷⣆⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣛⣽⣿⠿⠿⢻⣿⡟⣷⣼⣉⣿⣿⣿⣿⣟⠻⣿⣿⣟⢿⡦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⢏⣤⣶⣿⣿⣿⢹⣿⣿⡟⣿⣿⣿⣿⣿⣷⣄⣈⣻⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⣼⠿⣿⣇⣿⣿⣿⣿⣿⣿⣾⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡁⢿⣿⣟⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⢰⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣷⢸⣿⣿⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⣿⣿⣿⣿⣿⣿⡿⠛⣿⣿⡿⣿⡏⠉⢻⣿⣿⣿⣿⣿⣿⢸⣿⣿⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⢸⣿⣧⠀⢿⣿⣙⣿⣿⡟⠁⠀⠀⢸⠀⠘⠀⠀⠀⣿⣿⣿⣿⣿⣿⢸⣿⡏⢸⣿⡆⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⣿⣿⣿⣶⣻⡿⠋⣹⣿⡀⠀⠀⢀⣿⣀⠀⣀⣶⣴⣿⣿⣷⣿⣷⣦⣬⣻⣧⣼⣿⡇⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⣿⠟⣹⣿⢋⣀⣿⡿⠿⠿⠷⣶⢾⣿⡟⢙⣿⠿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣅⢻⣿⣷⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⢣⣾⣿⣿⣿⣿⡿⠿⠿⣿⣶⣦⣼⣿⣧⣤⣾⣿⣿⣛⣛⡛⠿⣿⣿⣿⡍⢿⣿⣟⣿⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⠋⠉⢛⣿⣿⣿⣿⣟⣿⣿⣿⣟⢉⣽⣿⣿⣷⣮⣿⣿⣿⣦⡀⣿⣾⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣷⣰⣿⣿⣿⡿⠋⠙⣿⣿⣿⣿⣿⣿⣿⣷⡜⣿⣧⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠁⠀⣿⣿⣯⣼⣿⣿⣿⣷⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣆⠀⠀⠀⠀⠀
            ⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣿⣿⣿⡿⣿⣿⣽⣤⣽⣛⣛⣛⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀
            ⠀⠀⣾⣿⣿⣿⣿⣿⣿⡿⣿⣿⣧⣬⣥⣴⡿⠿⣻⣧⣟⣿⣿⠿⠿⠿⢿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀
            ⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⣹⣿⣿⣿⣾⠋⠉⠹⣿⣿⣷⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡽⣷⠀⠀⠀
            ⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⢸⣿⣿⣿⣭⣦⣤⣤⣿⣿⡻⣷⣤⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡙⣇⠀⠀
            ⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⣴⢟⣿⡿⢻⣿⣿⣿⣿⣿⣿⣿⣌⣿⣟⢿⣟⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡹⡄⠀
            ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣧⣿⡿⣳⣿⣿⡟⢻⣿⣿⣿⣿⣿⣟⣿⣧⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢳⡀
            ⢿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣷⣿⣿⡿⠇⠸⠿⠸⢿⣟⣿⣿⣮⣱⢿⣿⡋⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠟⠁
            ⠀⠉⠙⠛⠛⠛⠛⠛⢛⣿⣿⣿⣀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣅⣸⣿⣷⣎⣿⣿⣯⣁⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣷⣦⣀⣀⣠⣠⣤⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀
            ⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠗⠀⠀
            ⠀⠀⠀⠘⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠀⣠⣾⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀
            ⠀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠉⠉⠉⠉⢉⣽⣿⣿⣄⣀⣴⣿⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣶⣦⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        Copyright (c) 2025 Arturo Salinas. All Rights Reserved.

## Overview
### Instructor and Class Time

    - **Instructor**: The one, the only Laurent Michel.
    - **Lecture**: Tuesday-Thursday 9:30-10:45AM. MCHU 201
    - **Lab**: Monday 9:05AM - 9:55AM. ITE 134

### Course Goals

    This course covers fundamental techniques in functional programming. With the primary focus on purely functional programming, the course explores how to handle state transformation and IO. The course introduces:

    - Elementary Types
    - Control Flow
    - Environments and Scoping
    - Closures
    - Typed Functional Programming Languages
    - Type Inference
    - Continuation Passing
    - Streams
    - Algebraic Data Types and Monads

### Textbook(s)

    - [Learn You a Haskell for Great Good!](https://learnyouahaskell.github.io/chapters.html)  
    - Programming in Haskell - Graham Hutton
    - Haskell Prgramming from first Principles - Christopher Allen, Julie Moronuki

### Structure

There are two weekly lectures of 75m for 150m total. The course evaluation will
include a midterm and a final where you will be expected to author code in
Haskell. You will be expected to complete 8-10 assignments over the course of
the semester. The language we will use, as hinted above, is ***Haskell***.

### Grading

| Percentage      | Description |
| -------------- | --------------- |
| *5%*| Participation. Come ready to be engaged directly. I will not put my phasors on stun.|
| *10%* | Assignments. 8-10 of them. Lowest is dropped unless it is the final homework.|
| *5%* | Labs. |
| *20%* | Test 1 |
| *20%* | Test 2 |
| *40%* | Test 3 |


### Lateness

I do not allow late submissions as a rule of thumb. The reason is that I wish to release solutions in
a timely manner so that you can properly prepare for the key assessments (the exams). Extensions
are counter-productive in this respect. If you are late, it’s a zero. Do recall that I drop one lowest
grade over the course of the semester.

### Automation

We will use automation for grading of homeworks. Exams are graded by the instructors (since on
paper). That means that you will know pretty quickly how well you did on the homeworks, but
there is no partial credit. It works or it does not work. Keep in mind that each automated
grading suite will have lots of test cases. So you may collect some grades even if you do not pass
all tests.

### Discussion groups and collaboration

The course material is available on moodle.
We maintain two electronic fora for the course: a news forum and a technical forum. The news
forum will be used to broadcast course announcements. The technical forum is meant to provide
answers to technical questions about course material. While specific questions pertaining to the
problem sets are obviously inappropriate (e.g., ”how do I solve problem 1?”), general questions are
very welcome as well as specific questions that do not directly relate to problem sets.
In addition, we will make use of Discord as a platform to encourage participation, communica-
tion, and support problem solving in groups.

### Academic Misconduct

Exams are to represent the sole effort of the student submitting the work. This precludes usage
or adaptation of material from the internet of from peers. That explicitely forbids the use of any
LLM. This will be discussed at length during the first lecture.
I enforce a zero-tolerance policy w.r.t. academic misconduct. Plagiarism is an extremely serious
issue, will be aggressively pursued according to the full extent of University regulations. I strongly
encourage students to re-familiarize with the Student Code. In addition, CSE3160 adopts the
following amplifications

Each case of plagiarism or academic misconduct will result in, at least, one letter grade
reduction for the final course grade in addition to a zero for the affected course deliv-
erable. Penalties may be more severe depending on the case. The penalties are applied
to all students involved in an incident. In all cases, incidents of plagiarism or academic
misconduct will be reported and filed at the department and the University. Any repeat
offender will receive an automatic ’F’ for the entire course. Academic misconduct on
an exam also earns an automatic ’F’ for the course.

### Rough syllabus

This is tentative only as the list of topics gets refined (and reordered).
-----------------------------------------
|1. Elementary data types and variables:|
|-----------------------------------------------------------------------------|
|• Immutability |
|• numeric, Boolean, string, and token expressions; |
|• binding and environments; |
|• function definition. (Optional topic: Function types.) |
|• Type inference |
|• data types |
|• class types |
|• let polymorphism |
|2. Elementary control flow:|
|------------------------------|
|• function application;|
|• conditional control flow;|
|• parameter passing with a discussion of various conventions|
|• Laziness | 
|• higher order functions; currying |
|• recursive evaluation and recursive decomposition of computational problems| 
|• tail recursion |
|• continuation passing style |

|3. MT1 on September 22 from 7PM to 9PM in MCHU 101 on paper |
|------------------------------------------------------------------------------|
| 4. Structured data:                                        |
|------------------------------------------------------------------------------|
|• structured recursive datatypes including trees and lists; |
|• abstract data types (list, queue, priority queue, set); |
|• binary search trees, heaps; |
|• sorting and selection algorithms; |
|• vectors, arrays (matrices); |
|5. MT2 on October 27 from 7PM to 9PM in MCHU 101 on paper|
|------------------------------------------------------------------------------|
| 6. Algebraic data Types |
|------------------------------------------------------------------------------|
| • Monoids |
| • Functor |
|  • Applicative |
|• Monads (IO/State) | 
|7. Concurrency |
|------------------------------------------------------------------------------|
|• Parallel operators |  
|• Threads and synchronization |
|8. Final During finals week. On paper. 
|----------------------------------------------------------------------------|
## Project Structure

```
.
..
README.md
books/
wk1/
wk2/
wk3/
etc.
```

<!-- vim: set spell tw=130 ts=4 expandtab: -->


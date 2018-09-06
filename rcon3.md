# The Ma~~n~~(th) Behind the Curtain: Uncovering the Research Propelling RChain

## Introductions

What are the open areas of research?

Important for more people to open up these ideas, for us to be speaking the same language

## RChain Collaborative Learning

[github.com/RChain-Collaborative-Learning](https://github.com/RChain-Collaborative-Learning/Welcome)

# Computational Calculus

##
1. Grammar
2. Equivalences
3. Reductions

## Grammar
 * Allows us to answer "Is this a valid program?"

## Equivalences
 * Corrects for the "fine grained" grammar constructions
 * "I love pizza and ice cream" = "I love ice cream and pizza"

## Reductions
 * Encodes the computation of our language

# Example Calculus

##

```
P,Q ::= 0
      | for(y <- x){ P }
      | x!(y)
      | (P | Q)

x,y ::= any variable name
```

## Valid terms

. . .

alice!(email)

. . .

0

. . .

alice!(email) | 0

. . .

for(email <- alice){ bob!(email) }

## Invalid terms:

. . .

0 |

. . .

for(x <- y) | Q

# Equivalences

. . .

P | 0 = P

. . .

P | Q = Q | P

. . .

(P | Q) | R = P | (Q | R)

# Reductions

. . .

x!(z) | for(y <- x){ P } => P{z/y}

## Example Reductions
fred!(hello) | for(message <- fred){ alice!(message) }

. . .

=>
alice!(hello)

. . .

lottery(alice) | lottery(bob) | for(name <- lottery){ name!(ticket) }

. . .

=>
alice!(ticket) | lottery(bob)
or
bob!(ticket) | lottery(alice)

# Lambda Calculus
```
M,N ::= x
        \lambda x.M
        (M N)

x,y ::= any variable name

(\lambda x.M N) => M{ N/x }
```

# Rho Calculus
```
P,Q ::= 0
        for(y <- x){ P }
        x!(P)
        *x
        P | Q

x,y ::= @P

x!(Q) | for(y <- x) { P } => P{ @Q/y }
```
## Further Reading
[The Polyadic pi-Calculus: a Tutorial](http://www.lix.polytechnique.fr/~fvalenci/papers/intro-ppi.pdf)
[A Reflective Higher-order Calculus](https://ac.els-cdn.com/S1571066105051893/1-s2.0-S1571066105051893-main.pdf?_tid=0ad47d71-eb14-4c7e-b6a2-118d2b26cfc0&acdnat=1536224941_1b9d9e6c392fa8abe04fa2e7b9787bd3)

# Categorical Semantics

Definition of a Category

Draw a Lawvere Theory for a Monoid

Draw enriched category

# Logic as a Distributive Law
Type as defined by the collection of things that satisfy the type

{apple, fire truck, banana} 

Type "Red" = {apple, fire truck}

Type "Fruit" = {apple, banana}

Type "Edible" = {apple, banana}

Fruit = Edible

##

N,M ::= 1
      | a prime number
      | N * M

1, 2, 3, 2*2, 5, 3*2, 7, 2*2*2, ...

A,B ::= 1
      | a prime number
      | A * B
      | A OR B
      | A AND B
      | NOT( A )
      | All
      | None

[[ All ]]     = {M}
[[ None ]]    = {}
[[ Not(A) ]]  = {M} - [[A]]
[[ A AND B ]] = [[A]] Intersect [[B]]
[[ A OR B ]]  = [[A]] Union [[B]]

[[ 1 ]]       = { m in {M} | m equiv 1 }
[[ A * B ]]   = { m in {M} | m equiv m1 * m2,
                             m1 in [[A]],
                             m2 in [[B]] }
[[ a prime number ]] = { m in {M} | m equiv the prime number }

[[ A * 2 ]] = all even numbers
[[ Not(A * 2) ]] = all odd numbers

[[ Not(Not(1) * Not(1)) AND Not(1) ]] = all prime numbers
[[ Not(Not(0) | Not(0)) AND Not(0) ]] = all single threaded processes

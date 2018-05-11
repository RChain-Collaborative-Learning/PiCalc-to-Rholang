# A Reflective Higher-order (Rho) Calculus

## 2.3 - 3.2
* Led by Jake Gillberg
* 11 May 2018
* [Meredith's Paper](https://ac.els-cdn.com/S1571066105051893/1-s2.0-S1571066105051893-main.pdf?_tid=87049592-146c-4e5c-bc0c-faeb5dae7a1d&acdnat=1525872456_b7d3df2719aee238da6de50e75ac47d1)

# Last week we...

#

## Reflection
<blockquote>...the ability of a computer pogram to examine, introspect, and modify its own structure and behavior at runtime."</blockquote> -Wikipedia

## Higher-order programming
Entities can operate on other entities of the same level. In functional programming land, this is the ability for functions to take functions as arguments, and return functions as results.


# Motiviation

##
The $\pi$-calculus is not a closed theory; it depends on a theory of names.

## So what?
All of the infinite sets we may use to implement names $\pi$-calculus are structured.

. . .

When names are structured, checking for name equality becomes a computation.

. . .

In implementation, the $\pi$-calculus fundamental theory of computation depends on some other form of computation inherent in structured names.

## What if...
There was a relationship between the structure of names and processes.

. . .

We would have a tighter theory of computation and a guide for implementation.

# The rho-calculus

##
$\rho$-calculus

## Names and Processes
Processes: usually presented as uppercase letters like $P, Q$.

. . .

Names: usually presented as lowercase letters like $x, y, z$. They are NOT the base elements of this calculus, they are constructed from processes.

# Grammar

## Constructing Processes
$P,Q ::=$

. . .

$0$ - null process

. . .

$x(y).P$ - input

. . .

$x \langle P \rangle$ - lift

. . .

$\urcorner x \ulcorner$ - drop

. . .

$P|Q$ - parallel

## Constructing Names
$x,y ::=$

. . .

$\ulcorner P \urcorner$ - quote

## What is missing?

## Free Names

. . . 

$FN(0)=\emptyset$

. . .

$FN(x(y).P)=\{x\} \cup (FN(P)\setminus \{y\})$

. . .

$FN(x \langle P \rangle)=\{x\}\cup FN(P)$

. . .

$FN(P | Q)=FN(P)\cup FN(Q)$

. . .

$FN(\urcorner x \ulcorner)=\{x\}$

## Bound Names
The names referenced in a process that are not free.

# Equivalences

## Structural Congruence
least congruence satisfying:

. . .

$P | 0 \equiv P \equiv 0 | P$

. . .

$P | Q \equiv Q | P$

. . .

$(P | Q) | R \equiv P | (Q | R)$

. . .

Alpha Equivalence - "re-naming" a free variable doesn't change a process.

## Alpha Equivalence

##
$x(z).w \langle y \langle \urcorner z \ulcorner \rangle \rangle \equiv x(v).w \langle y \langle \urcorner v \ulcorner \rangle \rangle$

. . .

We need to be able to deterime whether two names are equal to do a substitution.

. . .

If names are quoted processes, we need to determine whether two processes are "equal" to determine if the names are equal.

. . .

It would be nice if two structurally equivalent processes produced equivalent names.

. . .

But we got here trying to determine if two processes were equal...

##
Defining structural congruence of processes

. . .

Depends on equality of names

. . .

Which depends on process equivalence

. . .

We keep moving down quotes, until we hit the $0$ process, our grammer assures this.

## Name Equivalence
For now, assume we have process equivalence, and generate a name equivalence.

. . .

$\ulcorner \urcorner x \ulcorner \urcorner \equiv _N x$

. . .

If $P \equiv Q$ then $\ulcorner P \urcorner \equiv _N \ulcorner Q \urcorner$

## Completing Process Structural Equivalence
Now use name equivalence to define the substitution used by $\alpha$-equivalence.

##
$(x)\{\ulcorner Q \urcorner / \ulcorner P \urcorner\} =
\ulcorner Q \urcorner$ if $x \equiv _N \ulcorner P \urcorner $

$(x)\{\ulcorner Q \urcorner / \ulcorner P \urcorner\} =
\urcorner x \ulcorner$ otherwise

##
$(0)\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}} = 0$

##
$(R | S)\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}} =
(R)\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}} |
(S)\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}}$

##
$(x(y).R)\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}} =
(x)\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}(z).
((R\hat{\{z/y\}})\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}})$

$z$ is not $\ulcorner P \urcorner$, $\ulcorner Q \urcorner$, not in the free names of Q, and not in the names of R.

##
$(x \langle R \rangle)\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}} =
(x)\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}
\langle R\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}}\rangle$

##
$(\urcorner x \ulcorner)\hat{\{\ulcorner Q \urcorner / \ulcorner P \urcorner\}} =
Q$ if $x \equiv _N \ulcorner P \urcorner$, $\urcorner x \ulcorner$ otherwise

##
Note, no substitutions happen under a quote.

. . .

$w \langle y \langle \urcorner z \ulcorner \rangle \rangle
\hat{\{u/z\}} =
w \langle y \langle \urcorner u \ulcorner \rangle \rangle$

$w \langle \ulcorner y \langle \urcorner z \ulcorner \rangle \urcorner \rangle
\hat{\{u/z\}} =
w \langle \ulcorner y \langle \urcorner z \ulcorner \rangle \urcorner \rangle$

# Reductions

##
$\frac{x_0 \equiv _N x_1}
{x_0 \langle Q \rangle | x_1(y).P \rightarrow P\{\ulcorner Q \urcorner / y\}}$

# The Polyadic Pi Calculus: A Tutorial

## 2.3 - 3.2
* Led by Jake Gillberg
* 04 May 2018
* [Milner's Tutorial](https://pdfs.semanticscholar.org/5d25/0a3a14f68abb1ae0111d35b8220b4472b277.pdf)

# Last week we...

# Defining a programming language

##
1. Grammar
2. Equivalences
3. Reductions

## Grammar
 * Allows us to answer "Is this a valid program?"
 * The topic of session 1

## Equivalences
 * Corrects for the "fine grained" grammar constructions.
 * When we say "run P concurrently with Q" we want it to mean the same thing as "run Q concurrently with P".

## Reductions
 * Encode the computation of our language.
 * When $\overline{x}y$ meets $x(z)$ we want to say "this communication happens, and is irreversable".

# Some necessary definitions 

## Free & Bound Names
 * Bound Names are names under closure
 * Free Names are names which are not under closure, could be bound by a process prefix.

## What are the Free and Bound Names?

##
$x(y)$

 * Free Names: $x$
 * Bound Names: $y$

##
$\overline{x}y$

 * Free Names: $x, y$
 * Bound Names: None

## 
$(\nu x)(\nu y)\overline{x}y$

## 
$(\nu x)(\nu y)\overline{x}y$

 * Bound Names: $x, y$
 * Free Names: None

##
$((\nu x)(y(a).\overline{a}x + \overline{b}a)) | (\nu y)x(a).P$

##
$(\nu x)y(a).\overline{a}x + \overline{b}a | (\nu y)x(a).P$

 * Free Names: $a, b, y, x$ + Free Names in $P$
 * Bound Names: Bound names in $P$ that are not the free names listed above

# Equivalences

## 
$(N/\equiv,+,\varnothing)$ is a symmetric monoid

 * $N+\varnothing \equiv N$
 * $N+M \equiv M+N$
 * $(L+M)+N \equiv L+(M+N)$

## 
$(P/\equiv,|,\varnothing)$ is a symmetric monoid

 * $P|\varnothing \equiv P$
 * $P|Q \equiv Q|P$
 * $(P|Q)|S \equiv P|(Q|S)$

## 
$!P \equiv P|!P$

 * $!P$ signifies "infinite" concurrenty running copies of P, so adding another should not change the meaning of our program.

## 
$(\nu x)\varnothing \equiv \varnothing$

## 
$(\nu x)(\nu y)P \equiv (\nu y)(\nu x)P$

##
If $x$ is not a free name in $P$ then $(\nu x)(P|Q) \equiv P|(\nu x)Q$

# Reductions

## Communication (Comm) Rule - the only reduction
$\overline{x}z.Q | x(y).P \rightarrow P\{z/y\}|Q$

# Where reductions may apply
## Under composition
$\frac{P \rightarrow P'}{P|Q \rightarrow P'|Q}$

## Under restriction
$\frac{P \rightarrow P'}{(\nu x)P \rightarrow (\nu x)P'}$

# Structurally congruent terms have the same reductions.

# Where reductions do not apply

## Within a single summand
 * $\overline{x}y + x(z)$ Does not reduce
 * Only one of the atomic prefixes of a normal process may execute

## Beneath replication
 * By $!P \equiv P|!P$ we can always pull out a copy of $P$ that reduces

## Underneath a prefix (in this paper)
 * $u(v).(x(y)|\overline{x}z)$ Does not reduce
 * Prefixing an atomic action freezes a process

##
$\frac{Q \equiv P, P \rightarrow P', P' \equiv Q'}{Q \rightarrow Q'}$

# Derived forms

## Polyadic Communication
So far, we have seen "sends" and "recieves" that pass <b>one</b> name.
If we are thinking of processes as functions, we might want a function
that has an arity > 1.

## A naive attempt
$x(y).x(z).P | \overline{x}a.\overline{x}b$

## A naive attempt
$x(y).x(z).P | \overline{x}a.\overline{x}b | \overline{x}c.\overline{x}d$

## A naive attempt
$x(y).x(z).P | \overline{x}a.\overline{x}b | \overline{x}c.\overline{x}d$

$\rightarrow$
$x(z).P\{a/y\} | \overline{x}b | \overline{x}c.\overline{x}.d$

$\rightarrow$
$P\{a/y,c/z\} | \overline{x}b | \overline{x}d$

## We must synchronize on another name!
 * $x(y_1 \cdots y_n)$ means $x(w).w(y_1). \cdots .w(y_n)$
 * $\overline{x}(y_1 \cdots y_n)$ means $(\nu w)\overline{x}w.\overline{w}y_1. \cdots \overline{w}y_n$

## Modularity
 * Software engineers like to write abstracted, composable code.

## Example
 * Recieve 2 names, send the first name to the second name and the second name to the first name.
 * $\overline{y}z | \overline{z}y$
 * It would be nice to write something like $Tinder\_Match(y, z)$ whenever we need this functionality in our program.
 * <b>Without modifying our base language semantics</b>

## Again, synchonize on a name!
 * $S = \cdots Tinder\_Match(alice, bob).P$
 * $\hat{S} = \cdots \overline{x}(alice, bob).P$ where $x$ is not a name in $S$
 * $S = (\nu x)(!(x(y, z).(\overline{y}z | \overline{z}y)) | \hat{S})$

# Shoutout to Joshy

# Explorations

##
 * Complete exercises found in the text
 * We now have full information needed for Idris, KFramework Definition
 * [Dan has started on an Idris Definition](http://www.madmode.com/togl/picalc2)
 * (From Rinke) "say a process out loud"
 * More "Free Name, Bound Name" examples
 * Implement examples in JsonPi

# Up Next...

##
 * Language Definition / Proof Tools (Idris, K, Coq, Isabelle)
 * Continue with Milner's "Tutorial" text
 * Rho Calculus
 * LADL (type theory)
 * Programming in Rholang
 * RChain Implementation Details (Rspace, System Level Contracts)
 * Lambda Calculus
 * ...?

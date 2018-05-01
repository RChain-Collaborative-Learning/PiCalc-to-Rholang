# The Polyadic Pi Calculus: A Tutorial

## Introduction - Chapter 2.2
* Led by Jake Gillberg
* 04 April 2018
* [Milner's Tutorial](https://pdfs.semanticscholar.org/5d25/0a3a14f68abb1ae0111d35b8220b4472b277.pdf)
* [Recording on youtube](https://youtu.be/WO8rGA8AjD0)
* Converted from [original slides](https://docs.google.com/presentation/d/1fCvPIcxLKx8igoMguqNJoO_k-7wuPdbwMskHZ8Dq-C0/edit#slide=id.g37915d267d_2_26)

# Introductions

##

* What is your background?
* What do you hope to get out of this session?
* What do you hope to get out of this collaborative learning group in general?
* What is the name of a person that you love a lot?

# Pi Calc is a way to describe... Concurrent computation

##

<blockquote>... Many agents active at once and can influence each other's activity on the fly. We could treat these agents as lambda calc's "functional computers" receiving arguments and producing results.</blockquote>

Based on the notion of naming.

##

<blockquote>A way of describing and analyzing systems consisting of agents which interact among each other, and whose configurations or neighborhood is continually changing</blockquote>

##

<blockquote>Naming strongly presupposes independence. It is natural to assume that the namer and the named are co-existing (concurrent) entities.</blockquote>

<blockquote> Naming is inextricably confused with the act of communication.</blockquote>

<blockquote> Naming is used to locate and modify data.</blockquote>

##

<blockquote>Treat data-access and communication as te same thing.</blockquote> (data is a special kind of process. This is taken further with the rho calculus.)</blockquote>

<blockquote>Name channels, not entities.</blockquote>

# The Monadic Pi Calculus

## Names and Processes

Names: usually presented as lowercase letters like $x, y, z$. They are the base elements of this calculus, there is no way to construct them, they just exist

<!-- These dots insert a pause -->

. . .

Processes: usually presented as uppercase letters like $P, Q$. Processes that are not (structurally congruent to) $\emptyset$ (the empty, stopped, or “do nothing” process) have to be constructed using operations (atomic actions / prefixes) involving names.

## Prefixes / Atomic Actions $\pi$
* $\overline{x}y$ Output the channel / name / link name $x$
* $x(z)$ Input some name from the channel / name / link $x$ -- call it $z$
* Every process starts its life as $\emptyset$, and grows by adding prefixes.

## Normal Processes
Usually presented as uppercase letters like $M$, $N$, $L$

Ways to construct normal processes

* $M ::= \emptyset$
* $M ::= \pi.P$
* $M ::= N + L$
* $M ::= \sum_{i \in I} N_i$

## Not Normal (Keep Pi Calc Weird) Processes
Ways to construct non-normal processes

* $P | Q$
* $!P \rightarrow P | P | \cdots | P$
* $(\nu x)P$

# Examples (from section 2.2)

## Example 1

## Example 2


# Am I a process?

## Yes or No? Normal or not?

* $\overline{x}y.P$
. . .
* Process
* Normal

## Yes or No? Normal or not?
* $!N$
. . .
* Process
* Not Normal

## Yes or No? Normal or not?
* $P + N$
. . .
* Not a process
* Can't "sum" non-normal processes

## Yes or No? Normal or not?
* $N | M$
* Process
* Not normal

## Yes or No? Normal or not?
* $N | P$
. . .
* Process
* Not normal

## Expert level
* $!((\nu x) x(z).P) + N$
. . .
* Not a process
* The first item in the sum is not normal

## Expert level
* $\overline{x}y.!((\nu x) x(z).P) + N$
. . .
* Process
* Normal

## Expert level
* $\overline{x}y.(\nu x)x(z).\emptyset | N$
. . .
* Process
* Not normal

## Expert level
* $\overline{x}y.(\nu x)x(z).((\nu z)z(z).\emptyset | N)$
. . .
* Process
* Normal

# In Summary

## Process constructions
* $P::=\sum_{i \in I}\pi_i.P_i$
    * $I = \varnothing \rightarrow P::= \emptyset$
* $P::= P|Q$
* $P::= !P$
* $P::= (\nu x) P$

# After the session

## Up next (potentially)
* A more formal definition of behavior
* Things that we can prove about our programs
* Examples of programs that do things

## Explorations
* Create more interesting “Am I a process, and if I am, am I normal?” questions
* Use [JsonPi](https://github.com/glenbraun/JsonPi) to run / examine examples from section 2.2
* Create more interesting examples of Pi-Calc programs like the ones in section 2.2
* Find other process calculi / variants on the pi calculus, record the differences
* Learn the Lambda Calculus
* Start learning about language definition frameworks / languages: BNFC, KFramework
* Start learning about proof assistant frameworks: Coq, Isabelle

## Feedback

https://goo.gl/forms/ehT0jj4U3Wh4gA4l2

#KFramework Pi Calc definition
Create a KFramework definition of the Pi Calculus (challenge, do not use (or show the decomposition to) K Specialized Notation: Attributes, Contexts, Angle Brackets, Underscore Brackets)

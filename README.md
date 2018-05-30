# Collaborative learning sessions

Jake Gillberg organized a collaborative learning group around the pi calculus in April 2018. This repository is for the slides and other materials supporting the study group.

# Index

| Lesson | Date | Content | Readings | Links |
|---|---|---|---|---|
| 1 | 27 April 2018 | Pi Calculus, Intro and Grammar | [Milner's Tutorial, Ch. 1-2](https://pdfs.semanticscholar.org/5d25/0a3a14f68abb1ae0111d35b8220b4472b277.pdf) | [recording](https://youtu.be/WO8rGA8AjD0), [google slides (used in the presentation)](https://docs.google.com/presentation/d/1fCvPIcxLKx8igoMguqNJoO_k-7wuPdbwMskHZ8Dq-C0/edit?usp=sharing), [reveal slides (corrected, collaborative slides)](https://rchain-collaborative-learning.github.io/PiCalc-to-Rholang/lesson1.html)|
| 2 | 04 May 2018 | Pi Calculus, Structural Equivalence and Reduction | [Milner's Tutorial, 2.3 - 3.2](https://pdfs.semanticscholar.org/5d25/0a3a14f68abb1ae0111d35b8220b4472b277.pdf) | [recording](https://youtu.be/4E96yDkJj6g), [slides](https://rchain-collaborative-learning.github.io/PiCalc-to-Rholang/lesson2.html)
| 3 | 11 May 2018 | Rho Calculus, Language Specification | [Meredith's Introduction, Ch. 1-2](https://ac.els-cdn.com/S1571066105051893/1-s2.0-S1571066105051893-main.pdf?_tid=79929421-894d-474b-9f67-f42c88192ed2&acdnat=1526924064_963ef41f5be6181b43a365286f0226fc) | [recording part 1](https://youtu.be/dV7_ZvJOnU0), [recording part 2](https://youtu.be/vUyJSitFHU4), [slides](https://rchain-collaborative-learning.github.io/PiCalc-to-Rholang/lesson3.html)|
| 4 | 18 May 2018 | Rholang, Specification | [Rholang Spec 0.2](https://developer.rchain.coop/assets/rholang-spec-0.2.pdf), [Rholang Grammar](https://github.com/rchain/rchain/tree/cd6efc320d81c19b1cd3fde194607aa9d159ce21/rholang/src/main/bnfc) | [recording](https://youtu.be/7vqcdD7VmOM), [notes file](https://rchain-collaborative-learning.github.io/PiCalc-to-Rholang/lesson4.txt)|

# Repository
Slides are written in markdown format and saved in files named like `lesson1.md` They are converted to reveal.js format via [pandoc](https://pandoc.org). There is significant room for improvement in visual presentation.

`pandoc --standalone --katex --to revealjs --slide-level 2 --output lesson1.html lesson1.md`

* `--standalone` generates a complete document including headers
* `--katex` renders latex equations using nicely
* `--to revealjs` specifies the reveal.js output format. (Other formats may be supported later; see below)
* `--slide-level 2` Uses second-level headings to create 2d slideshow in reveal.js
* `--output lesson1.html` specifies the output file name
* `lesson1.md` is the input markdown file to be processed

# Pandoc
Some good references for how to use pandoc to make great slides.
* http://benschmidt.org/2014/11/07/building-outlines-for-markdown-documents-with-pandoc/
* https://andrewgoldstone.com/blog/2014/12/24/slides/
* http://pandoc.org/

## Other supported formats
TODO

# License
TODO: Choose a license

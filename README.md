# Collaborative learning sessions

Jake Gillberg organized a collaborative learning group around the pi calculus in April 2018. This repository is for the slides and other materials supporting the study group. The group follows along with Robin Milner's [Polyadic Pi Calculus: A Tutorial ](https://pdfs.semanticscholar.org/5d25/0a3a14f68abb1ae0111d35b8220b4472b277.pdf).

# Index

| Lesson | Date | Sections| Item |
|---|---|---|---|
| 1 | 04 April 2018 | 1.1 - 2.2 | [reveal slides](lesson1.html)|
| 1 | 04 April 2018 | 1.1 - 2.2 | [session recording](https://youtu.be/WO8rGA8AjD0)|

# Repository
Slides are written in markdown format and saved in files named like `lesson1.md` They are converted to reveal.js format via [pandoc](https://pandoc.org). There is significant room for improvement in visual presentation.

`pandoc --standalone --mathml --smart --to revealjs --slide-level 2 --output lesson1.html lesson1.md`

* `--standalone` generates a complete document including headers
* `--mathml` renders latex equations using mathML
* `--smart` renders en-dashes, em-dashes and some other stuff nicely
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

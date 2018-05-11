#!/bin/bash

for file in lesson*.md; do
  name=${file##*/}
  base=${name%.md}
  pandoc --standalone --katex --to revealjs --slide-level 2 --output "$base.html" "$file"
done

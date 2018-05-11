#!/bin/bash

wget "https://s3-us-west-1.amazonaws.com/pandoc-releases/pandoc"
chmod +x ./pandoc

for file in lesson*.md; do
  name=${file##*/}
  base=${name%.md}
  ./pandoc --standalone --katex --to revealjs --slide-level 2 --output "$base.html" "$file"
done

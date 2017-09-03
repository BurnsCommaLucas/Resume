#!/bin/bash

DIR=$(dirname $(realpath $0))
echo "$DIR"

# build pdf
echo building latex
echo '##########################################################'
pdflatex -file-line-error $DIR/resume.tex

# build html
echo '##########################################################'
echo building html
echo '##########################################################'

pandoc "$DIR/resume.tex" -o "$DIR/resume.html"

# misguided attempt to left aligh coursework
# sed -i -e 's/<dd><p>Computer Networks/<dd><p id="coursework">Computer Networks/' "$DIR/resume.html"

echo '</div>' >> "$DIR/resume.html"
echo '</body>' >> "$DIR/resume.html"
echo '</html>' >> "$DIR/resume.html"

cat "$DIR/header.html" "$DIR/resume.html" > "$DIR/resume.tmp"
mv -v "$DIR/resume.html" ~/.Trash
mv "$DIR/resume.tmp" "$DIR/resume.html"
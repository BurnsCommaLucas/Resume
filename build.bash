#!/bin/bash

DIR=$(dirname $(realpath $0))
echo "$DIR"

# build pdf
echo '##########################################################'
echo building latex
echo '##########################################################'
pdflatex -file-line-error $DIR/resume.tex

# build html
echo '##########################################################'
echo building html
echo '##########################################################'

pandoc "$DIR/resume.tex" -o "$DIR/resume.html"

# echo '</div>' >> "$DIR/resume.html"
# echo '</body>' >> "$DIR/resume.html"
# echo '</html>' >> "$DIR/resume.html"

cat "$DIR/header.html" "$DIR/resume.html" > "$DIR/resume.tmp"
mv -v "$DIR/resume.html" ~/.local/share/Trash/
mv "$DIR/resume.tmp" "$DIR/resume.html"
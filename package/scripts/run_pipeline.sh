#! /bin/bash

python3 scripts/countwords.py books/isles.txt data/isles.dat
python3 scripts/countwords.py books/abyss.txt data/abyss.dat

python3 scripts/plotcounts.py data/isles.dat img/isles.png
python3 scripts/plotcounts.py data/abyss.dat img/abyss.png

# Generate summary table
python3 scripts/testzipf.py data/abyss.dat data/isles.dat > results.txt

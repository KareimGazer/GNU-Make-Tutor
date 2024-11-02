# vars
# Make is actually a small programming language with many built-in functions
INTERPRETER = python3
COUNTER = scripts/countwords.py
PLOTTER = scripts/plotcounts.py
TESTER = scripts/testzipf.py
TEXT_FILES = $(wildcard books/*.txt)
DATA_FILES = $(patsubst books/%.txt, data/%.dat, $(TEXT_FILES))
IMG_FILES = $(patsubst books/%.txt, img/%.png, $(TEXT_FILES))

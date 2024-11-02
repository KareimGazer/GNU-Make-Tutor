# vars
INTERPRETER = python3
TEXT_FILES = $(wildcard books/*.txt)
DATA_FILES = $(patsubst books/%.txt, data/%.dat, $(TEXT_FILES))
IMG_FILES = $(patsubst books/%.txt, img/%.png, $(TEXT_FILES))

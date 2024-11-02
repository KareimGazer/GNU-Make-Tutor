# the key parts of a Makefile, rules, targets, dependencies and actions

# Count words.

.PHONY : all
all: results.txt pngs

# generate the data files
## dats        : Count words in text files.
.PHONY : dats
dats: data/isles.dat data/abyss.dat data/last.dat

data/%.dat: countwords.py books/%.txt 
	python3 $^ $@

# generate the plots
.PHONY : pngs
pngs: img/isles.png img/abyss.png img/last.png

img/%.png: plotcounts.py data/%.dat
	python3 $^ $@

# combine the results
## results.txt : Generate Zipf summary table.
results.txt: testzipf.py data/abyss.dat data/isles.dat data/last.dat
	python3 $^ > $@

# Clean
## clean       : Remove auto-generated files.
.PHONY : clean
clean:
	rm -f data/*.dat img/*.png results.txt

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


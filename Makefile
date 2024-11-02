# the key parts of a Makefile, rules, targets, dependencies and actions

# Count words.

.PHONY : all
all: results pngs

# generate the data files
## dats        : Count words in text files.
.PHONY : dats
dats: isles.dat abyss.dat last.dat

isles.dat: countwords.py books/isles.txt 
	python3 $^ $@

abyss.dat : countwords.py books/abyss.txt 
	python3 $^ $@

last.dat: countwords.py books/last.txt 
	python3 $^ $@

# generate the plots
.PHONY : pngs
pngs: isles.png abyss.png last.png

isles.png: plotcounts.py isles.dat
	python3 $^ $@

abyss.png : plotcounts.py abyss.dat
	python3 $^ $@

last.png : plotcounts.py last.dat
	python3 $^ $@

# combine the results
## results.txt : Generate Zipf summary table.
results: testzipf.py abyss.dat isles.dat last.dat
	python3 $^ > $@

# Clean
## clean       : Remove auto-generated files.
.PHONY : clean
clean:
	rm -f *.dat results.txt *.png

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


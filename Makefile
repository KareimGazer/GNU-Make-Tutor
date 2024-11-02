# the key parts of a Makefile, rules, targets, dependencies and actions

# Count words.

.PHONY : all
all: results pngs

# generate the data files
## dats        : Count words in text files.
.PHONY : dats
dats: isles.dat abyss.dat last.dat

isles.dat: books/isles.txt countwords.py
	python3 countwords.py $< $@

abyss.dat : books/abyss.txt countwords.py
	python3 countwords.py $< $@

last.dat: books/last.txt countwords.py
	python3 countwords.py $< $@

# generate the plots
.PHONY : pngs
pngs: isles.png abyss.png last.png

isles.png: isles.dat
	python3 plotcounts.py isles.dat isles.png

abyss.png : abyss.dat
	python3 plotcounts.py abyss.dat abyss.png

last.png : last.dat
	python3 plotcounts.py last.dat last.png

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


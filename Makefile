# the key parts of a Makefile, rules, targets, dependencies and actions

include config.mk

# Count words.

.PHONY : all # .PHONY for a target that is not a file
all: results.txt pngs

data/%.dat: countwords.py books/%.txt
	$(INTERPRETER) $^ $@

# generate the plots
## pngs        : Plot word counts.
.PHONY : pngs
pngs: $(IMG_FILES)

img/%.png: plotcounts.py data/%.dat
	$(INTERPRETER) $^ $@

# combine the results
## results.txt : Generate Zipf summary table.
results.txt: testzipf.py $(DATA_FILES)
	$(INTERPRETER) $^ > $@

# Clean
## clean       : Remove auto-generated files.
.PHONY : clean
clean:
	rm -f data/*.dat img/*.png results.txt

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


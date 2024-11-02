# the key parts of a Makefile, rules, targets, dependencies and actions

include config.mk

# Count words.

# By default, make runs the first target it finds in the Makefile, in this case your new all target.
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

# Make prints actions as it executes them.
# Using @ at the start of an action tells Make not to print this action.
# So, by using @echo instead of echo, we can see the result of echo (the variable’s value being printed)
# but not the echo command itself.
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


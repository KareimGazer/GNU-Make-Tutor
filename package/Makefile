# the key parts of a Makefile, rules, targets, dependencies and actions

include config.mk

# Count words.

# By default, make runs the first target it finds in the Makefile, in this case your new all target.
.PHONY : all # .PHONY for a target that is not a file
all: package

data/%.dat: $(COUNTER) books/%.txt
	$(INTERPRETER) $^ $@

# generate the plots
## pngs        : Plot word counts.
.PHONY : pngs
pngs: $(IMG_FILES)

img/%.png: $(PLOTTER) data/%.dat
	$(INTERPRETER) $^ $@

# combine the results
## results.txt : Generate Zipf summary table.
results.txt: $(TESTER) $(DATA_FILES)
	$(INTERPRETER) $^ > $@

.PHONY : package
package: results.txt pngs
	@mkdir -p package
	@cp -r data img scripts results.txt package
	@cp Makefile config.mk package
	@tar -czf package.tar.gz package

# Clean
## clean       : Remove auto-generated files.
.PHONY : clean
clean:
	rm -rf $(DATA_FILES) $(IMG_FILES) results.txt package package.tar.gz

# Make prints actions as it executes them.
# Using @ at the start of an action tells Make not to print this action.
# So, by using @echo instead of echo, we can see the result of echo (the variable’s value being printed)
# but not the echo command itself.
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


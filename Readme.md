# GUN-MAKE-Tutor

This is a simple make setup used to generate plots of the word frequency in sample books just to demonstrate the use of Make as a build tool.

Make is a general build tool that is not only used for C/C++ compilation but also provide dependency management in other software piplelines.

## Benefits

We generally write scripts not only to automate our work but also to document the steps so it can be reviewed - sometimes called **declarative configuration** in DevOps mindset.

However if some of our dependencies in the build pipeline have changed we are faced with two situations:

1. run the whole pipeline again
2. run parts of it by adding if conditions or env vars that customizes the execution path of our script

Make solves this for us by building a dependency tree and only building the parts that needs to be updated by looking at the timestamp of the dependent files and if changed then rebuild all artifcats that has that dependency from the root to the top of the dependency tree.

Makefiles save time by ensuring that automatically-generated artifacts (such as data files or plots) are only recreated when the files that were used to create these have changed in some way.

Through their notion of targets, dependencies, and actions, they serve as a form of documentation, recording dependencies between code, scripts, tools, configurations, raw data, derived data, plots, and papers.

## In A Nutshell
```bash
# rule
target: dependencies...
    Actions

# vars
DATA_FILES = data/isles.dat data/abyss.dat data/last.dat
$(DATA_FILES) # usage

# auto vars: specific for the rule
$@ # target
$^ # dependencies
$< # first dependency

# .PHONY
marks targets that does not corresponds to existing files
```

## Folder Struture
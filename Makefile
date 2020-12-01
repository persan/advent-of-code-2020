all:compile run

compile:
	gprbuild -p -j0

run:
	./bin/adventofcode-day_1-main

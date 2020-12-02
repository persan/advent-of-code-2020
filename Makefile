all:compile run

compile:
	gprbuild -p -j0

run:
	@for i in `ls ./bin/adventofcode-day_*-main| cut -f 2 -d _  |sort -n` ; do\
		echo ./bin/adventofcode-day_$$i;\
		./bin/adventofcode-day_$$i;\
	done

#
# This times spack solve with two environments -- clingo57 and clingo58
# for all packages listed in packages.txt
#
all: clingo571.csv clingo580.csv

REPS = 5

clingo571.csv:
	. ~/src/spack/share/spack/setup-env.sh && spack env activate clingo57 && \
	spack -t solve-benchmark run -r $(REPS) -o $@ ./packages.txt

clingo580.csv:
	. ~/src/spack/share/spack/setup-env.sh && spack env activate clingo58 && \
	spack -t solve-benchmark run -r $(REPS) -o $@ ./packages.txt

clean:
	rm -f instances/*

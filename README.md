# Clingo 5.7.1 vs. Clingo 5.8.0

This is a reproducer for comparing clingo 5.7.1 perforamnce to 5.8.0 performance.

To run, try running both `run-with-clingo.sh` and `run-with-pyclingo.py`:

## Clingo 5.7.1

```console
> time ./run-with-clingo.sh instances/mfem.lp
       17.58 real        16.96 user         0.43 sys
> time ./run-with-clingo.py instances/mfem.lp
SAT
       14.19 real        13.72 user         0.43 sys
```

## Clingo 5.8.0

```console
> time ./run-with-clingo.sh instances/mfem.lp
       17.33 real        16.75 user         0.42 sys
> time ./run-with-clingo.py instances/mfem.lp
SAT
       26.87 real        26.37 user         0.44 sys
```

You can see that the fastest is python in clingo 5.7.1, and the slowest is python in
clingo 5.8.0 ( by quite a bit). Runnign from the CLI is on similar with both, but slower
than running from python under clingo 5.7.1.

I would love it if all of these ran as fast as python in clingo 5.7.1.

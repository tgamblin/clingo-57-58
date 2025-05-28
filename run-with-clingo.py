#!/usr/bin/env python3

import os
import sys
import clingo

if len(sys.argv) < 2:
    print(f"usage: {sys.argv[0]} INSTANCE.lp")
    sys.exit(1)

instance = sys.argv[1]
if not os.path.exists(instance):
    print(f"No such input: {instance}")
    sys.exit(1)

control = clingo.Control()
control.configuration.configuration = "tweety"
control.configuration.solver.heuristic = "Domain"
control.configuration.solver.opt_strategy = "usc,one,1"

with open(instance, "r") as f:
    control.add("base", [], f.read())

for lp in [
    "program/concretize.lp",
    "program/display.lp",
    "program/heuristic.lp",
    "program/os_compatibility.lp",
]:
    control.load(lp)

control.ground([("base", [])])

print(control.solve())

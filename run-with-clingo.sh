#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: $0 INSTANCE.lp"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "No such input: $1"
    exit 1
fi

clingo \
    --outf=3 \
    --configuration=tweety \
    --opt-strategy=usc,one,1 \
    --heuristic=Domain \
    "$1" \
    program/concretize.lp \
    program/display.lp \
    program/heuristic.lp \
    program/os_compatibility.lp
